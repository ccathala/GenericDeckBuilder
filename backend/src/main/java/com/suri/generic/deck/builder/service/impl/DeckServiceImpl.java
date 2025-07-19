package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.request.DeckCardRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckCardResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckSummaryResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckValidationResponseDTO;
import com.suri.generic.deck.builder.model.*;
import com.suri.generic.deck.builder.repository.*;
import com.suri.generic.deck.builder.service.DeckService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@RequiredArgsConstructor
public class DeckServiceImpl implements DeckService {

    private final DeckRepository deckRepository;
    private final DeckRulesetRepository rulesetRepository;
    private final GameRepository gameRepository;
    private final CardRepository cardRepository;
    private final DeckCardRepository deckCardRepository;

    @Override
    public DeckResponseDTO createDeck(DeckRequestDTO deckDTO, User owner) {
        Deck deck = new Deck();
        deck.setName(deckDTO.getName());
        deck.setDescription(deckDTO.getDescription());
        deck.setOwner(owner);

        Game game = gameRepository.findById(deckDTO.getGameId())
                .orElseThrow(() -> new IllegalArgumentException("Jeu introuvable"));
        deck.setGame(game);

        List<DeckCard> deckCards = new ArrayList<>();
        for (DeckCardRequestDTO cardDto : deckDTO.getCards()) {
            Card card = cardRepository.findById(cardDto.getCardId())
                    .orElseThrow(() -> new IllegalArgumentException("Carte introuvable : " + cardDto.getCardId()));

            DeckCard deckCard = new DeckCard();
            deckCard.setCard(card);
            deckCard.setQuantity(cardDto.getQuantity());
            deckCard.setDeck(deck);

            deckCards.add(deckCard);
        }

        deck.setCards(deckCards);

        if (!isDeckValid(deck)) {
            throw new IllegalArgumentException("Deck invalide pour ce jeu");
        }

        return toResponseDto(deckRepository.save(deck));
    }

    @Override
    public DeckResponseDTO getDeck(UUID id, User owner) {
        return toResponseDto(deckRepository.findById(id)
                .filter(deck -> deck.getOwner().getId().equals(owner.getId()))
                .orElseThrow(() -> new IllegalArgumentException("Deck introuvable ou non autorisé")));
    }

    @Override
    public List<DeckSummaryResponseDTO> getAllDecks(User owner) {
        return deckRepository.findAllByOwner(owner).stream()
                .map(this::toSummaryDto)
                .toList();
    }

    @Transactional
    @Override
    public DeckResponseDTO updateDeck(UUID deckId, DeckRequestDTO request, User user) {
        return updateDeck(deckId, request, user, true);
    }

    @Transactional
    @Override
    public DeckResponseDTO updateDeck(UUID deckId, DeckRequestDTO request, User user, boolean enforceValidation) {
        Deck deck = deckRepository.findById(deckId)
                .filter(d -> d.getOwner().getId().equals(user.getId()))
                .orElseThrow(() -> new IllegalArgumentException("Deck introuvable ou non autorisé"));

        deck.setName(request.getName());
        deck.setDescription(request.getDescription());

        Game game = gameRepository.findById(request.getGameId())
                .orElseThrow(() -> new IllegalArgumentException("Jeu introuvable"));
        deck.setGame(game);

        deck.getCards().clear();
        deckRepository.flush();

        // Ajoute les nouvelles cartes
        for (DeckCardRequestDTO cardDto : request.getCards()) {
            Card card = cardRepository.findById(cardDto.getCardId())
                    .orElseThrow(() -> new IllegalArgumentException("Carte introuvable : " + cardDto.getCardId()));

            DeckCard deckCard = new DeckCard();
            deckCard.setDeck(deck);
            deckCard.setCard(card);
            deckCard.setQuantity(cardDto.getQuantity());

            deck.getCards().add(deckCard);
        }

        if (enforceValidation && !isDeckValid(deck)) {
            throw new IllegalArgumentException("Deck invalide pour ce jeu");
        }

        Deck savedDeck = deckRepository.save(deck);
        DeckResponseDTO response = toResponseDto(savedDeck);

        // Ajouter le statut de validation à la réponse
        if (!enforceValidation) {
            // Ici on pourrait ajouter un flag isValid dans le DTO
            // Pour l'instant on laisse tel quel
        }

        return response;
    }

    @Override
    public void deleteDeck(UUID id, User owner) {
        Deck existing = deckRepository.findById(id)
                .filter(d -> d.getOwner().getId().equals(owner.getId()))
                .orElseThrow(() -> new EntityNotFoundException("Deck not found or access denied"));
        deckRepository.delete(existing);
    }

    @Override
    public boolean isDeckValid(Deck deck) {
        return rulesetRepository.findByGame(deck.getGame())
                .map(rules -> {
                    int totalCards = deck.getCards().stream()
                            .mapToInt(DeckCard::getQuantity)
                            .sum();
                    boolean minOk = totalCards >= rules.getMinCards();
                    boolean maxOk = deck.getCards().stream()
                            .allMatch(dc -> dc.getQuantity() <= rules.getMaxCopiesPerCard());
                    return minOk && maxOk;
                })
                .orElse(true); // No ruleset → valid
    }

    @Override
    public DeckValidationResponseDTO validateDeckRequest(DeckRequestDTO deckRequestDTO, User user) {
        Game game = gameRepository.findById(deckRequestDTO.getGameId())
                .orElseThrow(() -> new IllegalArgumentException("Jeu introuvable"));

        // Créer un deck temporaire pour la validation
        Deck tempDeck = new Deck();
        tempDeck.setGame(game);
        tempDeck.setName(deckRequestDTO.getName());
        tempDeck.setDescription(deckRequestDTO.getDescription());

        List<DeckCard> tempCards = new ArrayList<>();
        for (DeckCardRequestDTO cardDto : deckRequestDTO.getCards()) {
            Card card = cardRepository.findById(cardDto.getCardId())
                    .orElseThrow(() -> new IllegalArgumentException("Carte introuvable : " + cardDto.getCardId()));

            DeckCard deckCard = new DeckCard();
            deckCard.setCard(card);
            deckCard.setQuantity(cardDto.getQuantity());
            deckCard.setDeck(tempDeck);
            tempCards.add(deckCard);
        }
        tempDeck.setCards(tempCards);

        return validateDeck(tempDeck);
    }

    private DeckValidationResponseDTO validateDeck(Deck deck) {
        List<DeckValidationResponseDTO.ValidationMessageDTO> messages = new ArrayList<>();
        List<DeckValidationResponseDTO.DeckStatisticsDTO.CardViolationDTO> cardViolations = new ArrayList<>();

        int totalCards = deck.getCards().stream()
                .mapToInt(DeckCard::getQuantity)
                .sum();
        int uniqueCards = deck.getCards().size();

        boolean isValid = true;

        // Récupérer les règles du jeu
        Optional<DeckRuleset> rulesetOpt = rulesetRepository.findByGame(deck.getGame());

        if (rulesetOpt.isPresent()) {
            DeckRuleset rules = rulesetOpt.get();

            // Vérifier le minimum de cartes
            if (totalCards < rules.getMinCards()) {
                isValid = false;
                messages.add(DeckValidationResponseDTO.ValidationMessageDTO.builder()
                        .type(DeckValidationResponseDTO.ValidationMessageDTO.MessageType.ERROR)
                        .messageCode("deck.validation.min_cards")
                        .defaultMessage("Minimum " + rules.getMinCards() + " cards required, current: " + totalCards)
                        .parameters(new Object[] { rules.getMinCards(), totalCards })
                        .build());
            }

            // Vérifier le maximum de copies par carte
            for (DeckCard deckCard : deck.getCards()) {
                if (deckCard.getQuantity() > rules.getMaxCopiesPerCard()) {
                    isValid = false;
                    String cardName = deckCard.getCard().getId(); // On pourrait récupérer le nom localisé

                    messages.add(DeckValidationResponseDTO.ValidationMessageDTO.builder()
                            .type(DeckValidationResponseDTO.ValidationMessageDTO.MessageType.ERROR)
                            .messageCode("deck.validation.max_copies")
                            .defaultMessage(
                                    "Card " + cardName + " exceeds maximum " + rules.getMaxCopiesPerCard() + " copies")
                            .parameters(new Object[] { cardName, rules.getMaxCopiesPerCard() })
                            .build());

                    cardViolations.add(DeckValidationResponseDTO.DeckStatisticsDTO.CardViolationDTO.builder()
                            .cardId(deckCard.getCard().getId())
                            .cardName(cardName)
                            .currentQuantity(deckCard.getQuantity())
                            .maxAllowed(rules.getMaxCopiesPerCard())
                            .excess(deckCard.getQuantity() - rules.getMaxCopiesPerCard())
                            .build());
                }
            }
        }

        // Si pas d'erreurs, ajouter message de succès
        if (isValid) {
            messages.add(DeckValidationResponseDTO.ValidationMessageDTO.builder()
                    .type(DeckValidationResponseDTO.ValidationMessageDTO.MessageType.INFO)
                    .messageCode("deck.validation.success")
                    .defaultMessage("Deck is valid for competitive play")
                    .build());
        }

        return DeckValidationResponseDTO.builder()
                .isValid(isValid)
                .messages(messages)
                .appliedRules(rulesetOpt.map(rules -> DeckValidationResponseDTO.DeckRulesetDTO.builder()
                        .gameId(deck.getGame().getId())
                        .minCards(rules.getMinCards())
                        .maxCopiesPerCard(rules.getMaxCopiesPerCard())
                        .build()).orElse(null))
                .statistics(DeckValidationResponseDTO.DeckStatisticsDTO.builder()
                        .totalCards(totalCards)
                        .uniqueCards(uniqueCards)
                        .cardViolations(cardViolations)
                        .build())
                .build();
    }

    public DeckResponseDTO toResponseDto(Deck deck) {
        List<DeckCardResponseDTO> cards = deck.getCards().stream()
                .map(c -> new DeckCardResponseDTO(c.getCard().getId(), c.getQuantity()))
                .toList();

        return new DeckResponseDTO(
                deck.getId().toString(),
                deck.getName(),
                deck.getDescription(),
                deck.getGame().getId(),
                cards);
    }

    public DeckSummaryResponseDTO toSummaryDto(Deck deck) {
        return new DeckSummaryResponseDTO(
                deck.getId().toString(),
                deck.getName());
    }
}
