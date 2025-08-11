package com.suri.generic.deck.builder.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.suri.generic.deck.builder.dto.request.DeckNotesUpdateRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.service.DeckService;
import com.suri.generic.deck.builder.service.DeckImportService;
import com.suri.generic.deck.builder.service.DeckExportService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import java.util.UUID;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(DeckController.class)
class DeckNotesControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private DeckService deckService;

    @MockBean
    private DeckImportService deckImportService;

    @MockBean
    private DeckExportService deckExportService;

    @Autowired
    private ObjectMapper objectMapper;

    private User testUser;
    private UUID deckId;
    private DeckResponseDTO expectedResponse;

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setId(1L);

        deckId = UUID.randomUUID();

        expectedResponse = new DeckResponseDTO();
        expectedResponse.setId(deckId.toString());
        expectedResponse.setName("Test Deck");
        expectedResponse.setDescription("Test Description");
        expectedResponse.setGameId("mage_noir");
        expectedResponse.setNotes("Updated notes");
    }

    @Test
    @DisplayName("Should update deck notes successfully")
    @WithMockUser
    void shouldUpdateDeckNotesSuccessfully() throws Exception {
        // Given
        DeckNotesUpdateRequestDTO request = new DeckNotesUpdateRequestDTO("Updated notes");

        when(deckService.updateDeckNotes(eq(deckId), eq("Updated notes"), any(User.class)))
                .thenReturn(expectedResponse);

        // When & Then
        mockMvc.perform(patch("/api/decks/{id}/notes", deckId)
                .with(user(testUser))
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.id").value(deckId.toString()))
                .andExpect(jsonPath("$.notes").value("Updated notes"));
    }

    @Test
    @DisplayName("Should handle empty notes")
    @WithMockUser
    void shouldHandleEmptyNotes() throws Exception {
        // Given
        DeckNotesUpdateRequestDTO request = new DeckNotesUpdateRequestDTO("");
        expectedResponse.setNotes("");

        when(deckService.updateDeckNotes(eq(deckId), eq(""), any(User.class)))
                .thenReturn(expectedResponse);

        // When & Then
        mockMvc.perform(patch("/api/decks/{id}/notes", deckId)
                .with(user(testUser))
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.notes").value(""));
    }

    @Test
    @DisplayName("Should handle null notes")
    @WithMockUser
    void shouldHandleNullNotes() throws Exception {
        // Given
        DeckNotesUpdateRequestDTO request = new DeckNotesUpdateRequestDTO(null);
        expectedResponse.setNotes(null);

        when(deckService.updateDeckNotes(eq(deckId), eq(null), any(User.class)))
                .thenReturn(expectedResponse);

        // When & Then
        mockMvc.perform(patch("/api/decks/{id}/notes", deckId)
                .with(user(testUser))
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.notes").doesNotExist());
    }

    @Test
    @DisplayName("Should return 400 when deck not found")
    @WithMockUser
    void shouldReturn400WhenDeckNotFound() throws Exception {
        // Given
        DeckNotesUpdateRequestDTO request = new DeckNotesUpdateRequestDTO("Some notes");

        when(deckService.updateDeckNotes(eq(deckId), eq("Some notes"), any(User.class)))
                .thenThrow(new IllegalArgumentException("Deck introuvable ou non autorisé"));

        // When & Then
        mockMvc.perform(patch("/api/decks/{id}/notes", deckId)
                .with(user(testUser))
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("Should require authentication")
    void shouldRequireAuthentication() throws Exception {
        // Given
        DeckNotesUpdateRequestDTO request = new DeckNotesUpdateRequestDTO("Some notes");

        // When & Then
        mockMvc.perform(patch("/api/decks/{id}/notes", deckId)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isUnauthorized());
    }
}
