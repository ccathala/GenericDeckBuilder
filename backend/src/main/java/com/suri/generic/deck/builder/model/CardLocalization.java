package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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

    @Column(name = "name")
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "image_url")
    private String imageUrl;

}


