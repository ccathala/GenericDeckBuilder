package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.model.DeckCard;
import java.util.UUID;

/**
 * Service pour l'auto-assignation et la gestion des positions des cartes dans
 * les colonnes.
 * Remplace les triggers PostgreSQL par de la logique métier Java.
 */
public interface DeckCardAutoAssignmentService {

    /**
     * Assigne automatiquement une carte à la première colonne du deck si aucune
     * colonne n'est spécifiée.
     * Calcule automatiquement la position dans la pile.
     *
     * @param deckCard la carte à assigner
     */
    void autoAssignToFirstColumn(DeckCard deckCard);

    /**
     * Réorganise les positions des cartes dans une colonne après suppression d'une
     * carte.
     * Décrémente les positions des cartes suivantes pour éviter les "trous".
     *
     * @param columnGroupId   l'ID de la colonne
     * @param deletedPosition la position de la carte supprimée
     */
    void reorderPositionsAfterDelete(UUID columnGroupId, Integer deletedPosition);

    /**
     * Met à jour le timestamp updated_at d'un groupe de colonnes.
     *
     * @param columnGroupId l'ID du groupe de colonnes
     */
    void updateColumnGroupTimestamp(UUID columnGroupId);

    /**
     * Calcule la prochaine position disponible dans une colonne.
     *
     * @param columnGroupId l'ID de la colonne
     * @return la prochaine position disponible
     */
    Integer calculateNextPosition(UUID columnGroupId);
}
