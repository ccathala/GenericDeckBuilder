package com.suri.generic.deck.builder.security;

import com.suri.generic.deck.builder.dto.request.DeckImportRequestDTO;
import com.suri.generic.deck.builder.exception.DeckImportException;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.CardLocalizationRepository;
import com.suri.generic.deck.builder.repository.CardRepository;
import com.suri.generic.deck.builder.service.DeckImportService;
import com.suri.generic.deck.builder.service.DeckService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

/**
 * 🛡️ Tests de sécurité contre les injections SQL
 * Vérifie que les paramètres malveillants sont correctement validés et rejetés
 */
@ExtendWith(MockitoExtension.class)
class SqlInjectionSecurityTest {

    @Mock
    private CardLocalizationRepository cardLocalizationRepository;

    @Mock
    private DeckService deckService;

    @InjectMocks
    private DeckImportService deckImportService;

    @Mock
    private CardRepository cardRepository;

    private User testUser;

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setEmail("test@example.com");
        testUser.setName("Test User");
    }

    @Test
    @DisplayName("🛡️ Doit rejeter les caractères SQL malveillants dans gameId")
    void shouldRejectSqlInjectionInGameId() {
        // Given - Tentatives d'injection SQL communes
        String[] maliciousGameIds = {
                "'; DROP TABLE card; --",
                "1' OR '1'='1",
                "1'; UPDATE user SET password='hacked'; --",
                "1' UNION SELECT * FROM user; --",
                "mage-noir'; INSERT INTO admin VALUES('hacker'); --"
        };

        for (String maliciousGameId : maliciousGameIds) {
            DeckImportRequestDTO request = new DeckImportRequestDTO();
            request.setGameId(maliciousGameId);
            request.setTitle("Test Deck");
            request.setCardsList("4 carte test");

            // When & Then - Doit lever une exception de validation
            DeckImportException exception = assertThrows(DeckImportException.class, () -> {
                deckImportService.importDeck(request, testUser);
            });

            assertTrue(exception.getMessage().contains("Paramètres invalides"),
                    "Doit rejeter gameId malveillant: " + maliciousGameId);
            assertTrue(exception.getErrors().get(0).contains("caractères non autorisés"),
                    "Doit mentionner les caractères non autorisés pour: " + maliciousGameId);
        }
    }

    @Test
    @DisplayName("🛡️ Doit accepter les gameId valides")
    void shouldAcceptValidGameIds() {
        // Given - gameId valides
        String[] validGameIds = {
                "mage-noir",
                "pokemon_tcg",
                "magic-the-gathering",
                "hearthstone123",
                "game_1",
                "test-game"
        };

        when(cardLocalizationRepository.findByGameId(anyString())).thenReturn(Collections.emptyList());

        for (String validGameId : validGameIds) {
            DeckImportRequestDTO request = new DeckImportRequestDTO();
            request.setGameId(validGameId);
            request.setTitle("Test Deck");
            request.setCardsList("4 carte inexistante");

            // When & Then - Ne doit pas lever d'exception de validation pour gameId
            // (peut lever DeckImportException pour cartes non trouvées, mais pas pour
            // gameId)
            Exception exception = assertThrows(Exception.class, () -> {
                deckImportService.importDeck(request, testUser);
            });

            // L'exception doit être pour les cartes non trouvées, pas pour gameId invalide
            if (exception instanceof DeckImportException) {
                DeckImportException deckException = (DeckImportException) exception;
                assertFalse(deckException.getMessage().contains("Paramètres invalides"),
                        "Ne doit pas rejeter gameId valide: " + validGameId);
            }
        }
    }

    @Test
    @DisplayName("🛡️ Doit rejeter les paramètres null ou vides")
    void shouldRejectNullOrEmptyParameters() {
        // Given - Paramètres invalides
        DeckImportRequestDTO[] invalidRequests = {
                null, // Requête nulle
                createRequest(null, "Test", "4 carte"), // gameId null
                createRequest("", "Test", "4 carte"), // gameId vide
                createRequest("mage-noir", null, "4 carte"), // title null
                createRequest("mage-noir", "", "4 carte"), // title vide
                createRequest("mage-noir", "Test", null) // cardsList null (vide autorisé pour les tests existants)
        };

        for (DeckImportRequestDTO request : invalidRequests) {
            // When & Then
            DeckImportException exception = assertThrows(DeckImportException.class, () -> {
                deckImportService.importDeck(request, testUser);
            });

            assertTrue(exception.getMessage().contains("Paramètres invalides"),
                    "Doit rejeter les paramètres invalides");
        }
    }

    @Test
    @DisplayName("🛡️ Doit rejeter les paramètres trop longs (protection DoS)")
    void shouldRejectOversizedParameters() {
        // Given - Paramètres trop longs
        String longTitle = "a".repeat(101); // > 100 caractères
        String longCardsList = "4 carte test\n".repeat(1000); // > 10000 caractères

        DeckImportRequestDTO requestWithLongTitle = createRequest("mage-noir", longTitle, "4 carte");
        DeckImportRequestDTO requestWithLongCardsList = createRequest("mage-noir", "Test", longCardsList);

        // When & Then - Title trop long
        DeckImportException titleException = assertThrows(DeckImportException.class, () -> {
            deckImportService.importDeck(requestWithLongTitle, testUser);
        });
        assertTrue(titleException.getErrors().get(0).contains("100 caractères"),
                "Doit rejeter les titres trop longs");

        // When & Then - CardsList trop longue
        DeckImportException cardsException = assertThrows(DeckImportException.class, () -> {
            deckImportService.importDeck(requestWithLongCardsList, testUser);
        });
        assertTrue(cardsException.getErrors().get(0).contains("10000 caractères"),
                "Doit rejeter les listes de cartes trop longues");
    }

    private DeckImportRequestDTO createRequest(String gameId, String title, String cardsList) {
        DeckImportRequestDTO request = new DeckImportRequestDTO();
        request.setGameId(gameId);
        request.setTitle(title);
        request.setCardsList(cardsList);
        return request;
    }

    @Test
    @DisplayName("🛡️ CardRepository tri sécurisé - Doit rejeter les gameId malveillants")
    void testCardRepositoryOrderedQuery_withMaliciousGameId_shouldBeSafe() {
        // Given - Tentatives d'injection SQL dans la requête de tri
        String[] maliciousGameIds = {
                "'; DROP TABLE card; SELECT * FROM card WHERE game_id='",
                "' UNION SELECT password FROM app_user WHERE '1'='1",
                "'; UPDATE card SET properties='hacked'; SELECT * FROM card WHERE game_id='",
                "' OR 1=1; DELETE FROM card; SELECT * FROM card WHERE game_id='"
        };

        // When & Then - La validation devrait rejeter ces gameId avant la requête
        for (String maliciousGameId : maliciousGameIds) {
            DeckImportRequestDTO request = createRequest(maliciousGameId, "Test", "4 carte test");

            DeckImportException exception = assertThrows(DeckImportException.class, () -> {
                deckImportService.importDeck(request, testUser);
            });

            assertTrue(exception.getMessage().contains("Paramètres invalides"),
                    "Doit rejeter gameId malveillant dans requête de tri: " + maliciousGameId);
            assertTrue(exception.getErrors().get(0).contains("caractères non autorisés"),
                    "Doit mentionner les caractères non autorisés pour: " + maliciousGameId);
        }
    }
}
