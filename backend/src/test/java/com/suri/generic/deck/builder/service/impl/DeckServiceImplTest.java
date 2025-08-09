package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.DeckColumnGroupDTO;
import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckColumnCreateRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.model.Deck;
import com.suri.generic.deck.builder.model.Game;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.DeckRepository;
import com.suri.generic.deck.builder.repository.GameRepository;
import com.suri.generic.deck.builder.repository.CardRepository;
import com.suri.generic.deck.builder.repository.DeckRulesetRepository;
import com.suri.generic.deck.builder.service.DeckVisualizationService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatNoException;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@ActiveProfiles("test")
class DeckServiceImplTest {

    @Mock
    private DeckRepository deckRepository;

    @Mock
    private DeckRulesetRepository rulesetRepository;

    @Mock
    private GameRepository gameRepository;

    @Mock
    private CardRepository cardRepository;

    @Mock
    private DeckVisualizationService deckVisualizationService;

    @InjectMocks
    private DeckServiceImpl deckService;

    private User testUser;
    private Game testGame;
    private DeckRequestDTO testDeckRequest;

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setId(1L);

        testGame = new Game();
        testGame.setId("mage_noir");
        testGame.setName("Mage Noir");

        testDeckRequest = new DeckRequestDTO();
        testDeckRequest.setName("Test Deck");
        testDeckRequest.setDescription("Test Description");
        testDeckRequest.setGameId("mage_noir");
        testDeckRequest.setCards(new ArrayList<>());
    }

    @Test
    void createDeck_ShouldCreateDefaultVisualizationColumn() {
        // Given
        UUID deckId = UUID.randomUUID();
        Deck savedDeck = new Deck();
        savedDeck.setId(deckId);
        savedDeck.setName("Test Deck");
        savedDeck.setOwner(testUser);
        savedDeck.setGame(testGame);
        savedDeck.setCards(new ArrayList<>());

        when(gameRepository.findById("mage_noir")).thenReturn(Optional.of(testGame));
        when(deckRepository.save(any(Deck.class))).thenReturn(savedDeck);

        DeckColumnGroupDTO mockColumn = new DeckColumnGroupDTO();
        mockColumn.setId(UUID.randomUUID().toString());
        mockColumn.setName("Deck");
        mockColumn.setColorHex("#6B7280");

        when(deckVisualizationService.createColumnGroup(eq(deckId), any(DeckColumnCreateRequestDTO.class), eq(1L)))
                .thenReturn(mockColumn);

        // When
        DeckResponseDTO responseDTO = deckService.createDeck(testDeckRequest, testUser);

        // Then
        assertThat(responseDTO).isNotNull();

        // Vérifier que la colonne par défaut a été créée
        verify(deckVisualizationService, times(1))
                .createColumnGroup(eq(deckId), any(DeckColumnCreateRequestDTO.class), eq(1L));

        // Vérifier les paramètres de la colonne créée
        verify(deckVisualizationService).createColumnGroup(eq(deckId),
                argThat(columnRequest -> "Deck".equals(columnRequest.getName()) &&
                        "#6B7280".equals(columnRequest.getColorHex())),
                eq(1L));
    }

    @Test
    void createDeck_ShouldNotFailIfVisualizationCreationFails() {
        // Given
        UUID deckId = UUID.randomUUID();
        Deck savedDeck = new Deck();
        savedDeck.setId(deckId);
        savedDeck.setName("Test Deck");
        savedDeck.setOwner(testUser);
        savedDeck.setGame(testGame);
        savedDeck.setCards(new ArrayList<>());

        when(gameRepository.findById("mage_noir")).thenReturn(Optional.of(testGame));
        when(deckRepository.save(any(Deck.class))).thenReturn(savedDeck);

        // Mock pour simuler un échec de création de colonne
        doThrow(new RuntimeException("Erreur visualisation"))
                .when(deckVisualizationService)
                .createColumnGroup(any(UUID.class), any(DeckColumnCreateRequestDTO.class), any(Long.class));

        // When & Then - La création du deck ne doit pas échouer
        assertThatNoException().isThrownBy(() -> {
            DeckResponseDTO responseDTO = deckService.createDeck(testDeckRequest, testUser);
            assertThat(responseDTO).isNotNull();
        });

        // Vérifier que la tentative de création de colonne a bien eu lieu
        verify(deckVisualizationService, times(1))
                .createColumnGroup(any(UUID.class), any(DeckColumnCreateRequestDTO.class), eq(1L));
    }
}
