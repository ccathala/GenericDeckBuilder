package com.suri.generic.deck.builder.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.suri.generic.deck.builder.Application;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import java.util.Map;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(classes = Application.class)
@AutoConfigureMockMvc
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class DeckControllerTest {

    @Autowired
    private MockMvc mockMvc;

    private String token;

    @BeforeAll
    void setup() throws Exception {
        // Register user
        mockMvc.perform(post("/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "email": "test@example.com",
                              "password": "secret"
                            }
                        """))
                .andExpect(status().isOk());

        // Login user
        MvcResult result = mockMvc.perform(post("/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "email": "test@example.com",
                              "password": "secret"
                            }
                        """))
                .andExpect(status().isOk())
                .andReturn();

        String response = result.getResponse().getContentAsString();
        token = "Bearer " + new ObjectMapper().readValue(response, Map.class).get("token");

        mockMvc.perform(post("/api/games")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Authorization", token)
                        .content("""
                            {
                              "id": "mage_noir",
                              "name": "Mage Noir",
                              "description": "Jeu de cartes à base d'éléments"
                            }
                        """))
                .andExpect(status().isOk());

        // Insert some cards (optionnel si déjà en BDD)
        mockMvc.perform(post("/api/games/mage_noir/import")
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            [
                              {
                                "id": "fireball",
                                "properties": {
                                  "Type": "Sort"
                                },
                                "localizations": {
                                  "fr": { "name": "Boule de feu", "description": "Inflige 4 dégâts" },
                                  "en": { "name": "Fireball", "description": "Deals 4 damage" }
                                }
                              }
                            ]
                        """))
                .andExpect(status().isOk());
    }

    @Test
    void shouldCreateAndRetrieveDeck() throws Exception {
        // Créer un deck
        MvcResult createResult = mockMvc.perform(post("/api/decks")
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "name": "Deck test",
                              "description": "Deck de test",
                              "gameId": "mage_noir",
                              "cards": [
                                { "cardId": "fireball", "quantity": 40 }
                              ]
                            }
                        """))
                .andExpect(status().isOk())
                .andReturn();

        String response = createResult.getResponse().getContentAsString();
        String deckId = new ObjectMapper().readTree(response).get("id").asText();

        // Récupérer le deck
        mockMvc.perform(get("/api/decks/" + deckId)
                        .header("Authorization", token))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Deck test"));
    }

    @Test
    void shouldUpdateDeck() throws Exception {
        // Créer un deck
        MvcResult result = mockMvc.perform(post("/api/decks")
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "name": "Old Deck",
                              "description": "Old description",
                              "gameId": "mage_noir",
                              "cards": [
                                { "cardId": "fireball", "quantity": 40 }
                              ]
                            }
                        """))
                .andExpect(status().isOk())
                .andReturn();

        String deckId = new ObjectMapper().readTree(result.getResponse().getContentAsString()).get("id").asText();

        // Mettre à jour le deck
        mockMvc.perform(put("/api/decks/" + deckId)
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "name": "Updated Deck",
                              "description": "New desc",
                              "gameId": "mage_noir",
                              "cards": [
                                { "cardId": "fireball", "quantity": 40 }
                              ]
                            }
                        """))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Updated Deck"));
    }

    @Test
    void shouldDeleteDeck() throws Exception {
        // Créer un deck
        MvcResult result = mockMvc.perform(post("/api/decks")
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "name": "ToDelete",
                              "description": "To be deleted",
                              "gameId": "mage_noir",
                              "cards": [
                                { "cardId": "fireball", "quantity": 40 }
                              ]
                            }
                        """))
                .andExpect(status().isOk())
                .andReturn();

        String deckId = new ObjectMapper().readTree(result.getResponse().getContentAsString()).get("id").asText();

        // Supprimer le deck
        mockMvc.perform(delete("/api/decks/" + deckId)
                        .header("Authorization", token))
                .andExpect(status().isOk());
    }
}

