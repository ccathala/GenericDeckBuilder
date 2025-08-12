package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.dto.*;
import com.suri.generic.deck.builder.dto.request.*;
import com.suri.generic.deck.builder.dto.response.CardResponseDTO;
import com.suri.generic.deck.builder.exception.ValidationException;
import com.suri.generic.deck.builder.model.*;
import com.suri.generic.deck.builder.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Implémentation du service gérant la visualisation des decks avec colonnes
 * personnalisables
 */
@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class DeckVisualizationServiceImpl implements DeckVisualizationService {

    private final DeckColumnGroupRepository columnGroupRepository;
    private final DeckRepository deckRepository;
    private final DeckCardAutoAssignmentService autoAssignmentService;

    // Constantes pour les colonnes par défaut
    private static final String DEFAULT_COLUMN_NAME = "Toutes les cartes";
    private static final int MAX_COLUMNS_PER_DECK = 8;

    @Override
    @Transactional(readOnly = true)
    public DeckVisualizationResponseDTO getDeckVisualization(UUID deckId, Long userId) {
        log.debug("Récupération visualisation deck {} pour utilisateur {}", deckId, userId);

        // Vérifier l'existence et les permissions du deck
        Deck deck = deckRepository.findById(deckId)
                .orElseThrow(() -> new ValidationException("Deck non trouvé"));

        if (!deck.getOwner().getId().equals(userId)) {
            throw new ValidationException("Accès non autorisé à ce deck");
        }

        // Récupérer les colonnes existantes
        List<DeckColumnGroup> columnGroups = columnGroupRepository.findByDeckIdAndUserIdOrderByDisplayOrder(deckId,
                userId);

        // Si aucune colonne n'existe, créer la colonne par défaut
        if (columnGroups.isEmpty()) {
            DeckColumnGroup defaultColumn = createDefaultColumn(deck);
            columnGroups = List.of(defaultColumn);
        }

        // Convertir en DTOs
        List<DeckColumnGroupDTO> columnGroupDTOs = columnGroups.stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());

        int totalCards = deck.getCards().stream()
                .mapToInt(DeckCard::getQuantity)
                .sum();

        return DeckVisualizationResponseDTO.builder()
                .deckId(deckId.toString())
                .deckName(deck.getName())
                .columnGroups(columnGroupDTOs)
                .totalCards(totalCards)
                .hasDefaultColumns(columnGroups.isEmpty())
                .build();
    }

    @Override
    public DeckColumnGroupDTO createColumnGroup(UUID deckId, DeckColumnCreateRequestDTO requestDTO, Long userId) {
        log.debug("Création colonne '{}' pour deck {} par utilisateur {}", requestDTO.getName(), deckId, userId);

        // Vérifier l'existence et les permissions du deck
        Deck deck = deckRepository.findById(deckId)
                .orElseThrow(() -> new ValidationException("Deck non trouvé"));

        if (!deck.getOwner().getId().equals(userId)) {
            throw new ValidationException("Accès non autorisé à ce deck");
        }

        // Vérifier le nombre maximum de colonnes
        int currentCount = columnGroupRepository.countByDeckIdAndUserId(deckId, userId);
        if (currentCount >= MAX_COLUMNS_PER_DECK) {
            throw new ValidationException("Maximum " + MAX_COLUMNS_PER_DECK + " colonnes par deck");
        }

        // Vérifier l'unicité du nom
        if (columnGroupRepository.existsByDeckIdAndName(deckId, requestDTO.getName())) {
            throw new ValidationException("Une colonne avec ce nom existe déjà");
        }

        // Créer la nouvelle colonne
        DeckColumnGroup columnGroup = new DeckColumnGroup();
        columnGroup.setDeck(deck);
        columnGroup.setName(requestDTO.getName());
        columnGroup.setDisplayOrder(currentCount);

        columnGroup = columnGroupRepository.save(columnGroup);

        return mapToDTO(columnGroup);
    }

    @Override
    public DeckColumnGroupDTO updateColumnGroup(UUID deckId, UUID columnGroupId, DeckColumnUpdateRequestDTO requestDTO,
            Long userId) {
        log.debug("Mise à jour colonne {} pour deck {} par utilisateur {}", columnGroupId, deckId, userId);

        DeckColumnGroup columnGroup = columnGroupRepository.findByIdAndUserId(columnGroupId, userId)
                .orElseThrow(() -> new ValidationException("Colonne non trouvée ou accès non autorisé"));

        // Vérifier que la colonne appartient au bon deck
        if (!columnGroup.getDeck().getId().equals(deckId)) {
            throw new ValidationException("La colonne n'appartient pas à ce deck");
        }

        // Vérifier l'unicité du nom si changé
        if (!columnGroup.getName().equals(requestDTO.getName())) {
            if (columnGroupRepository.existsByDeckIdAndNameAndIdNot(deckId, requestDTO.getName(), columnGroupId)) {
                throw new ValidationException("Une colonne avec ce nom existe déjà");
            }
        }

        // Mettre à jour les propriétés
        columnGroup.setName(requestDTO.getName());

        // Ne mettre à jour displayOrder que s'il est explicitement fourni
        if (requestDTO.getDisplayOrder() != null && requestDTO.getDisplayOrder() != columnGroup.getDisplayOrder()) {
            columnGroup.setDisplayOrder(requestDTO.getDisplayOrder());
        }

        columnGroup = columnGroupRepository.save(columnGroup);
        return mapToDTO(columnGroup);
    }

    @Override
    public void deleteColumnGroup(UUID deckId, UUID columnGroupId, Long userId) {
        log.debug("Suppression colonne {} pour deck {} par utilisateur {}", columnGroupId, deckId, userId);

        DeckColumnGroup columnGroup = columnGroupRepository.findByIdAndUserId(columnGroupId, userId)
                .orElseThrow(() -> new ValidationException("Colonne non trouvée ou accès non autorisé"));

        // Vérifier que la colonne appartient au bon deck
        if (!columnGroup.getDeck().getId().equals(deckId)) {
            throw new ValidationException("La colonne n'appartient pas à ce deck");
        }

        // Sauvegarder les cartes à réassigner AVANT suppression
        List<DeckCard> cardsToReassign = new ArrayList<>(columnGroup.getCards());

        // Supprimer la colonne en premier
        columnGroupRepository.deleteByIdAndUserId(columnGroupId, userId);
        log.debug("Colonne {} supprimée", columnGroupId);

        // Récupérer les colonnes restantes APRÈS suppression
        List<DeckColumnGroup> remainingColumns = columnGroupRepository
                .findByDeckIdAndUserIdOrderByDisplayOrder(deckId, userId);

        // Réordonner les displayOrder des colonnes restantes
        reorderDisplayOrders(remainingColumns);

        // Réassigner les cartes APRÈS réordonnancement
        if (!remainingColumns.isEmpty() && !cardsToReassign.isEmpty()) {
            log.debug("Réassignation de {} cartes vers la première colonne restante", cardsToReassign.size());
            for (DeckCard card : cardsToReassign) {
                autoAssignmentService.autoAssignToFirstColumn(card);
            }
        } else if (!cardsToReassign.isEmpty()) {
            log.warn("Suppression d'une colonne sans colonnes restantes - {} cartes perdues", cardsToReassign.size());
        }

        log.debug("Suppression colonne terminée - displayOrder réorganisés et {} cartes réassignées",
                cardsToReassign.size());
    }

    @Override
    public void moveCard(UUID deckId, String cardIdentifier, UUID sourceColumnId, UUID targetColumnId,
            Integer targetPosition, Long userId) {
        log.debug("Déplacement carte {} de {} vers {} position {} pour deck {} par utilisateur {}",
                cardIdentifier, sourceColumnId, targetColumnId, targetPosition, deckId, userId);

        // Parser l'identifiant composite
        String[] parts = cardIdentifier.split("\\|");
        if (parts.length != 2) {
            throw new ValidationException("Identifiant de carte invalide: " + cardIdentifier);
        }

        UUID parsedDeckId = UUID.fromString(parts[0]);
        String cardId = parts[1];

        // Vérifier que le deckId correspond
        if (!parsedDeckId.equals(deckId)) {
            throw new ValidationException("Deck ID ne correspond pas");
        }

        // Vérifier les permissions et récupérer les colonnes
        DeckColumnGroup sourceColumn = columnGroupRepository.findByIdAndUserId(sourceColumnId, userId)
                .orElseThrow(() -> new ValidationException("Colonne source non trouvée"));

        DeckColumnGroup targetColumn = columnGroupRepository.findByIdAndUserId(targetColumnId, userId)
                .orElseThrow(() -> new ValidationException("Colonne cible non trouvée"));

        // Vérifier que les colonnes appartiennent au bon deck
        if (!sourceColumn.getDeck().getId().equals(deckId) || !targetColumn.getDeck().getId().equals(deckId)) {
            throw new ValidationException("Les colonnes n'appartiennent pas à ce deck");
        }

        // Trouver la carte à déplacer dans la colonne source
        DeckCard cardToMove = sourceColumn.getCards().stream()
                .filter(card -> card.getCard().getId().equals(cardId))
                .findFirst()
                .orElseThrow(() -> new ValidationException("Carte non trouvée dans la colonne source"));

        // Gestion spécifique pour le déplacement dans la même colonne
        if (sourceColumnId.equals(targetColumnId)) {
            log.debug("Réorganisation de carte dans la même colonne {} vers position {}", targetColumnId,
                    targetPosition);

            // Valider et ajuster la position cible
            Integer newPosition = validateAndAdjustPosition(targetPosition, targetColumn.getCards().size());

            // Utiliser une méthode spécialisée pour le réarrangement interne
            sourceColumn.reorderCardToPosition(cardToMove, newPosition);

            // Sauvegarder les changements
            columnGroupRepository.save(sourceColumn);
            autoAssignmentService.updateColumnGroupTimestamp(sourceColumnId);

            log.debug("Réorganisation dans la même colonne terminée");
            return;
        }

        // Gestion du déplacement entre colonnes différentes (logique existante)
        log.debug("Déplacement entre colonnes différentes {} → {}", sourceColumnId, targetColumnId);

        // Retirer de la colonne source
        sourceColumn.removeCard(cardToMove);

        // Valider et ajuster la position cible
        Integer newPosition = validateAndAdjustPosition(targetPosition, targetColumn.getCards().size());

        // Assigner à la nouvelle colonne à la position spécifiée
        targetColumn.insertCardAtPosition(cardToMove, newPosition);

        log.debug("Carte déplacée avec succès à la position {} dans la colonne {}", newPosition, targetColumnId);

        // Sauvegarder les changements et mettre à jour les timestamps
        columnGroupRepository.save(sourceColumn);
        columnGroupRepository.save(targetColumn);
        autoAssignmentService.updateColumnGroupTimestamp(sourceColumnId);
        autoAssignmentService.updateColumnGroupTimestamp(targetColumnId);
    }

    /**
     * Crée une colonne par défaut pour un deck
     */
    private DeckColumnGroup createDefaultColumn(Deck deck) {
        DeckColumnGroup defaultColumn = new DeckColumnGroup();
        defaultColumn.setDeck(deck);
        defaultColumn.setName(DEFAULT_COLUMN_NAME);
        defaultColumn.setDisplayOrder(0);

        defaultColumn = columnGroupRepository.save(defaultColumn);

        // Auto-assigner toutes les cartes du deck à cette colonne
        // Le service d'auto-assignation gère les cartes individuellement
        deck.getCards().forEach(deckCard -> {
            autoAssignmentService.autoAssignToFirstColumn(deckCard);
        });

        return defaultColumn;
    }

    /**
     * Convertit une entité DeckColumnGroup en DTO
     */
    private DeckColumnGroupDTO mapToDTO(DeckColumnGroup columnGroup) {
        List<DeckCardVisualizationDTO> cardDTOs = columnGroup.getCards().stream()
                .map(this::mapToDeckCardVisualizationDTO)
                .collect(Collectors.toList());

        return DeckColumnGroupDTO.builder()
                .id(columnGroup.getId().toString())
                .name(columnGroup.getName())
                .displayOrder(columnGroup.getDisplayOrder())
                .cards(cardDTOs)
                .cardCount(cardDTOs.size())
                .build();
    }

    /**
     * Convertit une carte du deck en DTO de visualisation
     */
    private DeckCardVisualizationDTO mapToDeckCardVisualizationDTO(DeckCard deckCard) {
        CardResponseDTO cardResponse = mapCardToDTO(deckCard);

        // Générer un UUID unique basé sur les composants de DeckCardId
        String uniqueId = deckCard.getId().getDeckId().toString() + "|" + deckCard.getId().getCardId();

        return DeckCardVisualizationDTO.builder()
                .id(uniqueId) // UUID composite unique
                .card(cardResponse)
                .quantity(deckCard.getQuantity())
                .positionInColumn(deckCard.getPositionInColumn())
                .build();
    }

    /**
     * Convertit une carte du deck en DTO de réponse pur
     */
    private CardResponseDTO mapCardToDTO(DeckCard deckCard) {
        Card card = deckCard.getCard();

        // Utiliser la première localisation disponible ou des valeurs par défaut
        CardLocalization localization = card.getLocalizations().isEmpty() ? null : card.getLocalizations().get(0);

        return CardResponseDTO.builder()
                .id(card.getId())
                .name(localization != null ? localization.getName() : card.getId())
                .description(localization != null ? localization.getDescription() : "")
                .imageUrl(localization != null ? localization.getImageUrl() : "")
                .cardUrl(localization != null ? localization.getCardUrl() : "")
                .properties(Map.of()) // TODO: parser les properties du JSON si nécessaire
                .build();
    }

    /**
     * Valide et ajuste une position cible
     */
    private Integer validateAndAdjustPosition(Integer targetPosition, int maxSize) {
        Integer newPosition = targetPosition;
        if (newPosition != null) {
            if (newPosition < 0) {
                log.warn("Position négative détectée ({}), ajustée à 0", newPosition);
                newPosition = 0;
            }
            if (newPosition > maxSize) {
                log.warn("Position trop élevée ({} > {}), ajustée à {}", newPosition, maxSize, maxSize);
                newPosition = maxSize;
            }
        } else {
            newPosition = maxSize; // Fin de la liste par défaut
        }
        return newPosition;
    }

    /**
     * Réordonne les displayOrder des colonnes restantes pour qu'ils soient
     * consécutifs à partir de 0
     */
    private void reorderDisplayOrders(List<DeckColumnGroup> columns) {
        if (columns.isEmpty()) {
            return;
        }

        log.debug("Réorganisation des displayOrder pour {} colonnes", columns.size());

        // Trier par displayOrder actuel pour maintenir l'ordre relatif
        columns.sort(Comparator.comparing(DeckColumnGroup::getDisplayOrder));

        // Réassigner les displayOrder de façon consécutive
        for (int i = 0; i < columns.size(); i++) {
            DeckColumnGroup column = columns.get(i);
            if (column.getDisplayOrder() != i) {
                log.debug("Mise à jour displayOrder colonne '{}' : {} → {}",
                        column.getName(), column.getDisplayOrder(), i);
                column.setDisplayOrder(i);
                columnGroupRepository.save(column);
            }
        }

        log.debug("Réorganisation des displayOrder terminée");
    }

    @Override
    public boolean existsByDeckAndName(UUID deckId, String columnName) {
        return columnGroupRepository.existsByDeckIdAndName(deckId, columnName.trim());
    }
}
