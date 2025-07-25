package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.response.CardResponseDTO;
import com.suri.generic.deck.builder.model.Card;
import com.suri.generic.deck.builder.model.CardLocalization;
import com.suri.generic.deck.builder.model.CardLocalizationId;
import com.suri.generic.deck.builder.model.Game;
import com.suri.generic.deck.builder.repository.CardRepository;
import com.suri.generic.deck.builder.repository.GameRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import java.util.*;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
 * Tests unitaires pour CardServiceImpl
 * Ces tests vérifient la gestion des cartes, localisations et import de données
 */
@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class CardServiceImplTest {

    @Mock
    private GameRepository gameRepository;

    @Mock
    private CardRepository cardRepository;

    private CardServiceImpl cardService;

    private Game testGame;
    private Card testCard;
    private CardLocalization frenchLocalization;
    private CardLocalization englishLocalization;

    @BeforeEach
    void setUp() {
        cardService = new CardServiceImpl(gameRepository, cardRepository);

        // Créer un jeu de test
        testGame = new Game();
        testGame.setId("mage-noir");
        testGame.setName("Mage Noir");

        // Créer une carte de test
        testCard = new Card();
        testCard.setId("card-001");
        testCard.setGame(testGame);
        testCard.setProperties("{\"cost\": 5, \"power\": 3, \"type\": \"creature\"}");

        // Créer des localisations
        frenchLocalization = new CardLocalization();
        frenchLocalization.setId(new CardLocalizationId("card-001", "fr"));
        frenchLocalization.setCard(testCard);
        frenchLocalization.setName("Carte de Test");
        frenchLocalization.setDescription("Description française");
        frenchLocalization.setImageUrl("https://example.com/card-fr.png");

        englishLocalization = new CardLocalization();
        englishLocalization.setId(new CardLocalizationId("card-001", "en"));
        englishLocalization.setCard(testCard);
        englishLocalization.setName("Test Card");
        englishLocalization.setDescription("English description");
        englishLocalization.setImageUrl("https://example.com/card-en.png");

        testCard.setLocalizations(Arrays.asList(frenchLocalization, englishLocalization));
    }

    @Test
    void testGetCardsByLocale_Success() {
        // Given
        String gameId = "mage-noir";
        String locale = "fr";

        when(cardRepository.findByGameIdOrderedByElementExtensionAndManaCost(gameId))
                .thenReturn(List.of(testCard));

        // When
        List<CardResponseDTO> result = cardService.getCardsByLocale(gameId, locale);

        // Then
        assertThat(result).hasSize(1);
        CardResponseDTO dto = result.get(0);
        assertThat(dto.getId()).isEqualTo("card-001");
        assertThat(dto.getName()).isEqualTo("Carte de Test");
        assertThat(dto.getDescription()).isEqualTo("Description française");
        assertThat(dto.getImageUrl()).isEqualTo("https://example.com/card-fr.png");
        assertThat(dto.getProperties()).containsEntry("cost", 5);
        assertThat(dto.getProperties()).containsEntry("power", 3);
        assertThat(dto.getProperties()).containsEntry("type", "creature");

        verify(cardRepository).findByGameIdOrderedByElementExtensionAndManaCost(gameId);
    }

    @Test
    void testGetCardsByLocale_WithDifferentLocale() {
        // Given
        String gameId = "mage-noir";
        String locale = "en";

        when(cardRepository.findByGameIdOrderedByElementExtensionAndManaCost(gameId))
                .thenReturn(List.of(testCard));

        // When
        List<CardResponseDTO> result = cardService.getCardsByLocale(gameId, locale);

        // Then
        assertThat(result).hasSize(1);
        CardResponseDTO dto = result.get(0);
        assertThat(dto.getId()).isEqualTo("card-001");
        assertThat(dto.getName()).isEqualTo("Test Card");
        assertThat(dto.getDescription()).isEqualTo("English description");
        assertThat(dto.getImageUrl()).isEqualTo("https://example.com/card-en.png");
    }

    @Test
    void testGetCardsByLocale_WithUnknownLocale_UsesDefaultValues() {
        // Given
        String gameId = "mage-noir";
        String locale = "es"; // Non existant

        when(cardRepository.findByGameIdOrderedByElementExtensionAndManaCost(gameId))
                .thenReturn(List.of(testCard));

        // When
        List<CardResponseDTO> result = cardService.getCardsByLocale(gameId, locale);

        // Then
        assertThat(result).hasSize(1);
        CardResponseDTO dto = result.get(0);
        assertThat(dto.getId()).isEqualTo("card-001");
        assertThat(dto.getName()).isEqualTo("Nom inconnu");
        assertThat(dto.getDescription()).isEmpty();
        assertThat(dto.getImageUrl()).isEmpty();
    }

    @Test
    void testGetCardsByLocale_WithInvalidJSON_ReturnsEmptyProps() {
        // Given
        String gameId = "mage-noir";
        String locale = "fr";

        Card cardWithInvalidJson = new Card();
        cardWithInvalidJson.setId("card-002");
        cardWithInvalidJson.setGame(testGame);
        cardWithInvalidJson.setProperties("invalid json"); // JSON invalide
        cardWithInvalidJson.setLocalizations(List.of(frenchLocalization));

        when(cardRepository.findByGameIdOrderedByElementExtensionAndManaCost(gameId))
                .thenReturn(List.of(cardWithInvalidJson));

        // When
        List<CardResponseDTO> result = cardService.getCardsByLocale(gameId, locale);

        // Then
        assertThat(result).hasSize(1);
        CardResponseDTO dto = result.get(0);
        assertThat(dto.getProperties()).isEmpty();
    }

    @Test
    void testGetCardsByLocale_GameNotFound_ReturnsEmptyList() {
        // Given
        String gameId = "unknown-game";
        String locale = "fr";

        when(cardRepository.findByGameIdOrderedByElementExtensionAndManaCost(gameId))
                .thenReturn(Collections.emptyList());

        // When
        List<CardResponseDTO> result = cardService.getCardsByLocale(gameId, locale);

        // Then
        assertThat(result).isEmpty();
        verify(cardRepository).findByGameIdOrderedByElementExtensionAndManaCost(gameId);
    }

    @Test
    void testImportCards_Success() {
        // Given
        String gameId = "mage-noir";
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "imported-card");
        cardData.put("properties", Map.of("cost", 3, "type", "spell"));

        Map<String, Object> localizations = new HashMap<>();
        localizations.put("fr", Map.of("name", "Carte Importée", "description", "Description importée"));
        localizations.put("en", Map.of("name", "Imported Card", "description", "Imported description"));
        cardData.put("localizations", localizations);

        when(gameRepository.findById(gameId)).thenReturn(Optional.of(testGame));

        // When
        cardService.importCards(gameId, List.of(cardData));

        // Then
        ArgumentCaptor<Card> cardCaptor = ArgumentCaptor.forClass(Card.class);
        verify(cardRepository).save(cardCaptor.capture());

        Card savedCard = cardCaptor.getValue();
        assertThat(savedCard.getId()).isEqualTo("imported-card");
        assertThat(savedCard.getGame()).isEqualTo(testGame);
        assertThat(savedCard.getProperties()).contains("\"cost\":3");
        assertThat(savedCard.getProperties()).contains("\"type\":\"spell\"");

        List<CardLocalization> locs = savedCard.getLocalizations();
        assertThat(locs).hasSize(2);

        Optional<CardLocalization> frLoc = locs.stream()
                .filter(l -> l.getId().getLocale().equals("fr"))
                .findFirst();
        assertThat(frLoc).isPresent();
        assertThat(frLoc.get().getName()).isEqualTo("Carte Importée");
        assertThat(frLoc.get().getDescription()).isEqualTo("Description importée");
    }

    @Test
    void testImportCards_WithMissingId_ThrowsException() {
        // Given
        String gameId = "mage-noir";
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("properties", Map.of("cost", 3));
        // Pas d'ID

        when(gameRepository.findById(gameId)).thenReturn(Optional.of(testGame));

        // When & Then
        assertThatThrownBy(() -> cardService.importCards(gameId, List.of(cardData)))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("Chaque carte doit avoir un champ 'id'");
    }

    @Test
    void testImportCards_WithBlankId_ThrowsException() {
        // Given
        String gameId = "mage-noir";
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "   "); // ID vide/blank
        cardData.put("properties", Map.of("cost", 3));

        when(gameRepository.findById(gameId)).thenReturn(Optional.of(testGame));

        // When & Then
        assertThatThrownBy(() -> cardService.importCards(gameId, List.of(cardData)))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("Chaque carte doit avoir un champ 'id'");
    }

    @Test
    void testImportCards_WithMissingProperties_ThrowsException() {
        // Given
        String gameId = "mage-noir";
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "test-card");
        // Pas de properties

        when(gameRepository.findById(gameId)).thenReturn(Optional.of(testGame));

        // When & Then
        assertThatThrownBy(() -> cardService.importCards(gameId, List.of(cardData)))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("Le champ 'properties' est requis et doit être un objet.");
    }

    @Test
    void testImportCards_WithInvalidProperties_ThrowsException() {
        // Given
        String gameId = "mage-noir";
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "test-card");
        cardData.put("properties", "not-a-map"); // Pas un objet

        when(gameRepository.findById(gameId)).thenReturn(Optional.of(testGame));

        // When & Then
        assertThatThrownBy(() -> cardService.importCards(gameId, List.of(cardData)))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("Le champ 'properties' est requis et doit être un objet.");
    }

    @Test
    void testImportCards_GameNotFound_ThrowsException() {
        // Given
        String gameId = "unknown-game";
        Map<String, Object> cardData = Map.of("id", "test-card", "properties", Map.of("cost", 1));

        when(gameRepository.findById(gameId)).thenReturn(Optional.empty());

        // When & Then
        assertThatThrownBy(() -> cardService.importCards(gameId, List.of(cardData)))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("Jeu introuvable : unknown-game");
    }

    @Test
    void testImportCards_WithoutLocalizations_IsSkipped() {
        // Given
        String gameId = "mage-noir";
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "simple-card");
        cardData.put("properties", Map.of("cost", 1));
        // Pas de localizations - Comportement actuel: la carte n'est pas sauvegardée
        // (bug potentiel)

        when(gameRepository.findById(gameId)).thenReturn(Optional.of(testGame));

        // When
        cardService.importCards(gameId, List.of(cardData));

        // Then - Aucune carte n'est sauvegardée car l'implémentation fait continue sans
        // localizations
        verify(cardRepository, never()).save(any(Card.class));
        // Note: C'est probablement un bug dans l'implémentation
        // Une carte devrait pouvoir exister sans localizations
    }

    @Test
    void testGetCardById_Success() {
        // Given
        String cardId = "card-001";
        String locale = "fr";

        when(cardRepository.findById(cardId)).thenReturn(Optional.of(testCard));

        // When
        CardResponseDTO result = cardService.getCardById(cardId, locale);

        // Then
        assertThat(result).isNotNull();
        assertThat(result.getId()).isEqualTo("card-001");
        assertThat(result.getName()).isEqualTo("Carte de Test");
        assertThat(result.getDescription()).isEqualTo("Description française");
        assertThat(result.getImageUrl()).isEqualTo("https://example.com/card-fr.png");
        assertThat(result.getProperties()).containsEntry("cost", 5);
    }

    @Test
    void testGetCardById_CardNotFound_ReturnsNull() {
        // Given
        String cardId = "unknown-card";
        String locale = "fr";

        when(cardRepository.findById(cardId)).thenReturn(Optional.empty());

        // When
        CardResponseDTO result = cardService.getCardById(cardId, locale);

        // Then
        assertThat(result).isNull();
    }

    @Test
    void testGetCardById_UnknownLocale_UsesDefaultValues() {
        // Given
        String cardId = "card-001";
        String locale = "de"; // Non existant

        when(cardRepository.findById(cardId)).thenReturn(Optional.of(testCard));

        // When
        CardResponseDTO result = cardService.getCardById(cardId, locale);

        // Then
        assertThat(result).isNotNull();
        assertThat(result.getId()).isEqualTo("card-001");
        assertThat(result.getName()).isEqualTo("Nom inconnu");
        assertThat(result.getDescription()).isEmpty();
        assertThat(result.getImageUrl()).isEmpty();
    }

    @Test
    void testGetAvailableLocales_Success() {
        // Given
        String cardId = "card-001";

        when(cardRepository.findById(cardId)).thenReturn(Optional.of(testCard));

        // When
        List<String> result = cardService.getAvailableLocales(cardId);

        // Then
        assertThat(result).containsExactlyInAnyOrder("fr", "en");
    }

    @Test
    void testGetAvailableLocales_CardNotFound_ReturnsEmptyList() {
        // Given
        String cardId = "unknown-card";

        when(cardRepository.findById(cardId)).thenReturn(Optional.empty());

        // When
        List<String> result = cardService.getAvailableLocales(cardId);

        // Then
        assertThat(result).isEmpty();
    }

    @Test
    void testGetAvailableLocales_WithDuplicateLocales_ReturnsDistinct() {
        // Given
        String cardId = "card-001";

        // Ajout d'une localisation duplicate pour tester distinct()
        CardLocalization duplicateFrench = new CardLocalization();
        duplicateFrench.setId(new CardLocalizationId("card-001", "fr"));
        duplicateFrench.setCard(testCard);

        testCard.setLocalizations(Arrays.asList(frenchLocalization, englishLocalization, duplicateFrench));

        when(cardRepository.findById(cardId)).thenReturn(Optional.of(testCard));

        // When
        List<String> result = cardService.getAvailableLocales(cardId);

        // Then
        assertThat(result).containsExactlyInAnyOrder("fr", "en");
    }

    @Test
    void testCardExists_True() {
        // Given
        String cardId = "card-001";

        when(cardRepository.existsById(cardId)).thenReturn(true);

        // When
        boolean result = cardService.cardExists(cardId);

        // Then
        assertThat(result).isTrue();
    }

    @Test
    void testCardExists_False() {
        // Given
        String cardId = "unknown-card";

        when(cardRepository.existsById(cardId)).thenReturn(false);

        // When
        boolean result = cardService.cardExists(cardId);

        // Then
        assertThat(result).isFalse();
    }

    @Test
    void testImportCards_MultipleCards_OnlyWithLocalizationsSaved() {
        // Given
        String gameId = "mage-noir";

        Map<String, Object> card1 = new HashMap<>();
        card1.put("id", "card-1");
        card1.put("properties", Map.of("cost", 1, "type", "spell"));
        card1.put("localizations", Map.of("fr", Map.of("name", "Carte 1")));

        Map<String, Object> card2 = new HashMap<>();
        card2.put("id", "card-2");
        card2.put("properties", Map.of("cost", 2, "type", "creature"));
        // Pas de localizations - sera ignorée par l'implémentation actuelle

        when(gameRepository.findById(gameId)).thenReturn(Optional.of(testGame));

        // When
        cardService.importCards(gameId, List.of(card1, card2));

        // Then - Seule la carte avec localizations est sauvegardée
        verify(cardRepository, times(1)).save(any(Card.class));
        // Note: Comportement actuel de l'implémentation
    }

    @Test
    void testGetCardsByLocale_EmptyResult() {
        // Given
        String gameId = "mage-noir";
        String locale = "fr";

        when(gameRepository.findById(gameId)).thenReturn(Optional.of(testGame));
        when(cardRepository.findByGame(testGame)).thenReturn(List.of()); // Pas de cartes

        // When
        List<CardResponseDTO> result = cardService.getCardsByLocale(gameId, locale);

        // Then
        assertThat(result).isEmpty();
    }

    @Test
    void testGetCardsByLocale_shouldReturnCardsInCorrectOrder() {
        // Given
        String gameId = "mage_noir";
        String locale = "fr";

        // Create mock cards in the expected order (already sorted by repository)
        Card card1 = createMockCardWithProperties("card1", "Végétal", "Jeu de base", 1);
        Card card2 = createMockCardWithProperties("card2", "Feu", "Jeu de base", 2);
        Card card3 = createMockCardWithProperties("card3", "Air", "Extension 1", 1);

        List<Card> sortedCards = List.of(card1, card2, card3);

        when(cardRepository.findByGameIdOrderedByElementExtensionAndManaCost(gameId))
                .thenReturn(sortedCards);

        // When
        List<CardResponseDTO> result = cardService.getCardsByLocale(gameId, locale);

        // Then
        assertThat(result).hasSize(3);
        
        // Verify the order is preserved
        assertThat(result.get(0).getId()).isEqualTo("card1");
        assertThat(result.get(1).getId()).isEqualTo("card2");
        assertThat(result.get(2).getId()).isEqualTo("card3");

        // Verify properties are correctly mapped
        Map<String, Object> props1 = result.get(0).getProperties();
        assertThat(props1.get("element")).isEqualTo("Végétal");
        assertThat(props1.get("extension")).isEqualTo("Jeu de base");
        
        @SuppressWarnings("unchecked")
        Map<String, Object> manaCost1 = (Map<String, Object>) props1.get("manaCost");
        assertThat(manaCost1.get("total")).isEqualTo(1);
    }

    private Card createMockCardWithProperties(String id, String element, String extension, int manaCost) {
        Card card = new Card();
        card.setId(id);

        // Create a mock localization
        CardLocalization localization = new CardLocalization();
        CardLocalizationId locId = new CardLocalizationId(id, "fr");
        localization.setId(locId);
        localization.setName("Test Card " + id);
        localization.setDescription("Test description");
        localization.setImageUrl("http://example.com/image.png");
        localization.setCard(card);

        card.setLocalizations(List.of(localization));

        // Set properties JSON
        String properties = String.format("""
            {
                "element": "%s",
                "extension": "%s",
                "manaCost": {
                    "total": %d
                }
            }
            """, element, extension, manaCost);

        card.setProperties(properties);
        return card;
    }
}
