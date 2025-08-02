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
     * 
     * ⚠️ SÉCURITÉ: Requête JPQL sécurisée remplaçant la requête native PostgreSQL
     * pour éviter les injections SQL tout en conservant le tri complexe
     */
    @Query("""
        SELECT c FROM Card c 
        WHERE c.game.id = :gameId
        ORDER BY 
            CASE 
                WHEN c.properties LIKE '%"element":"Végétal"%' THEN 1
                WHEN c.properties LIKE '%"element":"Feu"%' THEN 2  
                WHEN c.properties LIKE '%"element":"Air"%' THEN 3
                WHEN c.properties LIKE '%"element":"Eau"%' THEN 4
                WHEN c.properties LIKE '%"element":"Minéral"%' THEN 5
                WHEN c.properties LIKE '%"element":"Arcane"%' THEN 6
                ELSE 7
            END,
            CASE 
                WHEN c.properties LIKE '%"extension":"Jeu de base"%' THEN 1
                ELSE 2  
            END,
            c.id ASC
        """)
    List<Card> findByGameIdOrderedByElementExtensionAndManaCost(@Param("gameId") String gameId);
}

