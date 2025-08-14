package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "deck_card")
@Getter
@Setter
@NoArgsConstructor
public class DeckCard {

    @EmbeddedId
    private DeckCardId id = new DeckCardId();

    @ManyToOne
    @MapsId("deckId")
    @JoinColumn(name = "deck_id")
    private Deck deck;

    @ManyToOne
    @MapsId("cardId")
    @JoinColumn(name = "card_id")
    private Card card;

    @Column(name = "quantity")
    private int quantity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "column_group_id")
    private DeckColumnGroup columnGroup;

    @Column(name = "position_in_column")
    private Integer positionInColumn;
}
