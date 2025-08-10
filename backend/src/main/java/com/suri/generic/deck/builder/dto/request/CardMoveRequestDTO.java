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
    @JsonProperty("cardId")
    private String cardId;

    @NotNull(message = "La colonne source est obligatoire")
    @JsonProperty("sourceColumnId")
    private UUID sourceColumnId; // Obligatoire, toutes les cartes sont dans une colonne

    @NotNull(message = "La colonne cible est obligatoire")
    @JsonProperty("targetColumnId")
    private UUID targetColumnId; // Obligatoire, toutes les cartes sont dans une colonne

    @Min(value = 0, message = "La position dans la pile doit être positive ou zéro")
    @JsonProperty("newPositionInPile")
    private Integer newPositionInPile; // Position dans la pile (0 = bas de pile/position haute)

    @Override
    public String toString() {
        return "CardMoveRequestDTO{" +
                "cardId='" + cardId + '\'' +
                ", sourceColumnId=" + sourceColumnId +
                ", targetColumnId=" + targetColumnId +
                ", newPositionInPile=" + newPositionInPile +
                '}';
    }
}
