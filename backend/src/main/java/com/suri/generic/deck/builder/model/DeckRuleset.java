package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class DeckRuleset {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int minCards;

    private int maxCopiesPerCard;

    @OneToOne
    @JoinColumn(name = "game_id", nullable = false, unique = true)
    private Game game;
}
