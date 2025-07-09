package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.Deck;
import com.suri.generic.deck.builder.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface DeckRepository extends JpaRepository<Deck, UUID> {
    List<Deck> findAllByOwner(User owner);
}
