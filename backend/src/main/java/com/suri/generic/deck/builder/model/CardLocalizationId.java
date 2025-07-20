package com.suri.generic.deck.builder.model;

import jakarta.persistence.Embeddable;
import jakarta.persistence.Column;
import lombok.*;

import java.io.Serializable;

@Embeddable
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class CardLocalizationId implements Serializable {

    @Column(name = "card_id")
    private String card;
    
    @Column(name = "locale")
    private String locale;
}

