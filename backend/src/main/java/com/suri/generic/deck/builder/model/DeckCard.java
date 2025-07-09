package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter @Setter
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

    private int quantity;
}
