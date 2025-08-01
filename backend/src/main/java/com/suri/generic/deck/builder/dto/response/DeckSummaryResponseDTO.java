package com.suri.generic.deck.builder.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DeckSummaryResponseDTO {
    private String id;
    private String name;
    private Integer totalCards;
    private String displayImageUrl;
}
