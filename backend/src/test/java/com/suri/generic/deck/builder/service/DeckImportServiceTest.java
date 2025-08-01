package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.dto.request.DeckCardRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckImportRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.exception.DeckImportException;
import com.suri.generic.deck.builder.model.Card;
import com.suri.generic.deck.builder.model.CardLocalization;
import com.suri.generic.deck.builder.model.CardLocalizationId;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.CardLocalizationRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class DeckImportServiceTest {

    @Mock
    private CardLocalizationRepository cardLocalizationRepository;

    @Mock
    private DeckService deckService;

    @InjectMocks
    private DeckImportService deckImportService;

    @Captor
    private ArgumentCaptor<DeckRequestDTO> deckRequestCaptor;

    private User testUser;
    private DeckImportRequestDTO importRequest;
    private List<CardLocalization> mockLocalizations;

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setEmail("test@example.com");
        testUser.setName("Test User");

        importRequest = new DeckImportRequestDTO();
        importRequest.setTitle("Mon Deck Test");
        importRequest.setGameId("mage_noir");

        // Création des cartes mock
        Card card1 = new Card();
        card1.setId("card1");

        Card card2 = new Card();
        card2.setId("card2");

        CardLocalization loc1 = new CardLocalization();
        loc1.setId(new CardLocalizationId("card1", "fr"));
        loc1.setCard(card1);
        loc1.setName("anneau d'azur");

        CardLocalization loc2 = new CardLocalization();
        loc2.setId(new CardLocalizationId("card2", "fr"));
        loc2.setCard(card2);
        loc2.setName("épée de lumière");

        mockLocalizations = Arrays.asList(loc1, loc2);
    }

    @Test
    void importDeck_withValidInput_shouldSucceed() {
        // Given
        importRequest.setCardsList("4 anneau d'azur\n2 épée de lumière");

        when(cardLocalizationRepository.findByGameId("mage_noir"))
                .thenReturn(mockLocalizations);

        DeckResponseDTO expectedResponse = new DeckResponseDTO();
        expectedResponse.setId("deck123");
        when(deckService.createDeck(any(DeckRequestDTO.class), eq(testUser)))
                .thenReturn(expectedResponse);

        // When
        DeckResponseDTO result = deckImportService.importDeck(importRequest, testUser);

        // Then
        assertNotNull(result);
        assertEquals("deck123", result.getId());

        verify(deckService).createDeck(deckRequestCaptor.capture(), eq(testUser));
        DeckRequestDTO capturedRequest = deckRequestCaptor.getValue();

        assertEquals("Mon Deck Test", capturedRequest.getName());
        assertEquals("mage_noir", capturedRequest.getGameId());
        assertEquals(2, capturedRequest.getCards().size());

        DeckCardRequestDTO card1Request = capturedRequest.getCards().get(0);
        assertEquals("card1", card1Request.getCardId());
        assertEquals(4, card1Request.getQuantity());

        DeckCardRequestDTO card2Request = capturedRequest.getCards().get(1);
        assertEquals("card2", card2Request.getCardId());
        assertEquals(2, card2Request.getQuantity());
    }

    @Test
    void importDeck_withEmptyCardsList_shouldThrowException() {
        // Given
        importRequest.setCardsList("");

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Aucune carte", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        assertTrue(exception.getErrors().get(0).contains("Aucune carte valide trouvée dans la liste"));
    }

    @Test
    void importDeck_withOnlyWhitespaceLines_shouldThrowException() {
        // Given
        importRequest.setCardsList("   \n\t\n   ");

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Aucune carte", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        assertTrue(exception.getErrors().get(0).contains("Aucune carte valide trouvée dans la liste"));
    }

    @Test
    void importDeck_withInvalidFormat_shouldThrowException() {
        // Given
        importRequest.setCardsList("anneau d'azur sans quantité");

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Format incorrect", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        assertTrue(exception.getErrors().get(0).contains("Ligne 1"));
        assertTrue(exception.getErrors().get(0).contains("Format attendu"));
    }

    @Test
    void importDeck_withInvalidQuantity_shouldThrowException() {
        // Given
        importRequest.setCardsList("abc anneau d'azur");
        // Note : Pas besoin de mock car l'erreur se produit avant l'appel au repository

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        // Assertions basées sur le comportement réel de l'application
        assertEquals("Format incorrect", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        String errorMessage = exception.getErrors().get(0);
        assertTrue(errorMessage.contains("1"), "L'erreur devrait mentionner la ligne 1");
        assertTrue(errorMessage.toLowerCase().contains("format") || errorMessage.contains("quantité"), 
                   "L'erreur devrait mentionner le format incorrect ou la quantité");
    }

    @Test
    void importDeck_withZeroQuantity_shouldThrowException() {
        // Given
        importRequest.setCardsList("0 anneau d'azur");

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Quantité invalide", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        String errorMessage = exception.getErrors().get(0);
        assertTrue(errorMessage.contains("1"), "L'erreur devrait mentionner la ligne 1");
        assertTrue(errorMessage.contains("positive") || errorMessage.contains("quantité"), 
                   "L'erreur devrait mentionner la quantité positive");
    }

    @Test
    void importDeck_withNegativeQuantity_shouldThrowException() {
        // Given
        importRequest.setCardsList("-2 anneau d'azur");
        // Note : Pas besoin de mock car l'erreur se produit avant l'appel au repository

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Format incorrect", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        assertFalse(exception.getErrors().get(0).isEmpty(), "Le message d'erreur ne devrait pas être vide");
    }

    @Test
    void importDeck_withCardNotFound_shouldThrowException() {
        // Given
        importRequest.setCardsList("4 carte inexistante");

        when(cardLocalizationRepository.findByGameId("mage_noir"))
                .thenReturn(mockLocalizations);

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Cartes non trouvées", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        String errorMessage = exception.getErrors().get(0);
        assertTrue(errorMessage.contains("carte inexistante"));
        assertTrue(errorMessage.contains("ligne 1"));
    }

    @Test
    void importDeck_withMultipleCardNotFound_shouldListAllErrors() {
        // Given
        importRequest.setCardsList("4 carte inexistante\n2 autre carte inexistante");

        when(cardLocalizationRepository.findByGameId("mage_noir"))
                .thenReturn(mockLocalizations);

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Cartes non trouvées", exception.getMessage());
        assertEquals(2, exception.getErrors().size());
        assertTrue(exception.getErrors().get(0).contains("carte inexistante (ligne 1)"));
        assertTrue(exception.getErrors().get(1).contains("autre carte inexistante (ligne 2)"));
    }

    @Test
    void importDeck_withMixedValidAndInvalidCards_shouldThrowExceptionForInvalidOnes() {
        // Given
        importRequest.setCardsList("4 anneau d'azur\n2 carte inexistante");

        when(cardLocalizationRepository.findByGameId("mage_noir"))
                .thenReturn(mockLocalizations);

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Cartes non trouvées", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        String errorMessage = exception.getErrors().get(0);
        assertTrue(errorMessage.contains("carte inexistante"));
        assertTrue(errorMessage.contains("ligne 2"));
    }

    @Test
    void importDeck_withDifferentLineEndings_shouldWork() {
        // Given
        importRequest.setCardsList("4 anneau d'azur\r\n2 épée de lumière\r\n");

        when(cardLocalizationRepository.findByGameId("mage_noir"))
                .thenReturn(mockLocalizations);

        DeckResponseDTO expectedResponse = new DeckResponseDTO();
        when(deckService.createDeck(any(DeckRequestDTO.class), eq(testUser)))
                .thenReturn(expectedResponse);

        // When
        DeckResponseDTO result = deckImportService.importDeck(importRequest, testUser);

        // Then
        assertNotNull(result);
        verify(deckService).createDeck(any(DeckRequestDTO.class), eq(testUser));
    }

    @Test
    void importDeck_withEmptyLinesInBetween_shouldIgnoreEmptyLines() {
        // Given
        importRequest.setCardsList("4 anneau d'azur\n\n\n2 épée de lumière\n\n");

        when(cardLocalizationRepository.findByGameId("mage_noir"))
                .thenReturn(mockLocalizations);

        DeckResponseDTO expectedResponse = new DeckResponseDTO();
        when(deckService.createDeck(any(DeckRequestDTO.class), eq(testUser)))
                .thenReturn(expectedResponse);

        // When
        DeckResponseDTO result = deckImportService.importDeck(importRequest, testUser);

        // Then
        assertNotNull(result);

        verify(deckService).createDeck(deckRequestCaptor.capture(), eq(testUser));
        DeckRequestDTO capturedRequest = deckRequestCaptor.getValue();
        assertEquals(2, capturedRequest.getCards().size());
    }

    @Test
    void importDeck_withNoCardsAvailable_shouldThrowException() {
        // Given
        importRequest.setCardsList("4 anneau d'azur");

        when(cardLocalizationRepository.findByGameId("mage_noir"))
                .thenReturn(Collections.emptyList());

        // When & Then
        DeckImportException exception = assertThrows(DeckImportException.class,
                () -> deckImportService.importDeck(importRequest, testUser));

        assertEquals("Cartes non trouvées", exception.getMessage());
        assertEquals(1, exception.getErrors().size());
        assertTrue(exception.getErrors().get(0).contains("anneau d azur"));
    }

    @Test
    void importDeck_withNormalizedCardNames_shouldFindCards() {
        // Given - Utilise des variations avec accents, apostrophes et tirets
        importRequest.setCardsList("4 ANNEAU D AZUR\n2 epee-de-lumiere");

        when(cardLocalizationRepository.findByGameId("mage_noir"))
                .thenReturn(mockLocalizations);

        DeckResponseDTO expectedResponse = new DeckResponseDTO();
        when(deckService.createDeck(any(DeckRequestDTO.class), eq(testUser)))
                .thenReturn(expectedResponse);

        // When
        DeckResponseDTO result = deckImportService.importDeck(importRequest, testUser);

        // Then
        assertNotNull(result);

        verify(deckService).createDeck(deckRequestCaptor.capture(), eq(testUser));
        DeckRequestDTO capturedRequest = deckRequestCaptor.getValue();
        assertEquals(2, capturedRequest.getCards().size());
    }

    @Test
    void importDeck_shouldCallRepositoryWithCorrectGameId() {
        // Given
        importRequest.setCardsList("4 anneau d'azur");
        importRequest.setGameId("custom_game");

        when(cardLocalizationRepository.findByGameId("custom_game"))
                .thenReturn(mockLocalizations);

        DeckResponseDTO expectedResponse = new DeckResponseDTO();
        when(deckService.createDeck(any(DeckRequestDTO.class), eq(testUser)))
                .thenReturn(expectedResponse);

        // When
        deckImportService.importDeck(importRequest, testUser);

        // Then
        verify(cardLocalizationRepository).findByGameId("custom_game");
    }
}
