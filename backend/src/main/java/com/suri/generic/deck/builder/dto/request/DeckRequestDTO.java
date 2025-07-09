package com.suri.generic.deck.builder.dto.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class DeckRequestDTO {
    private String name;
    private String description;
    private String gameId;
    private List<DeckCardRequestDTO> cards;
}
