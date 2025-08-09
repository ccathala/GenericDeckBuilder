package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.model.DeckCard;
import com.suri.generic.deck.builder.model.DeckColumnGroup;
import com.suri.generic.deck.builder.repository.DeckCardRepository;
import com.suri.generic.deck.builder.repository.DeckColumnGroupRepository;
import com.suri.generic.deck.builder.service.DeckCardAutoAssignmentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

/**
 * Implémentation du service d'auto-assignation des cartes dans les colonnes.
 * Remplace la logique des triggers PostgreSQL par de la logique métier Java.
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class DeckCardAutoAssignmentServiceImpl implements DeckCardAutoAssignmentService {

    private final DeckCardRepository deckCardRepository;
    private final DeckColumnGroupRepository deckColumnGroupRepository;

    @Override
    @Transactional
    public void autoAssignToFirstColumn(DeckCard deckCard) {
        // Si la carte n'a pas de colonne assignée, l'assigner à la première colonne
        if (deckCard.getColumnGroup() == null && deckCard.getDeck() != null) {
            log.debug("Auto-assignation de la carte {} à la première colonne du deck {}",
                    deckCard.getId(), deckCard.getDeck().getId());

            // Trouver la première colonne du deck (par ordre d'affichage)
            Optional<DeckColumnGroup> firstColumn = deckColumnGroupRepository
                    .findFirstByDeckIdOrderByDisplayOrder(deckCard.getDeck().getId());

            if (firstColumn.isPresent()) {
                DeckColumnGroup columnGroup = firstColumn.get();

                // Calculer la prochaine position dans la pile
                Integer nextPosition = calculateNextPosition(columnGroup.getId());

                // Assigner la carte
                deckCard.setColumnGroup(columnGroup);
                deckCard.setPositionInColumn(nextPosition);

                log.debug("Carte {} assignée à la colonne {} à la position {}",
                        deckCard.getId(), columnGroup.getId(), nextPosition);
            } else {
                log.warn("Aucune colonne trouvée pour le deck {}", deckCard.getDeck().getId());
            }
        }
    }

    @Override
    @Transactional
    public void reorderPositionsAfterDelete(UUID columnGroupId, Integer deletedPosition) {
        if (columnGroupId == null || deletedPosition == null) {
            return;
        }

        log.debug("Réorganisation des positions après suppression dans la colonne {} à la position {}",
                columnGroupId, deletedPosition);

        // Décrémenter les positions des cartes suivantes
        int updatedCards = deckCardRepository.decrementPositionsAfter(columnGroupId, deletedPosition);

        log.debug("{} cartes repositionnées dans la colonne {}", updatedCards, columnGroupId);
    }

    @Override
    @Transactional
    public void updateColumnGroupTimestamp(UUID columnGroupId) {
        if (columnGroupId == null) {
            return;
        }

        Optional<DeckColumnGroup> columnGroup = deckColumnGroupRepository.findById(columnGroupId);
        if (columnGroup.isPresent()) {
            DeckColumnGroup group = columnGroup.get();
            group.setUpdatedAt(LocalDateTime.now());
            deckColumnGroupRepository.save(group);

            log.debug("Timestamp mis à jour pour la colonne {}", columnGroupId);
        }
    }

    @Override
    public Integer calculateNextPosition(UUID columnGroupId) {
        if (columnGroupId == null) {
            return 0;
        }

        // Trouver la position maximale actuelle et ajouter 1
        Integer maxPosition = deckCardRepository.findMaxPositionInColumn(columnGroupId);
        return (maxPosition != null) ? maxPosition + 1 : 0;
    }
}
