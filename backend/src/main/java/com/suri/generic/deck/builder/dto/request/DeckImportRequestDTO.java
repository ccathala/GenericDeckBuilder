package com.suri.generic.deck.builder.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class DeckImportRequestDTO {

    @NotBlank(message = "Le titre du deck est obligatoire")
    private String title;

    @NotBlank(message = "La liste des cartes est obligatoire")
    private String cardsList;

    private String gameId = "mage_noir"; // Par défaut
}
