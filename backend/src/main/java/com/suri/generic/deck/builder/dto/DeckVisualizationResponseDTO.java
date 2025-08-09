package com.suri.generic.deck.builder.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

/**
 * DTO de réponse pour la visualisation complète d'un deck
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DeckVisualizationResponseDTO {

    @JsonProperty("deck_id")
    private String deckId;

    @JsonProperty("deck_name")
    private String deckName;

    @JsonProperty("column_groups")
    private List<DeckColumnGroupDTO> columnGroups; // Toutes les cartes sont assignées à une colonne

    @JsonProperty("total_cards")
    private int totalCards;

    @JsonProperty("has_default_columns")
    private boolean hasDefaultColumns; // Indique si les colonnes par défaut ont été créées
}
