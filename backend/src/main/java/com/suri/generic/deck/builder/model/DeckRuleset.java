package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "deck_ruleset")
@Getter
@Setter
@NoArgsConstructor
public class DeckRuleset {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "min_cards")
    private int minCards;

    @Column(name = "max_copies_per_card")
    private int maxCopiesPerCard;

    @OneToOne
    @JoinColumn(name = "game_id", nullable = false, unique = true)
    private Game game;
}
