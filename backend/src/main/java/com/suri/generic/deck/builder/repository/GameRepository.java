package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.Game;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GameRepository extends JpaRepository<Game, String> {
}
