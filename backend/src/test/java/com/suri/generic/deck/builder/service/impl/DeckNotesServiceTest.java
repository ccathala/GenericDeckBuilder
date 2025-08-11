package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.model.Deck;
import com.suri.generic.deck.builder.model.Game;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.DeckRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@ActiveProfiles("test")
class DeckNotesServiceTest {

    @Mock
    private DeckRepository deckRepository;

    @InjectMocks
    private DeckServiceImpl deckService;

    private User testUser;
    private Deck testDeck;
    private Game testGame;

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setId(1L);

        testGame = new Game();
        testGame.setId("mage_noir");
        testGame.setName("Mage Noir");

        testDeck = new Deck();
        testDeck.setId(UUID.randomUUID());
        testDeck.setName("Test Deck");
        testDeck.setDescription("Test Description");
        testDeck.setOwner(testUser);
        testDeck.setGame(testGame);
        testDeck.setNotes("Initial notes");
    }

    @Test
    @DisplayName("Should update deck notes successfully")
    void shouldUpdateDeckNotesSuccessfully() {
        // Given
        String newNotes = "Updated notes with strategy";

        when(deckRepository.findById(testDeck.getId()))
                .thenReturn(Optional.of(testDeck));
        when(deckRepository.save(any(Deck.class)))
                .thenReturn(testDeck);

        // When
        DeckResponseDTO result = deckService.updateDeckNotes(testDeck.getId(), newNotes, testUser);

        // Then
        assertNotNull(result);
        assertEquals(newNotes, testDeck.getNotes());
        verify(deckRepository).save(testDeck);
    }

    @Test
    @DisplayName("Should throw exception when deck not found")
    void shouldThrowExceptionWhenDeckNotFound() {
        // Given
        UUID nonExistentDeckId = UUID.randomUUID();
        String notes = "Some notes";

        when(deckRepository.findById(nonExistentDeckId))
                .thenReturn(Optional.empty());

        // When & Then
        IllegalArgumentException exception = assertThrows(
                IllegalArgumentException.class,
                () -> deckService.updateDeckNotes(nonExistentDeckId, notes, testUser));

        assertEquals("Deck introuvable ou non autorisé", exception.getMessage());
        verify(deckRepository, never()).save(any(Deck.class));
    }

    @Test
    @DisplayName("Should throw exception when user doesn't own deck")
    void shouldThrowExceptionWhenUserDoesntOwnDeck() {
        // Given
        User otherUser = new User();
        otherUser.setId(2L);
        testDeck.setOwner(otherUser);
        String notes = "Some notes";

        when(deckRepository.findById(testDeck.getId()))
                .thenReturn(Optional.of(testDeck));

        // When & Then
        IllegalArgumentException exception = assertThrows(
                IllegalArgumentException.class,
                () -> deckService.updateDeckNotes(testDeck.getId(), notes, testUser));

        assertEquals("Deck introuvable ou non autorisé", exception.getMessage());
        verify(deckRepository, never()).save(any(Deck.class));
    }

    @Test
    @DisplayName("Should handle null notes")
    void shouldHandleNullNotes() {
        // Given
        when(deckRepository.findById(testDeck.getId()))
                .thenReturn(Optional.of(testDeck));
        when(deckRepository.save(any(Deck.class)))
                .thenReturn(testDeck);

        // When
        DeckResponseDTO result = deckService.updateDeckNotes(testDeck.getId(), null, testUser);

        // Then
        assertNotNull(result);
        assertNull(testDeck.getNotes());
        verify(deckRepository).save(testDeck);
    }

    @Test
    @DisplayName("Should handle empty notes")
    void shouldHandleEmptyNotes() {
        // Given
        String emptyNotes = "";

        when(deckRepository.findById(testDeck.getId()))
                .thenReturn(Optional.of(testDeck));
        when(deckRepository.save(any(Deck.class)))
                .thenReturn(testDeck);

        // When
        DeckResponseDTO result = deckService.updateDeckNotes(testDeck.getId(), emptyNotes, testUser);

        // Then
        assertNotNull(result);
        assertEquals(emptyNotes, testDeck.getNotes());
        verify(deckRepository).save(testDeck);
    }

    @Test
    @DisplayName("Should handle long notes")
    void shouldHandleLongNotes() {
        // Given
        String longNotes = "A".repeat(10000); // 10k characters

        when(deckRepository.findById(testDeck.getId()))
                .thenReturn(Optional.of(testDeck));
        when(deckRepository.save(any(Deck.class)))
                .thenReturn(testDeck);

        // When
        DeckResponseDTO result = deckService.updateDeckNotes(testDeck.getId(), longNotes, testUser);

        // Then
        assertNotNull(result);
        assertEquals(longNotes, testDeck.getNotes());
        verify(deckRepository).save(testDeck);
    }
}
