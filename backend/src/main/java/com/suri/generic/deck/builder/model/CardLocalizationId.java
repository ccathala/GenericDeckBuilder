package com.suri.generic.deck.builder.model;

import jakarta.persistence.Embeddable;
import lombok.*;

import java.io.Serializable;

@Embeddable
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class CardLocalizationId implements Serializable {

    private String card;
    private String locale;
}

