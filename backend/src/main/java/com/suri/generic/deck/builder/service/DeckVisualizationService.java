package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.dto.DeckVisualizationResponseDTO;
import com.suri.generic.deck.builder.dto.DeckColumnGroupDTO;
import com.suri.generic.deck.builder.dto.request.DeckColumnCreateRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckColumnUpdateRequestDTO;

import java.util.UUID;

/**
 * Interface du service gérant la visualisation des decks avec colonnes
 * personnalisables
 */
public interface DeckVisualizationService {

        /**
         * Récupère la visualisation complète d'un deck
         */
        DeckVisualizationResponseDTO getDeckVisualization(UUID deckId, Long userId);

        /**
         * Crée une nouvelle colonne de visualisation
         */
        DeckColumnGroupDTO createColumnGroup(UUID deckId, DeckColumnCreateRequestDTO requestDTO, Long userId);

        /**
         * Met à jour une colonne existante
         */
        DeckColumnGroupDTO updateColumnGroup(UUID deckId, UUID columnGroupId, DeckColumnUpdateRequestDTO requestDTO,
                        Long userId);

        /**
         * Supprime une colonne de visualisation
         */
        void deleteColumnGroup(UUID deckId, UUID columnGroupId, Long userId);

        /**
         * Déplace une carte vers une position spécifique (même colonne ou colonne
         * différente)
         */
        void moveCard(UUID deckId, String cardIdentifier, UUID sourceColumnId, UUID targetColumnId,
                        Integer targetPosition, Long userId);
}
