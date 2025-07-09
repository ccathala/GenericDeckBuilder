package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.DeckRuleset;
import com.suri.generic.deck.builder.model.Game;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface DeckRulesetRepository extends JpaRepository<DeckRuleset, Long> {
    Optional<DeckRuleset> findByGame(Game game);
}
