package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.model.Game;

import java.util.List;
import java.util.Optional;

public interface GameService {

    Game create(Game game);

    List<Game> findAll();

    Optional<Game> findById(String id);

    Game update(String id, Game updatedGame);

    void delete(String id);
}
