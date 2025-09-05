package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.exception.ValidationException;
import com.suri.generic.deck.builder.model.Deck;
import com.suri.generic.deck.builder.model.DeckColumnGroup;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.DeckColumnGroupRepository;
import com.suri.generic.deck.builder.repository.DeckRepository;
import com.suri.generic.deck.builder.service.DeckCardAutoAssignmentService;
import com.suri.generic.deck.builder.service.DeckVisualizationServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.*;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Tests unitaires pour DeckVisualizationServiceImpl
 * Se concentre sur la méthode updateColumnDisplayOrder ajoutée
 */
@ExtendWith(MockitoExtension.class)
class DeckVisualizationServiceImplTest {

    @Mock
    private DeckColumnGroupRepository columnGroupRepository;

    @Mock
    private DeckRepository deckRepository;

    @Mock
    private DeckCardAutoAssignmentService autoAssignmentService;

    @InjectMocks
    private DeckVisualizationServiceImpl deckVisualizationService;

    private UUID deckId;
    private Long userId;
    private User user;
    private Deck deck;
    private List<DeckColumnGroup> columns;

    @BeforeEach
    void setUp() {
        deckId = UUID.randomUUID();
        userId = 1L;
        user = new User();
        user.setId(userId);

        deck = new Deck();
        deck.setId(deckId);
        deck.setOwner(user);

        // Créer 3 colonnes de test avec displayOrder 0, 1, 2
        columns = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            DeckColumnGroup column = new DeckColumnGroup();
            column.setId(UUID.randomUUID());
            column.setDeck(deck);
            column.setName("Colonne " + (i + 1));
            column.setDisplayOrder(i);
            columns.add(column);
        }
    }

    @Test
    void updateColumnDisplayOrder_shouldMoveColumnToNewPositionAndReorderOthers() {
        // Arrange
        UUID columnToMoveId = columns.get(1).getId(); // Colonne à la position 1
        int newPosition = 0; // Déplacer vers la position 0

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));
        when(columnGroupRepository.findByIdAndUserId(columnToMoveId, userId)).thenReturn(Optional.of(columns.get(1)));
        when(columnGroupRepository.findByDeckIdAndUserIdOrderByDisplayOrder(deckId, userId)).thenReturn(columns);

        // Act
        deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId);

        // Assert
        // Vérifier que toutes les colonnes ont été sauvegardées avec les nouveaux
        // displayOrder
        verify(columnGroupRepository, times(2)).save(any(DeckColumnGroup.class));

        // Vérifier l'ordre final attendu: [Colonne2, Colonne1, Colonne3]
        assertEquals(0, columns.get(0).getDisplayOrder()); // Ancienne colonne 1 devient position 0
        assertEquals(1, columns.get(1).getDisplayOrder()); // Ancienne colonne 0 devient position 1
        assertEquals(2, columns.get(2).getDisplayOrder()); // Colonne 3 reste position 2
    }

    @Test
    void updateColumnDisplayOrder_shouldMoveColumnToEndAndReorderOthers() {
        // Arrange
        UUID columnToMoveId = columns.get(0).getId(); // Colonne à la position 0
        int newPosition = 2; // Déplacer vers la fin (position 2)

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));
        when(columnGroupRepository.findByIdAndUserId(columnToMoveId, userId)).thenReturn(Optional.of(columns.get(0)));
        when(columnGroupRepository.findByDeckIdAndUserIdOrderByDisplayOrder(deckId, userId)).thenReturn(columns);

        // Act
        deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId);

        // Assert
        verify(columnGroupRepository, times(3)).save(any(DeckColumnGroup.class));

        // Vérifier l'ordre final attendu: [Colonne2, Colonne3, Colonne1]
        assertEquals(0, columns.get(0).getDisplayOrder()); // Colonne 2 devient position 0
        assertEquals(1, columns.get(1).getDisplayOrder()); // Colonne 3 devient position 1
        assertEquals(2, columns.get(2).getDisplayOrder()); // Ancienne colonne 0 devient position 2
    }

    @Test
    void updateColumnDisplayOrder_shouldDoNothingWhenPositionUnchanged() {
        // Arrange
        UUID columnToMoveId = columns.get(1).getId(); // Colonne à la position 1
        int newPosition = 1; // Même position

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));
        when(columnGroupRepository.findByIdAndUserId(columnToMoveId, userId)).thenReturn(Optional.of(columns.get(1)));
        when(columnGroupRepository.findByDeckIdAndUserIdOrderByDisplayOrder(deckId, userId)).thenReturn(columns);

        // Act
        deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId);

        // Assert
        // Aucune sauvegarde ne devrait être effectuée
        verify(columnGroupRepository, never()).save(any(DeckColumnGroup.class));

        // Les displayOrder doivent rester inchangés
        assertEquals(0, columns.get(0).getDisplayOrder());
        assertEquals(1, columns.get(1).getDisplayOrder());
        assertEquals(2, columns.get(2).getDisplayOrder());
    }

    @Test
    void updateColumnDisplayOrder_shouldThrowExceptionWhenDeckNotFound() {
        // Arrange
        UUID columnToMoveId = UUID.randomUUID();
        int newPosition = 1;

        when(deckRepository.findById(deckId)).thenReturn(Optional.empty());

        // Act & Assert
        ValidationException exception = assertThrows(ValidationException.class,
                () -> deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId));

        assertEquals("Deck non trouvé", exception.getMessage());
        verify(columnGroupRepository, never()).findByIdAndUserId(any(), any());
        verify(columnGroupRepository, never()).save(any());
    }

    @Test
    void updateColumnDisplayOrder_shouldThrowExceptionWhenUserNotOwner() {
        // Arrange
        UUID columnToMoveId = UUID.randomUUID();
        int newPosition = 1;

        User otherUser = new User();
        otherUser.setId(999L);
        deck.setOwner(otherUser); // Autre propriétaire

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));

        // Act & Assert
        ValidationException exception = assertThrows(ValidationException.class,
                () -> deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId));

        assertEquals("Accès non autorisé à ce deck", exception.getMessage());
        verify(columnGroupRepository, never()).findByIdAndUserId(any(), any());
        verify(columnGroupRepository, never()).save(any());
    }

    @Test
    void updateColumnDisplayOrder_shouldThrowExceptionWhenColumnNotFound() {
        // Arrange
        UUID columnToMoveId = UUID.randomUUID();
        int newPosition = 1;

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));
        when(columnGroupRepository.findByIdAndUserId(columnToMoveId, userId)).thenReturn(Optional.empty());

        // Act & Assert
        ValidationException exception = assertThrows(ValidationException.class,
                () -> deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId));

        assertEquals("Colonne non trouvée ou accès non autorisé", exception.getMessage());
        verify(columnGroupRepository, never()).save(any());
    }

    @Test
    void updateColumnDisplayOrder_shouldThrowExceptionWhenColumnBelongsToDifferentDeck() {
        // Arrange
        UUID columnToMoveId = columns.get(1).getId();
        int newPosition = 1;

        Deck differentDeck = new Deck();
        differentDeck.setId(UUID.randomUUID());
        columns.get(1).setDeck(differentDeck); // Colonne appartient à un autre deck

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));
        when(columnGroupRepository.findByIdAndUserId(columnToMoveId, userId)).thenReturn(Optional.of(columns.get(1)));

        // Act & Assert
        ValidationException exception = assertThrows(ValidationException.class,
                () -> deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId));

        assertEquals("La colonne n'appartient pas à ce deck", exception.getMessage());
        verify(columnGroupRepository, never()).save(any());
    }

    @Test
    void updateColumnDisplayOrder_shouldThrowExceptionWhenNoColumnsFound() {
        // Arrange
        UUID columnToMoveId = columns.get(1).getId();
        int newPosition = 1;

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));
        when(columnGroupRepository.findByIdAndUserId(columnToMoveId, userId)).thenReturn(Optional.of(columns.get(1)));
        when(columnGroupRepository.findByDeckIdAndUserIdOrderByDisplayOrder(deckId, userId)).thenReturn(List.of());

        // Act & Assert
        ValidationException exception = assertThrows(ValidationException.class,
                () -> deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId));

        assertEquals("Aucune colonne trouvée pour ce deck", exception.getMessage());
        verify(columnGroupRepository, never()).save(any());
    }

    @Test
    void updateColumnDisplayOrder_shouldThrowExceptionWhenPositionNegative() {
        // Arrange
        UUID columnToMoveId = columns.get(1).getId();
        int newPosition = -1; // Position négative

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));
        when(columnGroupRepository.findByIdAndUserId(columnToMoveId, userId)).thenReturn(Optional.of(columns.get(1)));
        when(columnGroupRepository.findByDeckIdAndUserIdOrderByDisplayOrder(deckId, userId)).thenReturn(columns);

        // Act & Assert
        ValidationException exception = assertThrows(ValidationException.class,
                () -> deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId));

        assertEquals("Position invalide. Doit être entre 0 et 2", exception.getMessage());
        verify(columnGroupRepository, never()).save(any());
    }

    @Test
    void updateColumnDisplayOrder_shouldThrowExceptionWhenPositionTooHigh() {
        // Arrange
        UUID columnToMoveId = columns.get(1).getId();
        int newPosition = 3; // Position trop élevée (il n'y a que 3 colonnes)

        when(deckRepository.findById(deckId)).thenReturn(Optional.of(deck));
        when(columnGroupRepository.findByIdAndUserId(columnToMoveId, userId)).thenReturn(Optional.of(columns.get(1)));
        when(columnGroupRepository.findByDeckIdAndUserIdOrderByDisplayOrder(deckId, userId)).thenReturn(columns);

        // Act & Assert
        ValidationException exception = assertThrows(ValidationException.class,
                () -> deckVisualizationService.updateColumnDisplayOrder(deckId, columnToMoveId, newPosition, userId));

        assertEquals("Position invalide. Doit être entre 0 et 2", exception.getMessage());
        verify(columnGroupRepository, never()).save(any());
    }

    // Note: La méthode reorderColumnsWithMove est privée et ne peut pas être testée
    // directement.
    // Son bon fonctionnement est vérifié indirectement via les tests de
    // updateColumnDisplayOrder.
}
