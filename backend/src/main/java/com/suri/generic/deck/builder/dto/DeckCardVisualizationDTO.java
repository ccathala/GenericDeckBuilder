package com.suri.generic.deck.builder.dto;

import lombok.Data;
import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.suri.generic.deck.builder.dto.response.CardResponseDTO;

/**
 * DTO représentant une carte dans le contexte de la visualisation des decks
 * Compose les données de carte pure avec les données contextuelles du deck
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DeckCardVisualizationDTO {

    @JsonProperty("card")
    private CardResponseDTO card; // Données de carte pure

    @JsonProperty("quantity")
    private Integer quantity; // Contexte deck - quantité dans le deck

    @JsonProperty("position_in_column")
    private Integer positionInColumn; // Contexte visualisation - position dans la colonne
}
