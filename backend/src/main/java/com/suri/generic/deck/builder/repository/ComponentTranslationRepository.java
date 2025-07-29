package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.ComponentTranslation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ComponentTranslationRepository extends JpaRepository<ComponentTranslation, Long> {

    /**
     * Trouve une traduction par nom français et jeu
     */
    Optional<ComponentTranslation> findByComponentNameFrAndGameId(String componentNameFr, String gameId);

    /**
     * Trouve toutes les traductions pour un jeu donné
     */
    List<ComponentTranslation> findByGameId(String gameId);

    /**
     * Trouve tous les noms de composants français distincts pour un jeu
     */
    @Query("SELECT DISTINCT c.componentNameFr FROM ComponentTranslation c WHERE c.gameId = :gameId ORDER BY c.componentNameFr")
    List<String> findDistinctComponentNamesByGameId(@Param("gameId") String gameId);

    /**
     * Vérifie si une traduction existe pour un composant et un jeu
     */
    boolean existsByComponentNameFrAndGameId(String componentNameFr, String gameId);
}
