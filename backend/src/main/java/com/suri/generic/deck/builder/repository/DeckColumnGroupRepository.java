package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.DeckColumnGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * Repository pour la gestion des groupes de colonnes de visualisation des decks
 */
@Repository
public interface DeckColumnGroupRepository extends JpaRepository<DeckColumnGroup, UUID> {

    /**
     * Récupère tous les groupes de colonnes d'un deck ordonnés par displayOrder
     */
    List<DeckColumnGroup> findByDeckIdOrderByDisplayOrder(UUID deckId);

    /**
     * Récupère tous les groupes de colonnes d'un deck appartenant à un utilisateur
     * spécifique
     */
    @Query("SELECT dcg FROM DeckColumnGroup dcg " +
            "WHERE dcg.deck.id = :deckId " +
            "AND dcg.deck.owner.id = :userId " +
            "ORDER BY dcg.displayOrder")
    List<DeckColumnGroup> findByDeckIdAndUserIdOrderByDisplayOrder(
            @Param("deckId") UUID deckId,
            @Param("userId") Long userId);

    /**
     * Récupère un groupe de colonne spécifique appartenant à un utilisateur
     */
    @Query("SELECT dcg FROM DeckColumnGroup dcg " +
            "WHERE dcg.id = :columnGroupId " +
            "AND dcg.deck.owner.id = :userId")
    Optional<DeckColumnGroup> findByIdAndUserId(
            @Param("columnGroupId") UUID columnGroupId,
            @Param("userId") Long userId);

    /**
     * Supprime un groupe de colonne spécifique appartenant à un utilisateur
     */
    @Modifying
    @Query("DELETE FROM DeckColumnGroup dcg " +
            "WHERE dcg.id = :columnGroupId " +
            "AND dcg.deck.owner.id = :userId")
    int deleteByIdAndUserId(
            @Param("columnGroupId") UUID columnGroupId,
            @Param("userId") Long userId);

    /**
     * Compte le nombre de groupes de colonnes pour un deck spécifique d'un
     * utilisateur
     */
    @Query("SELECT COUNT(dcg) FROM DeckColumnGroup dcg " +
            "WHERE dcg.deck.id = :deckId " +
            "AND dcg.deck.owner.id = :userId")
    int countByDeckIdAndUserId(
            @Param("deckId") UUID deckId,
            @Param("userId") Long userId);

    /**
     * Supprime tous les groupes de colonnes d'un deck
     */
    void deleteByDeckId(UUID deckId);

    /**
     * Vérifie l'existence d'un nom de colonne dans un deck
     */
    @Query("SELECT COUNT(dcg) > 0 FROM DeckColumnGroup dcg " +
            "WHERE dcg.deck.id = :deckId " +
            "AND dcg.name = :name " +
            "AND dcg.id != :excludeId")
    boolean existsByDeckIdAndNameAndIdNot(
            @Param("deckId") UUID deckId,
            @Param("name") String name,
            @Param("excludeId") UUID excludeId);

    /**
     * Vérifie l'existence d'un nom de colonne dans un deck (pour création)
     */
    @Query("SELECT COUNT(dcg) > 0 FROM DeckColumnGroup dcg " +
            "WHERE dcg.deck.id = :deckId " +
            "AND dcg.name = :name")
    boolean existsByDeckIdAndName(
            @Param("deckId") UUID deckId,
            @Param("name") String name);

    /**
     * Récupère la première colonne d'un deck (pour auto-assignation)
     */
    @Query("SELECT dcg FROM DeckColumnGroup dcg " +
            "WHERE dcg.deck.id = :deckId " +
            "ORDER BY dcg.displayOrder " +
            "LIMIT 1")
    Optional<DeckColumnGroup> findFirstByDeckIdOrderByDisplayOrder(@Param("deckId") UUID deckId);
}
