package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
public class Card {

    @Id
    private String id; // Ex: "wind_blast"

    @ManyToOne
    @JoinColumn(name = "game_id")
    private Game game;

    @Column(columnDefinition = "TEXT")
    private String properties; // Serialized JSON or plain text

    @OneToMany(mappedBy = "card", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CardLocalization> localizations;
}
