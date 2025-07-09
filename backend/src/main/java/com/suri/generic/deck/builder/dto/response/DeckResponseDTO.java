package com.suri.generic.deck.builder.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DeckResponseDTO {
    private String id;
    private String name;
    private String description;
    private String gameId;
    private List<DeckCardResponseDTO> cards;
}
