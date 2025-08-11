package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.request.DeckCardRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.model.*;
import com.suri.generic.deck.builder.repository.*;
import com.suri.generic.deck.builder.service.DeckVisualizationService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.*;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * Test pour vérifier que les cartes sont automatiquement assignées
 * à la colonne par défaut lors de la création/modification d'un deck
 */
@ExtendWith(MockitoExtension.class)
class DeckServiceImplColumnAssignmentTest {

    @Mock
    private DeckRepository deckRepository;

    @Mock
    private CardRepository cardRepository;

    @Mock
    private GameRepository gameRepository;

    @Mock
    private DeckCardRepository deckCardRepository;

    @Mock
    private DeckColumnGroupRepository deckColumnGroupRepository;

    @Mock
    private DeckVisualizationService deckVisualizationService;

    @Mock
    private DeckRulesetRepository rulesetRepository;

    @InjectMocks
    private DeckServiceImpl deckService;

    private User owner;
    private Game game;
    private Card card1, card2;
    private DeckColumnGroup defaultColumn;

    @BeforeEach
    void setUp() {
        // Utilisateur
        owner = new User();
        owner.setId(1L);
        owner.setEmail("test@example.com");

        // Jeu
        game = new Game();
        game.setId(UUID.randomUUID().toString());

        // Cartes
        card1 = new Card();
        card1.setId(UUID.randomUUID().toString());

        card2 = new Card();
        card2.setId(UUID.randomUUID().toString());

        // Colonne par défaut
        defaultColumn = new DeckColumnGroup();
        defaultColumn.setId(UUID.randomUUID());
        defaultColumn.setName("Deck");
        defaultColumn.setDisplayOrder(0);
    }

    @Test
    void createDeck_shouldCallAssignCardsToDefaultColumn() {
        // Arrange
        DeckRequestDTO request = new DeckRequestDTO();
        request.setName("Test Deck");
        request.setDescription("Test Description");
        request.setGameId(game.getId());

        List<DeckCardRequestDTO> cardRequests = Arrays.asList(
                new DeckCardRequestDTO(card1.getId(), 2),
                new DeckCardRequestDTO(card2.getId(), 1));
        request.setCards(cardRequests);

        // Mock des repositories
        when(gameRepository.findById(game.getId())).thenReturn(Optional.of(game));
        when(cardRepository.findById(card1.getId())).thenReturn(Optional.of(card1));
        when(cardRepository.findById(card2.getId())).thenReturn(Optional.of(card2));
        when(deckColumnGroupRepository.findByDeckIdAndDisplayOrder(any(UUID.class), eq(0)))
                .thenReturn(Optional.of(defaultColumn));
        when(deckCardRepository.findByColumnGroupId(defaultColumn.getId()))
                .thenReturn(Collections.emptyList()); // Colonne vide

        // Mock du deck sauvegardé
        Deck savedDeck = new Deck();
        savedDeck.setId(UUID.randomUUID());
        savedDeck.setName(request.getName());
        savedDeck.setDescription(request.getDescription());
        savedDeck.setGame(game);
        savedDeck.setOwner(owner);
        savedDeck.setCards(new ArrayList<>());

        when(deckRepository.save(any(Deck.class))).thenReturn(savedDeck);

        // Act
        deckService.createDeck(request, owner);

        // Assert - Vérifier que les méthodes de repository ont été appelées
        verify(deckColumnGroupRepository).findByDeckIdAndDisplayOrder(any(UUID.class), eq(0));
        verify(deckCardRepository).findByColumnGroupId(defaultColumn.getId());
        verify(deckRepository, times(2)).save(any(Deck.class)); // Appelé 2 fois : création de base + assignation des
                                                                // cartes
    }

    @Test
    void createDeck_shouldHandleMissingDefaultColumn() {
        // Arrange
        DeckRequestDTO request = new DeckRequestDTO();
        request.setName("Test Deck");
        request.setGameId(game.getId());
        request.setCards(Arrays.asList(new DeckCardRequestDTO(card1.getId(), 1)));

        // Mock : aucune colonne par défaut trouvée
        when(gameRepository.findById(game.getId())).thenReturn(Optional.of(game));
        when(cardRepository.findById(card1.getId())).thenReturn(Optional.of(card1));
        when(deckColumnGroupRepository.findByDeckIdAndDisplayOrder(any(UUID.class), eq(0)))
                .thenReturn(Optional.empty());

        Deck savedDeck = new Deck();
        savedDeck.setId(UUID.randomUUID());
        savedDeck.setGame(game);
        savedDeck.setOwner(owner);
        savedDeck.setCards(new ArrayList<>());
        when(deckRepository.save(any(Deck.class))).thenReturn(savedDeck);

        // Act & Assert - ne devrait pas lever d'exception
        org.junit.jupiter.api.Assertions.assertDoesNotThrow(() -> {
            deckService.createDeck(request, owner);
        });

        // Vérifier que la recherche de colonne par défaut a bien été tentée
        verify(deckColumnGroupRepository).findByDeckIdAndDisplayOrder(any(UUID.class), eq(0));
    }
}
