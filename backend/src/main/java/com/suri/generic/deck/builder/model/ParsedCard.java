package com.suri.generic.deck.builder.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ParsedCard {
    private int quantity;
    private String cardName;
    private int lineNumber;
}
