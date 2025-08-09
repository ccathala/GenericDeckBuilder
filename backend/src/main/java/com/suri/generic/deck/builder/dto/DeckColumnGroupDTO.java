package com.suri.generic.deck.builder.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.suri.generic.deck.builder.dto.response.CardResponseDTO;

import java.util.List;

/**
 * DTO représentant un groupe de colonnes pour la visualisation
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DeckColumnGroupDTO {

    private String id;

    private String name;

    @JsonProperty("display_order")
    private int displayOrder;

    @JsonProperty("color_hex")
    private String colorHex;

    private List<DeckCardVisualizationDTO> cards;

    @JsonProperty("card_count")
    private int cardCount;
}
