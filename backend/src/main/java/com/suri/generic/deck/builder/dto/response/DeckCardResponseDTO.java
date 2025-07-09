package com.suri.generic.deck.builder.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DeckCardResponseDTO {
    private String cardId;
    private int quantity;
}
