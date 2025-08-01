package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.request.DeckCardRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckCardResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckSummaryResponseDTO;
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

        // New validation: only block excess cards per individual card
        validateCardLimits(deck);

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

        // Add new cards
        for (DeckCardRequestDTO cardDto : request.getCards()) {
            Card card = cardRepository.findById(cardDto.getCardId())
                    .orElseThrow(() -> new IllegalArgumentException("Carte introuvable : " + cardDto.getCardId()));

            DeckCard deckCard = new DeckCard();
            deckCard.setDeck(deck);
            deckCard.setCard(card);
            deckCard.setQuantity(cardDto.getQuantity());

            deck.getCards().add(deckCard);
        }

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
                cards);
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
}
