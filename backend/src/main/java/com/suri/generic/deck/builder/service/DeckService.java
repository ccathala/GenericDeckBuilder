package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckSummaryResponseDTO;
import com.suri.generic.deck.builder.model.Deck;
import com.suri.generic.deck.builder.model.User;

import java.util.List;
import java.util.UUID;

public interface DeckService {
    DeckResponseDTO createDeck(DeckRequestDTO deckDTO, User owner);

    DeckResponseDTO getDeck(UUID id, User owner);

    List<DeckSummaryResponseDTO> getAllDecks(User owner);

    DeckResponseDTO updateDeck(UUID deckId, DeckRequestDTO deckRequestDTO, User user);

    void deleteDeck(UUID id, User owner);

    DeckResponseDTO toResponseDto(Deck deck);

    DeckSummaryResponseDTO toSummaryDto(Deck deck);
}
