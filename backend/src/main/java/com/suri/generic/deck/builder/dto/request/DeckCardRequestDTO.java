package com.suri.generic.deck.builder.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DeckCardRequestDTO {
    private String cardId;
    private int quantity;
}
