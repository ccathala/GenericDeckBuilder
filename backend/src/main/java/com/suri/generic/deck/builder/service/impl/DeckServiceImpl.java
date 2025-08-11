package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.request.DeckCardRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckColumnCreateRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckCardResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckSummaryResponseDTO;
import com.suri.generic.deck.builder.model.*;
import com.suri.generic.deck.builder.repository.*;
import com.suri.generic.deck.builder.service.DeckService;
import com.suri.generic.deck.builder.service.DeckVisualizationService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class DeckServiceImpl implements DeckService {

    private final DeckRepository deckRepository;
    private final DeckRulesetRepository rulesetRepository;
    private final GameRepository gameRepository;
    private final CardRepository cardRepository;
    private final DeckCardRepository deckCardRepository;
    private final DeckColumnGroupRepository deckColumnGroupRepository;
    private final DeckVisualizationService deckVisualizationService;

    @Override
    public DeckResponseDTO createDeck(DeckRequestDTO deckDTO, User owner) {
        // Créer le deck de base
        Deck deck = createBaseDeck(deckDTO, owner);

        // Créer la colonne par défaut
        createDefaultVisualizationColumn(deck.getId(), owner.getId());

        // Créer et assigner les cartes SI elles sont fournies
        if (deckDTO.getCards() != null && !deckDTO.getCards().isEmpty()) {
            createAndAssignCards(deck, deckDTO.getCards());
        }

        validateCardLimits(deck);
        return toResponseDto(deck);
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
        Deck deck = deckRepository.findById(deckId)
                .filter(d -> d.getOwner().getId().equals(user.getId()))
                .orElseThrow(() -> new IllegalArgumentException("Deck introuvable ou non autorisé"));

        deck.setName(request.getName());
        deck.setDescription(request.getDescription());

        List<DeckCard> existingCards = new ArrayList<>(deck.getCards());

        Game game = gameRepository.findById(request.getGameId())
                .orElseThrow(() -> new IllegalArgumentException("Jeu introuvable"));
        deck.setGame(game);

        deck.getCards().clear();
        deckRepository.flush();

        // Add new cards
        List<DeckCardRequestDTO> newCards = new ArrayList<>();
        for (DeckCardRequestDTO cardDto : request.getCards()) {

            Optional<DeckCard> existingCardOpt = existingCards.stream()
                    .filter(c -> c.getCard().getId().equals(cardDto.getCardId()))
                    .findFirst();

            DeckCard deckCard = null;

            if (existingCardOpt.isPresent()) {
                // Update existing card
                deckCard = existingCardOpt.get();
                deckCard.setQuantity(cardDto.getQuantity());
            } else {
                Card card = cardRepository.findById(cardDto.getCardId())
                        .orElseThrow(() -> new IllegalArgumentException("Carte introuvable : " + cardDto.getCardId()));

                // Create new card
                deckCard = new DeckCard();
                deckCard.setDeck(deck);
                deckCard.setCard(card);
                deckCard.setQuantity(cardDto.getQuantity());
                newCards.add(cardDto);
            }

            deck.getCards().add(deckCard);
        }

        // Assign new cards to default column
        assignCardsToDefaultColumn(deck, newCards);

        // New validation: only block excess cards per individual card
        validateCardLimits(deck);

        return toResponseDto(deckRepository.save(deck));
    }

    @Override
    public void deleteDeck(UUID id, User owner) {
        Deck existing = deckRepository.findById(id)
                .filter(d -> d.getOwner().getId().equals(owner.getId()))
                .orElseThrow(() -> new EntityNotFoundException("Deck not found or access denied"));
        deckRepository.delete(existing);
    }

    /**
     * Validation flexible : autorise les decks avec peu de cartes,
     * mais bloque les excès par carte individuelle
     */
    private void validateCardLimits(Deck deck) {
        Optional<DeckRuleset> rulesetOpt = rulesetRepository.findByGame(deck.getGame());

        if (rulesetOpt.isPresent()) {
            DeckRuleset rules = rulesetOpt.get();

            // Only check excess cards per individual card (not minimum total)
            for (DeckCard deckCard : deck.getCards()) {
                if (deckCard.getQuantity() > rules.getMaxCopiesPerCard()) {
                    throw new IllegalArgumentException("Au moins une carte dépasse le nombre d'exemplaires autorisés");
                }
            }
        }
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
                cards,
                deck.getNotes());
    }

    public DeckSummaryResponseDTO toSummaryDto(Deck deck) {
        return new DeckSummaryResponseDTO(
                deck.getId().toString(),
                deck.getName(),
                calculateTotalCards(deck),
                getDisplayImageUrl(deck));
    }

    @Override
    public Integer calculateTotalCards(Deck deck) {
        if (deck.getCards() == null) {
            return 0;
        }
        return deck.getCards().stream()
                .mapToInt(DeckCard::getQuantity)
                .sum();
    }

    @Override
    public String getDisplayImageUrl(Deck deck) {
        // Si une carte d'affichage est définie, utiliser son image
        if (deck.getDisplayCard() != null) {
            return getCardImageUrl(deck.getDisplayCard());
        }

        // Sinon, utiliser la première carte du deck s'il y en a
        return getDefaultDisplayCard(deck);
    }

    @Override
    public String getDefaultDisplayCard(Deck deck) {
        if (deck.getCards() != null && !deck.getCards().isEmpty()) {
            return getCardImageUrl(deck.getCards().get(0).getCard());
        }

        // Retourner null si aucune carte n'est disponible
        return null;
    }

    private String getCardImageUrl(Card card) {
        if (card.getLocalizations() == null || card.getLocalizations().isEmpty()) {
            return null;
        }

        // Essayer d'abord avec la locale "fr", puis avec la première disponible
        return card.getLocalizations().stream()
                .filter(l -> "fr".equalsIgnoreCase(l.getId().getLocale()))
                .findFirst()
                .map(CardLocalization::getImageUrl)
                .orElse(
                        card.getLocalizations().get(0).getImageUrl());
    }

    /**
     * Assigne automatiquement les cartes à la colonne par défaut "Deck"
     */
    private void assignCardsToDefaultColumn(Deck deck, List<DeckCardRequestDTO> cardRequestDTOs) {
        try {
            // Trouver la colonne par défaut (displayOrder = 0)
            Optional<DeckColumnGroup> defaultColumnOpt = deckColumnGroupRepository
                    .findByDeckIdAndDisplayOrder(deck.getId(), 0);

            if (defaultColumnOpt.isEmpty()) {
                log.warn("Aucune colonne par défaut trouvée pour le deck {}", deck.getId());
                return;
            }

            DeckColumnGroup defaultColumn = defaultColumnOpt.get();

            // Obtenir la position max actuelle dans la colonne
            int maxPosition = deckCardRepository.findByColumnGroupId(defaultColumn.getId())
                    .stream()
                    .mapToInt(DeckCard::getPositionInColumn)
                    .max()
                    .orElse(-1);

            int nextPosition = maxPosition + 1;

            // Assigner chaque carte à la colonne par défaut
            for (DeckCardRequestDTO cardDto : cardRequestDTOs) {
                // Trouver la DeckCard correspondante
                Optional<DeckCard> deckCardOpt = deck.getCards().stream()
                        .filter(dc -> dc.getCard().getId().equals(cardDto.getCardId()))
                        .findFirst();

                if (deckCardOpt.isPresent()) {
                    DeckCard deckCard = deckCardOpt.get();
                    deckCard.setColumnGroup(defaultColumn);
                    deckCard.setPositionInColumn(nextPosition++);

                    log.debug("Carte {} assignée à la colonne {} en position {}",
                            deckCard.getCard().getId(), defaultColumn.getName(), deckCard.getPositionInColumn());
                }
            }

            log.info("Assignation de {} cartes à la colonne par défaut '{}' du deck {}",
                    cardRequestDTOs.size(), defaultColumn.getName(), deck.getId());

        } catch (Exception e) {
            log.warn("Erreur lors de l'assignation des cartes à la colonne par défaut pour le deck {}: {}",
                    deck.getId(), e.getMessage());
        }
    }

    /**
     * Crée automatiquement une colonne par défaut "Deck" pour la visualisation
     * lors de la création d'un nouveau deck
     */
    private void createDefaultVisualizationColumn(UUID deckId, Long userId) {
        try {
            DeckColumnCreateRequestDTO defaultColumnDTO = new DeckColumnCreateRequestDTO();
            defaultColumnDTO.setName("Deck");
            defaultColumnDTO.setColorHex("#6B7280");

            deckVisualizationService.createColumnGroup(deckId, defaultColumnDTO, userId);

            log.info("Colonne par défaut 'Deck' créée pour le deck {} (utilisateur {})", deckId, userId);
        } catch (Exception e) {
            // Log l'erreur mais ne pas faire échouer la création du deck
            log.warn("Impossible de créer la colonne par défaut pour le deck {} (utilisateur {}): {}",
                    deckId, userId, e.getMessage());
        }
    }

    /**
     * Crée le deck de base sans les cartes
     */
    private Deck createBaseDeck(DeckRequestDTO deckDTO, User owner) {
        Deck deck = new Deck();
        deck.setName(deckDTO.getName());
        deck.setDescription(deckDTO.getDescription());
        deck.setOwner(owner);

        Game game = gameRepository.findById(deckDTO.getGameId())
                .orElseThrow(() -> new IllegalArgumentException("Jeu introuvable"));
        deck.setGame(game);

        return deckRepository.save(deck);
    }

    /**
     * Crée les DeckCard et les assigne à la colonne par défaut
     */
    private void createAndAssignCards(Deck deck, List<DeckCardRequestDTO> cardRequestDTOs) {
        if (cardRequestDTOs == null || cardRequestDTOs.isEmpty()) {
            return;
        }

        // Créer les DeckCard
        for (DeckCardRequestDTO cardDto : cardRequestDTOs) {
            Card card = cardRepository.findById(cardDto.getCardId())
                    .orElseThrow(() -> new IllegalArgumentException("Carte introuvable : " + cardDto.getCardId()));

            DeckCard deckCard = new DeckCard();
            deckCard.setDeck(deck);
            deckCard.setCard(card);
            deckCard.setQuantity(cardDto.getQuantity());

            deck.getCards().add(deckCard);
        }

        // Sauvegarder les cartes
        deckRepository.save(deck);

        // Assigner à la colonne par défaut
        assignCardsToDefaultColumn(deck, cardRequestDTOs);
    }

    @Override
    @Transactional
    public DeckResponseDTO updateDeckNotes(UUID deckId, String notes, User user) {
        Deck deck = deckRepository.findById(deckId)
                .filter(d -> d.getOwner().getId().equals(user.getId()))
                .orElseThrow(() -> new IllegalArgumentException("Deck introuvable ou non autorisé"));

        deck.setNotes(notes);
        deckRepository.save(deck);

        return toResponseDto(deck);
    }
}
