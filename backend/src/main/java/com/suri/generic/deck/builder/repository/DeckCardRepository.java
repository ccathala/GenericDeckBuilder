package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.DeckCard;
import com.suri.generic.deck.builder.model.DeckCardId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface DeckCardRepository extends JpaRepository<DeckCard, DeckCardId> {

        /**
         * Trouve toutes les cartes d'une colonne donnée.
         */
        @Query("SELECT dc FROM DeckCard dc WHERE dc.columnGroup.id = :columnGroupId")
        List<DeckCard> findByColumnGroupId(@Param("columnGroupId") UUID columnGroupId);

        /**
         * Trouve la position maximale dans une colonne donnée.
         */
        @Query("SELECT MAX(dc.positionInColumn) FROM DeckCard dc WHERE dc.columnGroup.id = :columnGroupId")
        Integer findMaxPositionInColumn(@Param("columnGroupId") UUID columnGroupId);

        /**
         * Décrémente les positions des cartes après une position donnée dans une
         * colonne.
         */
        @Modifying
        @Query("UPDATE DeckCard dc SET dc.positionInColumn = dc.positionInColumn - 1 " +
                        "WHERE dc.columnGroup.id = :columnGroupId AND dc.positionInColumn > :deletedPosition")
        int decrementPositionsAfter(@Param("columnGroupId") UUID columnGroupId,
                        @Param("deletedPosition") Integer deletedPosition);
}
