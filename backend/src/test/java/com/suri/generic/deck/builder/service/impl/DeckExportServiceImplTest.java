package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.response.DeckExportResponseDTO;
import com.suri.generic.deck.builder.exception.DeckNotFoundException;
import com.suri.generic.deck.builder.exception.UnauthorizedAccessException;
import com.suri.generic.deck.builder.model.*;
import com.suri.generic.deck.builder.repository.CardLocalizationRepository;
import com.suri.generic.deck.builder.repository.DeckRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.*;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Tests unitaires pour DeckExportServiceImpl.
 * Vérifie l'export de deck avec localisation des noms de cartes.
 */
@ExtendWith(MockitoExtension.class)
@DisplayName("DeckExportServiceImpl Tests")
class DeckExportServiceImplTest {

        @Mock
        private DeckRepository deckRepository;

        @Mock
        private CardLocalizationRepository cardLocalizationRepository;

        @InjectMocks
        private DeckExportServiceImpl deckExportService;

        private User testUser;
        private User otherUser;
        private Deck testDeck;
        private Card card1;
        private Card card2;
        private DeckCard deckCard1;
        private DeckCard deckCard2;
        private CardLocalization frenchLoc1;
        private CardLocalization frenchLoc2;
        private CardLocalization englishLoc1;

        @BeforeEach
        void setUp() {
                // Utilisateurs
                testUser = new User();
                testUser.setId(1L);
                testUser.setEmail("test@example.com");
                testUser.setName("Test User");

                otherUser = new User();
                otherUser.setId(2L);
                otherUser.setEmail("other@example.com");
                otherUser.setName("Other User");

                // Cartes
                card1 = new Card();
                card1.setId("anneau_azur");

                card2 = new Card();
                card2.setId("epee_lumiere");

                // Localisations françaises
                frenchLoc1 = new CardLocalization();
                frenchLoc1.setId(new CardLocalizationId("anneau_azur", "fr"));
                frenchLoc1.setCard(card1);
                frenchLoc1.setName("anneau d'azur");
                frenchLoc1.setImageUrl("");
                frenchLoc1.setCardUrl("");

                frenchLoc2 = new CardLocalization();
                frenchLoc2.setId(new CardLocalizationId("epee_lumiere", "fr"));
                frenchLoc2.setCard(card2);
                frenchLoc2.setName("épée de lumière");
                frenchLoc2.setImageUrl("");
                frenchLoc2.setCardUrl("");

                // Localisation anglaise (pour tester le fallback)
                englishLoc1 = new CardLocalization();
                englishLoc1.setId(new CardLocalizationId("anneau_azur", "en"));
                englishLoc1.setCard(card1);
                englishLoc1.setName("azure ring");
                englishLoc1.setImageUrl("");
                englishLoc1.setCardUrl("");

                // Cartes du deck
                deckCard1 = new DeckCard();
                deckCard1.setCard(card1);
                deckCard1.setQuantity(4);

                deckCard2 = new DeckCard();
                deckCard2.setCard(card2);
                deckCard2.setQuantity(2);

                // Deck de test
                testDeck = new Deck();
                testDeck.setId(UUID.randomUUID());
                testDeck.setName("Mon Deck Test");
                testDeck.setDescription("Description du deck");
                testDeck.setOwner(testUser);
                testDeck.setCards(Arrays.asList(deckCard1, deckCard2));
        }

        @Test
        @DisplayName("Should export deck successfully with French localization")
        void exportDeck_withFrenchLocale_shouldSucceed() {
                // Given
                UUID deckId = testDeck.getId();
                String locale = "fr";

                when(deckRepository.findById(deckId)).thenReturn(Optional.of(testDeck));
                when(cardLocalizationRepository.findByIdCardAndIdLocale("anneau_azur", "fr"))
                                .thenReturn(Optional.of(frenchLoc1));
                when(cardLocalizationRepository.findByIdCardAndIdLocale("epee_lumiere", "fr"))
                                .thenReturn(Optional.of(frenchLoc2));

                // When
                DeckExportResponseDTO result = deckExportService.exportDeck(deckId, locale, testUser);

                // Then
                assertThat(result).isNotNull();
                assertThat(result.getExportedContent()).isNotNull();

                String[] lines = result.getExportedContent().split("\n");
                assertThat(lines).hasSize(2);

                // Vérifier le contenu (trié par nom de carte)
                assertThat(lines[0]).isEqualTo("4 anneau d'azur");
                assertThat(lines[1]).isEqualTo("2 épée de lumière");

                verify(deckRepository).findById(deckId);
                verify(cardLocalizationRepository, times(2)).findByIdCardAndIdLocale("anneau_azur", "fr");
                verify(cardLocalizationRepository, times(2)).findByIdCardAndIdLocale("epee_lumiere", "fr");
        }

        @Test
        @DisplayName("Should export deck with fallback to French when English localization not found")
        void exportDeck_withEnglishLocale_shouldFallbackToFrench() {
                // Given
                UUID deckId = testDeck.getId();
                String locale = "en";

                when(deckRepository.findById(deckId)).thenReturn(Optional.of(testDeck));

                // Première carte a une localisation anglaise
                when(cardLocalizationRepository.findByIdCardAndIdLocale("anneau_azur", "en"))
                                .thenReturn(Optional.of(englishLoc1));

                // Deuxième carte n'a pas de localisation anglaise -> fallback français
                when(cardLocalizationRepository.findByIdCardAndIdLocale("epee_lumiere", "en"))
                                .thenReturn(Optional.empty());
                when(cardLocalizationRepository.findByIdCardAndIdLocale("epee_lumiere", "fr"))
                                .thenReturn(Optional.of(frenchLoc2));

                // When
                DeckExportResponseDTO result = deckExportService.exportDeck(deckId, locale, testUser);

                // Then
                assertThat(result).isNotNull();
                String[] lines = result.getExportedContent().split("\n");
                assertThat(lines).hasSize(2);

                // Trié par nom : azure ring vient avant épée de lumière
                assertThat(lines[0]).isEqualTo("4 azure ring");
                assertThat(lines[1]).isEqualTo("2 épée de lumière");

                verify(cardLocalizationRepository, times(2)).findByIdCardAndIdLocale("epee_lumiere", "en");
                verify(cardLocalizationRepository, times(2)).findByIdCardAndIdLocale("epee_lumiere", "fr");
        }

        @Test
        @DisplayName("Should export deck with card ID when no localization found")
        void exportDeck_withNoLocalization_shouldUseCardId() {
                // Given
                UUID deckId = testDeck.getId();
                String locale = "es"; // Langue non supportée

                when(deckRepository.findById(deckId)).thenReturn(Optional.of(testDeck));

                // Aucune localisation trouvée
                when(cardLocalizationRepository.findByIdCardAndIdLocale(any(), eq("es")))
                                .thenReturn(Optional.empty());
                when(cardLocalizationRepository.findByIdCardAndIdLocale(any(), eq("fr")))
                                .thenReturn(Optional.empty());

                // When
                DeckExportResponseDTO result = deckExportService.exportDeck(deckId, locale, testUser);

                // Then
                assertThat(result).isNotNull();
                String[] lines = result.getExportedContent().split("\n");
                assertThat(lines).hasSize(2);

                // Utilise les IDs des cartes (trié alphabétiquement)
                assertThat(lines[0]).isEqualTo("4 anneau_azur");
                assertThat(lines[1]).isEqualTo("2 epee_lumiere");
        }

        @Test
        @DisplayName("Should throw DeckNotFoundException when deck not found")
        void exportDeck_withNonExistentDeck_shouldThrowException() {
                // Given
                UUID deckId = UUID.randomUUID();
                String locale = "fr";

                when(deckRepository.findById(deckId)).thenReturn(Optional.empty());

                // When & Then
                assertThatThrownBy(() -> deckExportService.exportDeck(deckId, locale, testUser))
                                .isInstanceOf(DeckNotFoundException.class)
                                .hasMessageContaining("Deck non trouvé avec l'ID: " + deckId);

                verify(deckRepository).findById(deckId);
                verifyNoInteractions(cardLocalizationRepository);
        }

        @Test
        @DisplayName("Should throw UnauthorizedAccessException when user is not owner")
        void exportDeck_withUnauthorizedUser_shouldThrowException() {
                // Given
                UUID deckId = testDeck.getId();
                String locale = "fr";

                when(deckRepository.findById(deckId)).thenReturn(Optional.of(testDeck));

                // When & Then
                assertThatThrownBy(() -> deckExportService.exportDeck(deckId, locale, otherUser))
                                .isInstanceOf(UnauthorizedAccessException.class)
                                .hasMessageContaining("L'utilisateur n'est pas autorisé à exporter ce deck");

                verify(deckRepository).findById(deckId);
                verifyNoInteractions(cardLocalizationRepository);
        }

        @Test
        @DisplayName("Should export empty deck successfully")
        void exportDeck_withEmptyDeck_shouldReturnEmptyContent() {
                // Given
                Deck emptyDeck = new Deck();
                emptyDeck.setId(UUID.randomUUID());
                emptyDeck.setName("Deck Vide");
                emptyDeck.setOwner(testUser);
                emptyDeck.setCards(new ArrayList<>());

                when(deckRepository.findById(emptyDeck.getId())).thenReturn(Optional.of(emptyDeck));

                // When
                DeckExportResponseDTO result = deckExportService.exportDeck(emptyDeck.getId(), "fr", testUser);

                // Then
                assertThat(result).isNotNull();
                assertThat(result.getExportedContent()).isEmpty();

                verify(deckRepository).findById(emptyDeck.getId());
                verifyNoInteractions(cardLocalizationRepository);
        }

        @Test
        @DisplayName("Should sort cards by localized name correctly")
        void exportDeck_shouldSortCardsByLocalizedName() {
                // Given - Ajouter une troisième carte pour tester le tri
                Card card3 = new Card();
                card3.setId("boule_feu");

                CardLocalization frenchLoc3 = new CardLocalization();
                frenchLoc3.setId(new CardLocalizationId("boule_feu", "fr"));
                frenchLoc3.setCard(card3);
                frenchLoc3.setName("boule de feu"); // Vient avant "épée de lumière" alphabétiquement
                frenchLoc3.setImageUrl("");
                frenchLoc3.setCardUrl("");

                DeckCard deckCard3 = new DeckCard();
                deckCard3.setCard(card3);
                deckCard3.setQuantity(3);

                testDeck.setCards(Arrays.asList(deckCard1, deckCard2, deckCard3));

                when(deckRepository.findById(testDeck.getId())).thenReturn(Optional.of(testDeck));
                when(cardLocalizationRepository.findByIdCardAndIdLocale("anneau_azur", "fr"))
                                .thenReturn(Optional.of(frenchLoc1));
                when(cardLocalizationRepository.findByIdCardAndIdLocale("epee_lumiere", "fr"))
                                .thenReturn(Optional.of(frenchLoc2));
                when(cardLocalizationRepository.findByIdCardAndIdLocale("boule_feu", "fr"))
                                .thenReturn(Optional.of(frenchLoc3));

                // When
                DeckExportResponseDTO result = deckExportService.exportDeck(testDeck.getId(), "fr", testUser);

                // Then
                String[] lines = result.getExportedContent().split("\n");
                assertThat(lines).hasSize(3);

                // Vérifier l'ordre alphabétique des noms localisés
                assertThat(lines[0]).isEqualTo("4 anneau d'azur");
                assertThat(lines[1]).isEqualTo("3 boule de feu");
                assertThat(lines[2]).isEqualTo("2 épée de lumière");
        }

        @Test
        @DisplayName("Should handle null locale gracefully")
        void exportDeck_withNullLocale_shouldUseDefaultBehavior() {
                // Given
                UUID deckId = testDeck.getId();
                String locale = null;

                when(deckRepository.findById(deckId)).thenReturn(Optional.of(testDeck));
                // Le service devrait gérer null locale comme une chaîne normale
                when(cardLocalizationRepository.findByIdCardAndIdLocale(any(), isNull()))
                                .thenReturn(Optional.empty());
                when(cardLocalizationRepository.findByIdCardAndIdLocale(any(), eq("fr")))
                                .thenReturn(Optional.empty());

                // When
                DeckExportResponseDTO result = deckExportService.exportDeck(deckId, locale, testUser);

                // Then
                assertThat(result).isNotNull();
                assertThat(result.getExportedContent()).isNotEmpty();

                // Devrait fallback sur les IDs des cartes
                String[] lines = result.getExportedContent().split("\n");
                assertThat(lines).contains("4 anneau_azur", "2 epee_lumiere");
        }
}
