package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.response.CardResponseDTO;
import com.suri.generic.deck.builder.model.Game;
import com.suri.generic.deck.builder.repository.CardRepository;
import com.suri.generic.deck.builder.repository.GameRepository;
import com.suri.generic.deck.builder.service.CardService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import static org.assertj.core.api.Assertions.*;

/**
 * Tests d'intégration pour CardServiceImpl
 * Ces tests vérifient le fonctionnement avec le contexte Spring complet et la
 * base de données
 */
@SpringBootTest
@TestPropertySource("classpath:application-test.properties")
@Transactional
class CardServiceImplIntegrationTest {

    @Autowired
    private CardService cardService;

    @Autowired
    private GameRepository gameRepository;

    @Autowired
    private CardRepository cardRepository;

    private Game testGame;

    @BeforeEach
    void setUp() {
        // Nettoyer les données existantes
        cardRepository.deleteAll();
        gameRepository.deleteAll();

        // Créer et sauvegarder un jeu de test
        testGame = new Game();
        testGame.setId("test-game");
        testGame.setName("Test Game");
        testGame.setDescription("Test Description");
        testGame = gameRepository.save(testGame);
    }

    @Test
    void testFullCardLifecycle() {
        // Given - Créer des données d'import
        Map<String, Object> cardData1 = new HashMap<>();
        cardData1.put("id", "integration-card-1");
        cardData1.put("properties", Map.of("cost", 5, "power", 3, "type", "creature"));

        Map<String, Object> localizations1 = new HashMap<>();
        localizations1.put("fr", Map.of(
                "name", "Créature Puissante",
                "description", "Une créature très puissante",
                "imageUrl", "https://example.com/creature-fr.png"));
        localizations1.put("en", Map.of(
                "name", "Powerful Creature",
                "description", "A very powerful creature",
                "imageUrl", "https://example.com/creature-en.png"));
        cardData1.put("localizations", localizations1);

        Map<String, Object> cardData2 = new HashMap<>();
        cardData2.put("id", "integration-card-2");
        cardData2.put("properties", Map.of("cost", 2, "type", "spell"));

        Map<String, Object> localizations2 = new HashMap<>();
        localizations2.put("fr", Map.of("name", "Sort Rapide", "description", "Un sort à effet immédiat"));
        localizations2.put("en", Map.of("name", "Quick Spell", "description", "An instant effect spell"));
        cardData2.put("localizations", localizations2);

        // When - Importer les cartes
        cardService.importCards(testGame.getId(), List.of(cardData1, cardData2));

        // Then - Vérifier que les cartes ont été importées
        List<CardResponseDTO> frenchCards = cardService.getCardsByLocale(testGame.getId(), "fr");
        assertThat(frenchCards).hasSize(2);

        Optional<CardResponseDTO> creature = frenchCards.stream()
                .filter(c -> c.getId().equals("integration-card-1"))
                .findFirst();
        assertThat(creature).isPresent();
        assertThat(creature.get().getName()).isEqualTo("Créature Puissante");
        assertThat(creature.get().getDescription()).isEqualTo("Une créature très puissante");
        assertThat(creature.get().getProperties()).containsEntry("cost", 5);
        assertThat(creature.get().getProperties()).containsEntry("power", 3);

        // Vérifier en anglais
        List<CardResponseDTO> englishCards = cardService.getCardsByLocale(testGame.getId(), "en");
        assertThat(englishCards).hasSize(2);

        Optional<CardResponseDTO> creatureEn = englishCards.stream()
                .filter(c -> c.getId().equals("integration-card-1"))
                .findFirst();
        assertThat(creatureEn).isPresent();
        assertThat(creatureEn.get().getName()).isEqualTo("Powerful Creature");
        assertThat(creatureEn.get().getDescription()).isEqualTo("A very powerful creature");
    }

    @Test
    void testGetCardById_WithRealDatabase() {
        // Given - Importer une carte
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "db-card-test");
        cardData.put("properties", Map.of("cost", 3, "type", "artifact"));

        Map<String, Object> localizations = new HashMap<>();
        localizations.put("fr",
                Map.of("name", "Artéfact Magique", "description", "Un artéfact aux pouvoirs mystérieux"));
        localizations.put("en", Map.of("name", "Magic Artifact", "description", "An artifact with mysterious powers"));
        cardData.put("localizations", localizations);

        cardService.importCards(testGame.getId(), List.of(cardData));

        // When - Récupérer la carte par ID
        CardResponseDTO frenchCard = cardService.getCardById("db-card-test", "fr");
        CardResponseDTO englishCard = cardService.getCardById("db-card-test", "en");

        // Then
        assertThat(frenchCard).isNotNull();
        assertThat(frenchCard.getId()).isEqualTo("db-card-test");
        assertThat(frenchCard.getName()).isEqualTo("Artéfact Magique");
        assertThat(frenchCard.getDescription()).isEqualTo("Un artéfact aux pouvoirs mystérieux");

        assertThat(englishCard).isNotNull();
        assertThat(englishCard.getId()).isEqualTo("db-card-test");
        assertThat(englishCard.getName()).isEqualTo("Magic Artifact");
        assertThat(englishCard.getDescription()).isEqualTo("An artifact with mysterious powers");

        // Vérifier les propriétés parsées
        assertThat(frenchCard.getProperties()).containsEntry("cost", 3);
        assertThat(frenchCard.getProperties()).containsEntry("type", "artifact");
    }

    @Test
    void testGetAvailableLocales_WithRealDatabase() {
        // Given - Importer une carte avec plusieurs localisations
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "multilang-card");
        cardData.put("properties", Map.of("type", "land"));

        Map<String, Object> localizations = new HashMap<>();
        localizations.put("fr", Map.of("name", "Terre Fertile"));
        localizations.put("en", Map.of("name", "Fertile Land"));
        localizations.put("es", Map.of("name", "Tierra Fértil"));
        localizations.put("de", Map.of("name", "Fruchtbares Land"));
        cardData.put("localizations", localizations);

        cardService.importCards(testGame.getId(), List.of(cardData));

        // When - Récupérer les locales disponibles
        List<String> availableLocales = cardService.getAvailableLocales("multilang-card");

        // Then
        assertThat(availableLocales).containsExactlyInAnyOrder("fr", "en", "es", "de");
    }

    @Test
    void testCardExists_WithRealDatabase() {
        // Given - Importer une carte avec des localisations (obligatoire pour être
        // sauvegardée)
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "existence-test-card");
        cardData.put("properties", Map.of("type", "spell"));
        cardData.put("localizations", Map.of("fr", Map.of("name", "Carte Test")));

        cardService.importCards(testGame.getId(), List.of(cardData));

        // When & Then
        assertThat(cardService.cardExists("existence-test-card")).isTrue();
        assertThat(cardService.cardExists("non-existent-card")).isFalse();
    }

    @Test
    void testComplexJSONProperties() {
        // Given - Carte avec des propriétés JSON complexes
        Map<String, Object> stats = new HashMap<>();
        stats.put("power", 8);
        stats.put("toughness", 8);
        stats.put("loyalty", null);

        Map<String, Object> complexProps = new HashMap<>();
        complexProps.put("cost", 10);
        complexProps.put("type", "legendary_creature");
        complexProps.put("subtypes", List.of("dragon", "elder"));
        complexProps.put("abilities", Map.of(
                "flying", true,
                "trample", true,
                "protection", List.of("red", "blue")));
        complexProps.put("stats", stats);

        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "complex-card");
        cardData.put("properties", complexProps);

        Map<String, Object> localizations = new HashMap<>();
        localizations.put("fr", Map.of("name", "Dragon Légendaire", "description", "Un dragon aux pouvoirs immenses"));
        cardData.put("localizations", localizations);

        // When - Importer et récupérer
        cardService.importCards(testGame.getId(), List.of(cardData));
        CardResponseDTO result = cardService.getCardById("complex-card", "fr");

        // Then - Vérifier que les propriétés complexes sont correctement préservées
        assertThat(result).isNotNull();
        assertThat(result.getName()).isEqualTo("Dragon Légendaire");

        Map<String, Object> props = result.getProperties();
        assertThat(props).containsEntry("cost", 10);
        assertThat(props).containsEntry("type", "legendary_creature");

        @SuppressWarnings("unchecked")
        List<String> subtypes = (List<String>) props.get("subtypes");
        assertThat(subtypes).containsExactly("dragon", "elder");

        @SuppressWarnings("unchecked")
        Map<String, Object> abilities = (Map<String, Object>) props.get("abilities");
        assertThat(abilities).containsEntry("flying", true);
        assertThat(abilities).containsEntry("trample", true);

        @SuppressWarnings("unchecked")
        Map<String, Object> retrievedStats = (Map<String, Object>) props.get("stats");
        assertThat(retrievedStats).containsEntry("power", 8);
        assertThat(retrievedStats).containsEntry("toughness", 8);
        assertThat(retrievedStats).containsEntry("loyalty", null);
    }

    @Test
    void testMultipleGamesIsolation() {
        // Given - Créer un second jeu
        Game secondGame = new Game();
        secondGame.setId("second-game");
        secondGame.setName("Second Game");
        secondGame.setDescription("Second game for isolation test");
        secondGame = gameRepository.save(secondGame);

        // Cartes pour le premier jeu
        Map<String, Object> card1 = Map.of(
                "id", "game1-card",
                "properties", Map.of("type", "spell"),
                "localizations", Map.of("fr", Map.of("name", "Carte Jeu 1")));

        // Cartes pour le second jeu
        Map<String, Object> card2 = Map.of(
                "id", "game2-card",
                "properties", Map.of("type", "creature"),
                "localizations", Map.of("fr", Map.of("name", "Carte Jeu 2")));

        // When - Importer dans chaque jeu
        cardService.importCards(testGame.getId(), List.of(card1));
        cardService.importCards(secondGame.getId(), List.of(card2));

        // Then - Vérifier l'isolation
        List<CardResponseDTO> game1Cards = cardService.getCardsByLocale(testGame.getId(), "fr");
        List<CardResponseDTO> game2Cards = cardService.getCardsByLocale(secondGame.getId(), "fr");

        assertThat(game1Cards).hasSize(1);
        assertThat(game1Cards.get(0).getId()).isEqualTo("game1-card");
        assertThat(game1Cards.get(0).getName()).isEqualTo("Carte Jeu 1");

        assertThat(game2Cards).hasSize(1);
        assertThat(game2Cards.get(0).getId()).isEqualTo("game2-card");
        assertThat(game2Cards.get(0).getName()).isEqualTo("Carte Jeu 2");
    }

    @Test
    void testLocaleInsensitiveMatching() {
        // Given - Carte avec localisation en différentes casses
        Map<String, Object> cardData = new HashMap<>();
        cardData.put("id", "case-test-card");
        cardData.put("properties", Map.of("type", "spell"));

        Map<String, Object> localizations = new HashMap<>();
        localizations.put("FR", Map.of("name", "Test Casse")); // Majuscules
        localizations.put("en", Map.of("name", "Case Test")); // Minuscules
        cardData.put("localizations", localizations);

        cardService.importCards(testGame.getId(), List.of(cardData));

        // When - Rechercher avec différentes casses
        CardResponseDTO frLower = cardService.getCardById("case-test-card", "fr");
        CardResponseDTO frUpper = cardService.getCardById("case-test-card", "FR");
        CardResponseDTO enLower = cardService.getCardById("case-test-card", "en");
        CardResponseDTO enUpper = cardService.getCardById("case-test-card", "EN");

        // Then - Les correspondances doivent être insensibles à la casse
        assertThat(frLower).isNotNull();
        assertThat(frLower.getName()).isEqualTo("Test Casse");

        assertThat(frUpper).isNotNull();
        assertThat(frUpper.getName()).isEqualTo("Test Casse");

        assertThat(enLower).isNotNull();
        assertThat(enLower.getName()).isEqualTo("Case Test");

        assertThat(enUpper).isNotNull();
        assertThat(enUpper.getName()).isEqualTo("Case Test");
    }
}
