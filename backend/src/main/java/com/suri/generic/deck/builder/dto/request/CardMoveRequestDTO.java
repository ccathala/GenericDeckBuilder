package com.suri.generic.deck.builder.dto.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Min;
import java.util.UUID;

/**
 * DTO de requête pour le déplacement d'une carte entre colonnes
 */
@Data
@NoArgsConstructor
public class CardMoveRequestDTO {

    @NotBlank(message = "L'ID de carte est obligatoire")
    @JsonProperty("card_id")
    private String cardId;

    @NotNull(message = "La colonne source est obligatoire")
    @JsonProperty("source_column_id")
    private UUID sourceColumnId; // Obligatoire, toutes les cartes sont dans une colonne

    @NotNull(message = "La colonne cible est obligatoire")
    @JsonProperty("target_column_id")
    private UUID targetColumnId; // Obligatoire, toutes les cartes sont dans une colonne

    @Min(value = 0, message = "La position dans la pile doit être positive ou zéro")
    @JsonProperty("new_position_in_pile")
    private Integer newPositionInPile; // Position dans la pile (0 = bas de pile/position haute)
}
