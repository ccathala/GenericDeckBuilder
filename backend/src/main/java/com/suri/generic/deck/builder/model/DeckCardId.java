package com.suri.generic.deck.builder.model;

import jakarta.persistence.Embeddable;
import jakarta.persistence.Column;
import lombok.*;

import java.io.Serializable;
import java.util.UUID;

@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class DeckCardId implements Serializable {
    @Column(name = "deck_id")
    private UUID deckId;
    
    @Column(name = "card_id")
    private String cardId;
}
