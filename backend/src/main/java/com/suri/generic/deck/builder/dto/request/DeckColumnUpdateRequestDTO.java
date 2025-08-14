package com.suri.generic.deck.builder.dto.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Min;

/**
 * DTO de requête pour la mise à jour d'une colonne de visualisation
 */
@Data
@NoArgsConstructor
public class DeckColumnUpdateRequestDTO {

    @NotBlank(message = "Le nom de la colonne est obligatoire")
    private String name;

    @Min(value = 0, message = "L'ordre d'affichage doit être positif ou zéro")
    @JsonProperty("display_order")
    private Integer displayOrder;
}
