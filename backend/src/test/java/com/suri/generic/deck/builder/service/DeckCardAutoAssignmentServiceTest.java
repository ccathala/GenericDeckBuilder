package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.model.Deck;
import com.suri.generic.deck.builder.model.DeckCard;
import com.suri.generic.deck.builder.model.DeckCardId;
import com.suri.generic.deck.builder.model.DeckColumnGroup;
import com.suri.generic.deck.builder.repository.DeckCardRepository;
import com.suri.generic.deck.builder.repository.DeckColumnGroupRepository;
import com.suri.generic.deck.builder.service.impl.DeckCardAutoAssignmentServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Tests unitaires pour le service d'auto-assignation des cartes dans les
 * colonnes
 */
@ExtendWith(MockitoExtension.class)
class DeckCardAutoAssignmentServiceTest {

    @Mock
    private DeckCardRepository deckCardRepository;

    @Mock
    private DeckColumnGroupRepository deckColumnGroupRepository;

    @InjectMocks
    private DeckCardAutoAssignmentServiceImpl autoAssignmentService;

    private Deck deck;
    private DeckColumnGroup firstColumn;
    private DeckCard deckCard;
    private UUID deckId;
    private UUID columnId;
    private String cardId;

    @BeforeEach
    void setUp() {
        deckId = UUID.randomUUID();
        columnId = UUID.randomUUID();
        cardId = "test-card-id";

        deck = new Deck();
        deck.setId(deckId);
        deck.setName("Test Deck");

        firstColumn = new DeckColumnGroup();
        firstColumn.setId(columnId);
        firstColumn.setName("Première Colonne");
        firstColumn.setDisplayOrder(0);
        firstColumn.setDeck(deck);

        deckCard = new DeckCard();
        DeckCardId deckCardId = new DeckCardId();
        deckCardId.setDeckId(deckId);
        deckCardId.setCardId(cardId);
        deckCard.setId(deckCardId);
        deckCard.setDeck(deck);
    }

    @Test
    void autoAssignToFirstColumn_ShouldAssignCardToFirstColumn_WhenNoColumnAssigned() {
        // Given
        deckCard.setColumnGroup(null);
        when(deckColumnGroupRepository.findFirstByDeckIdOrderByDisplayOrder(deckId))
                .thenReturn(Optional.of(firstColumn));
        when(deckCardRepository.findMaxPositionInColumn(columnId))
                .thenReturn(2); // Il y a déjà 3 cartes (positions 0, 1, 2)

        // When
        autoAssignmentService.autoAssignToFirstColumn(deckCard);

        // Then
        assertEquals(firstColumn, deckCard.getColumnGroup());
        assertEquals(3, deckCard.getPositionInColumn()); // Prochaine position = 2 + 1
    }

    @Test
    void autoAssignToFirstColumn_ShouldNotAssign_WhenNoDeckAssociated() {
        // Given
        deckCard.setDeck(null);
        deckCard.setColumnGroup(null);

        // When
        autoAssignmentService.autoAssignToFirstColumn(deckCard);

        // Then
        verify(deckColumnGroupRepository, never()).findFirstByDeckIdOrderByDisplayOrder(any());
        assertNull(deckCard.getColumnGroup());
    }

    @Test
    void autoAssignToFirstColumn_ShouldNotAssign_WhenNoColumnFound() {
        // Given
        deckCard.setColumnGroup(null);
        when(deckColumnGroupRepository.findFirstByDeckIdOrderByDisplayOrder(deckId))
                .thenReturn(Optional.empty());

        // When
        autoAssignmentService.autoAssignToFirstColumn(deckCard);

        // Then
        assertNull(deckCard.getColumnGroup());
        verify(deckCardRepository, never()).findMaxPositionInColumn(any());
    }

    @Test
    void calculateNextPosition_ShouldReturnZero_WhenNoCardsInColumn() {
        // Given
        when(deckCardRepository.findMaxPositionInColumn(columnId))
                .thenReturn(null);

        // When
        Integer nextPosition = autoAssignmentService.calculateNextPosition(columnId);

        // Then
        assertEquals(0, nextPosition);
    }

    @Test
    void calculateNextPosition_ShouldReturnMaxPlusOne_WhenCardsExist() {
        // Given
        when(deckCardRepository.findMaxPositionInColumn(columnId))
                .thenReturn(4); // Position max actuelle = 4

        // When
        Integer nextPosition = autoAssignmentService.calculateNextPosition(columnId);

        // Then
        assertEquals(5, nextPosition); // 4 + 1
    }

    @Test
    void calculateNextPosition_ShouldReturnZero_WhenColumnIdIsNull() {
        // When
        Integer nextPosition = autoAssignmentService.calculateNextPosition(null);

        // Then
        assertEquals(0, nextPosition);
        verify(deckCardRepository, never()).findMaxPositionInColumn(any());
    }

    @Test
    void reorderPositionsAfterDelete_ShouldDecrementPositions_WhenCalled() {
        // Given
        Integer deletedPosition = 2;
        when(deckCardRepository.decrementPositionsAfter(columnId, deletedPosition))
                .thenReturn(3); // 3 cartes ont été repositionnées

        // When
        autoAssignmentService.reorderPositionsAfterDelete(columnId, deletedPosition);

        // Then
        verify(deckCardRepository).decrementPositionsAfter(columnId, deletedPosition);
    }

    @Test
    void reorderPositionsAfterDelete_ShouldNotProcess_WhenColumnIdIsNull() {
        // When
        autoAssignmentService.reorderPositionsAfterDelete(null, 2);

        // Then
        verify(deckCardRepository, never()).decrementPositionsAfter(any(), any());
    }

    @Test
    void reorderPositionsAfterDelete_ShouldNotProcess_WhenDeletedPositionIsNull() {
        // When
        autoAssignmentService.reorderPositionsAfterDelete(columnId, null);

        // Then
        verify(deckCardRepository, never()).decrementPositionsAfter(any(), any());
    }

    @Test
    void updateColumnGroupTimestamp_ShouldUpdateTimestamp_WhenColumnExists() {
        // Given
        LocalDateTime beforeUpdate = LocalDateTime.now().minusMinutes(1);
        firstColumn.setUpdatedAt(beforeUpdate);
        when(deckColumnGroupRepository.findById(columnId))
                .thenReturn(Optional.of(firstColumn));
        when(deckColumnGroupRepository.save(any(DeckColumnGroup.class)))
                .thenReturn(firstColumn);

        // When
        autoAssignmentService.updateColumnGroupTimestamp(columnId);

        // Then
        verify(deckColumnGroupRepository).save(firstColumn);
        assertTrue(firstColumn.getUpdatedAt().isAfter(beforeUpdate));
    }

    @Test
    void updateColumnGroupTimestamp_ShouldNotUpdate_WhenColumnNotFound() {
        // Given
        when(deckColumnGroupRepository.findById(columnId))
                .thenReturn(Optional.empty());

        // When
        autoAssignmentService.updateColumnGroupTimestamp(columnId);

        // Then
        verify(deckColumnGroupRepository, never()).save(any());
    }

    @Test
    void updateColumnGroupTimestamp_ShouldNotProcess_WhenColumnIdIsNull() {
        // When
        autoAssignmentService.updateColumnGroupTimestamp(null);

        // Then
        verify(deckColumnGroupRepository, never()).findById(any());
        verify(deckColumnGroupRepository, never()).save(any());
    }
}
