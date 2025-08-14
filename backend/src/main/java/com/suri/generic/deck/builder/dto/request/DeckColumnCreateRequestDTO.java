package com.suri.generic.deck.builder.dto.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

/**
 * DTO de requête pour la création d'une colonne de visualisation
 */
@Data
@NoArgsConstructor
public class DeckColumnCreateRequestDTO {

    @NotBlank(message = "Le nom de la colonne est obligatoire")
    private String name;

    @Pattern(regexp = "^#[0-9A-Fa-f]{6}$", message = "La couleur doit être un code hexadécimal valide (#RRGGBB)")
    @JsonProperty("color_hex")
    private String colorHex = "#6B7280"; // Couleur par défaut
}
