package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.DeckCard;
import com.suri.generic.deck.builder.model.DeckCardId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeckCardRepository extends JpaRepository<DeckCard, DeckCardId> {
}
