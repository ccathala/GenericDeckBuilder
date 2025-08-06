package com.suri.generic.deck.builder.dto.response;

import lombok.Getter;

import java.util.Map;

@Getter
public class CardResponseDTO {
    private String id;
    private String name;
    private String description;
    private String imageUrl;
    private String cardUrl;
    private Map<String, Object> properties;

    public CardResponseDTO(String id, String name, String description, String imageUrl, String cardUrl,
            Map<String, Object> properties) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.imageUrl = imageUrl;
        this.cardUrl = cardUrl;
        this.properties = properties;
    }
}
