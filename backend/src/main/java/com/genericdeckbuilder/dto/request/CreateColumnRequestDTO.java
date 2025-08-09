package com.genericdeckbuilder.dto.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.Pattern;

/**
 * DTO pour la création d'une nouvelle colonne de visualisation de deck
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateColumnRequestDTO {

    @NotBlank(message = "Le nom de la colonne est obligatoire")
    @Size(min = 1, max = 100, message = "Le nom doit contenir entre 1 et 100 caractères")
    private String name;

    @Pattern(regexp = "^#[0-9A-Fa-f]{6}$", message = "Format de couleur invalide (attendu: #RRGGBB)")
    private String color;
}
