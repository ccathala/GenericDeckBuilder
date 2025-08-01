package com.suri.generic.deck.builder.controller;

import com.suri.generic.deck.builder.dto.response.DeckExportResponseDTO;
import com.suri.generic.deck.builder.exception.DeckNotFoundException;
import com.suri.generic.deck.builder.exception.UnauthorizedAccessException;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.service.DeckExportService;
import com.suri.generic.deck.builder.service.DeckImportService;
import com.suri.generic.deck.builder.service.DeckService;
import com.suri.generic.deck.builder.service.JwtService;
import com.suri.generic.deck.builder.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.web.servlet.MockMvc;

import java.util.UUID;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Tests unitaires pour l'endpoint d'export de deck dans DeckController.
 */
@WebMvcTest(controllers = DeckController.class)
@DisplayName("DeckController Export Tests")
class DeckControllerExportTest {

        @Autowired
        private MockMvc mockMvc;

        @MockBean
        private DeckService deckService;

        @MockBean
        private DeckImportService deckImportService;

        @MockBean
        private DeckExportService deckExportService;

        @MockBean
        private JwtService jwtService;

        @MockBean
        private UserService userService;

        private User testUser;
        private UUID testDeckId;
        private DeckExportResponseDTO exportResponse;

        @BeforeEach
        void setUp() {
                testUser = new User();
                testUser.setId(1L);
                testUser.setEmail("test@example.com");
                testUser.setName("Test User");

                testDeckId = UUID.randomUUID();

                exportResponse = new DeckExportResponseDTO();
                exportResponse.setExportedContent("4 anneau d'azur\n2 épée de lumière\n3 boule de feu");

                // Configure the userService mock to return our test user
                when(userService.findUserByEmail("test@example.com")).thenReturn(testUser);
                when(userService.loadUserByUsername("test@example.com")).thenReturn(testUser);
        }

        private void authenticateUser() {
                UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(testUser, null,
                                testUser.getAuthorities());
                SecurityContextHolder.getContext().setAuthentication(authToken);
        }

        @Test
        @DisplayName("Should export deck successfully with default locale")
        void exportDeck_withDefaultLocale_shouldSucceed() throws Exception {
                // Given
                authenticateUser();
                when(deckExportService.exportDeck(eq(testDeckId), eq("fr"), any(User.class)))
                                .thenReturn(exportResponse);

                // When & Then
                mockMvc.perform(get("/api/decks/{id}/export", testDeckId)
                                .contentType(MediaType.APPLICATION_JSON))
                                .andExpect(status().isOk())
                                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                                .andExpect(jsonPath("$.exportedContent")
                                                .value("4 anneau d'azur\n2 épée de lumière\n3 boule de feu"));

                verify(deckExportService).exportDeck(eq(testDeckId), eq("fr"), any(User.class));
        }

        @Test
        @DisplayName("Should export deck successfully with custom locale")
        void exportDeck_withCustomLocale_shouldSucceed() throws Exception {
                // Given
                authenticateUser();
                String locale = "en";
                DeckExportResponseDTO englishResponse = new DeckExportResponseDTO();
                englishResponse.setExportedContent("4 azure ring\n2 light sword\n3 fireball");

                when(deckExportService.exportDeck(eq(testDeckId), eq(locale), any(User.class)))
                                .thenReturn(englishResponse);

                // When & Then
                mockMvc.perform(get("/api/decks/{id}/export", testDeckId)
                                .param("locale", locale)
                                .contentType(MediaType.APPLICATION_JSON))
                                .andExpect(status().isOk())
                                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                                .andExpect(jsonPath("$.exportedContent")
                                                .value("4 azure ring\n2 light sword\n3 fireball"));

                verify(deckExportService).exportDeck(eq(testDeckId), eq(locale), any(User.class));
        }

        @Test
        @DisplayName("Should return 404 when deck not found")
        void exportDeck_withNonExistentDeck_shouldReturn404() throws Exception {
                // Given
                authenticateUser();
                when(deckExportService.exportDeck(eq(testDeckId), eq("fr"), any(User.class)))
                                .thenThrow(new DeckNotFoundException("Deck non trouvé avec l'ID: " + testDeckId));

                // When & Then
                mockMvc.perform(get("/api/decks/{id}/export", testDeckId)
                                .contentType(MediaType.APPLICATION_JSON))
                                .andExpect(status().isNotFound());

                verify(deckExportService).exportDeck(eq(testDeckId), eq("fr"), any(User.class));
        }

        @Test
        @DisplayName("Should return 403 when user is not authorized")
        void exportDeck_withUnauthorizedUser_shouldReturn403() throws Exception {
                // Given
                authenticateUser();
                when(deckExportService.exportDeck(eq(testDeckId), eq("fr"), any(User.class)))
                                .thenThrow(new UnauthorizedAccessException(
                                                "L'utilisateur n'est pas autorisé à exporter ce deck"));

                // When & Then
                mockMvc.perform(get("/api/decks/{id}/export", testDeckId)
                                .contentType(MediaType.APPLICATION_JSON))
                                .andExpect(status().isForbidden());

                verify(deckExportService).exportDeck(eq(testDeckId), eq("fr"), any(User.class));
        }

        @Test
        @DisplayName("Should return 401 when user is not authenticated")
        void exportDeck_withoutAuthentication_shouldReturn401() throws Exception {
                // When & Then
                mockMvc.perform(get("/api/decks/{id}/export", testDeckId)
                                .contentType(MediaType.APPLICATION_JSON))
                                .andExpect(status().isUnauthorized());
        }

        @Test
        @DisplayName("Should export deck with empty content successfully")
        void exportDeck_withEmptyDeck_shouldSucceed() throws Exception {
                // Given
                authenticateUser();
                DeckExportResponseDTO emptyResponse = new DeckExportResponseDTO();
                emptyResponse.setExportedContent("");

                when(deckExportService.exportDeck(eq(testDeckId), eq("fr"), any(User.class)))
                                .thenReturn(emptyResponse);

                // When & Then
                mockMvc.perform(get("/api/decks/{id}/export", testDeckId)
                                .contentType(MediaType.APPLICATION_JSON))
                                .andExpect(status().isOk())
                                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                                .andExpect(jsonPath("$.exportedContent").value(""));

                verify(deckExportService).exportDeck(eq(testDeckId), eq("fr"), any(User.class));
        }

        @Test
        @DisplayName("Should handle invalid UUID gracefully")
        void exportDeck_withInvalidUUID_shouldReturn400() throws Exception {
                // Given
                authenticateUser();

                // When & Then
                mockMvc.perform(get("/api/decks/invalid-uuid/export")
                                .contentType(MediaType.APPLICATION_JSON))
                                .andExpect(status().isBadRequest());
        }

        @Test
        @DisplayName("Should validate locale parameter")
        void exportDeck_withVariousLocales_shouldAcceptAll() throws Exception {
                // Given
                authenticateUser();
                String[] locales = { "fr", "en", "es", "de", "zh" };

                for (String locale : locales) {
                        when(deckExportService.exportDeck(eq(testDeckId), eq(locale), any(User.class)))
                                        .thenReturn(exportResponse);

                        // When & Then
                        mockMvc.perform(get("/api/decks/{id}/export", testDeckId)
                                        .param("locale", locale)
                                        .contentType(MediaType.APPLICATION_JSON))
                                        .andExpect(status().isOk());

                        verify(deckExportService).exportDeck(eq(testDeckId), eq(locale), any(User.class));
                }
        }
}
