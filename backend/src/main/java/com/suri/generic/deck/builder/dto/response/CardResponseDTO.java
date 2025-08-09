package com.suri.generic.deck.builder.dto.response;

import lombok.Getter;
import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Map;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CardResponseDTO {
    private String id;
    private String name;
    private String description;
    private String imageUrl;
    private String cardUrl;
    private Map<String, Object> properties;
}
