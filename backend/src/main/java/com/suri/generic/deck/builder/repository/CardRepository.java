package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.Card;
import com.suri.generic.deck.builder.model.Game;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CardRepository extends JpaRepository<Card, String> {
    List<Card> findByGame(Game game);
    
    /**
     * Find cards by game ordered by element, extension and mana cost.
     * Elements are ordered: Végétal, Feu, Air, Eau, Minéral, Arcane
     * Extensions: "Jeu de base" first, then others
     * Mana cost: ascending order
     */
    @Query(value = """
        SELECT * FROM card c 
        WHERE c.game_id = :gameId
        ORDER BY 
            CASE COALESCE(c.properties::json->>'element', 'Unknown')
                WHEN 'Végétal' THEN 1
                WHEN 'Feu' THEN 2  
                WHEN 'Air' THEN 3
                WHEN 'Eau' THEN 4
                WHEN 'Minéral' THEN 5
                WHEN 'Arcane' THEN 6
                ELSE 7
            END,
            CASE COALESCE(c.properties::json->>'extension', 'Unknown')
                WHEN 'Jeu de base' THEN 1
                ELSE 2  
            END,
            COALESCE(CAST(c.properties::json->'manaCost'->>'total' AS INTEGER), 0) ASC
        """, nativeQuery = true)
    List<Card> findByGameIdOrderedByElementExtensionAndManaCost(@Param("gameId") String gameId);
}

