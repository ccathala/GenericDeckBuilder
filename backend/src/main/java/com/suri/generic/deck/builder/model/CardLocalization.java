package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(
        name = "card_localization",
        uniqueConstraints = {
                @UniqueConstraint(columnNames = {"card_id", "locale"})
        }
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CardLocalization {

    @EmbeddedId
    @Getter
    private CardLocalizationId id;

    @ManyToOne
    @MapsId("card")
    @JoinColumn(name = "card_id")
    private Card card;

    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String imageUrl;

}


