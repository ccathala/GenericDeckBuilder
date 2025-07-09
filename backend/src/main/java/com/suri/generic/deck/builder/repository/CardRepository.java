package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.Card;
import com.suri.generic.deck.builder.model.Game;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CardRepository extends JpaRepository<Card, String> {
    List<Card> findByGame(Game game);
}

