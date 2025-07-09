package com.suri.generic.deck.builder.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.suri.generic.deck.builder.Application;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import java.util.Map;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(classes = Application.class)
@AutoConfigureMockMvc
public class CardControllerTest {

    @Autowired
    private MockMvc mockMvc;

    private String token;

    @BeforeEach
    void setup() throws Exception {
        // Register
        mockMvc.perform(post("/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "email": "deck_user1@example.com",
                              "password": "secret"
                            }
                        """))
                .andExpect(status().isOk());

        // Login
        MvcResult result = mockMvc.perform(post("/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "email": "deck_user1@example.com",
                              "password": "secret"
                            }
                        """))
                .andExpect(status().isOk())
                .andReturn();

        String responseBody = result.getResponse().getContentAsString();
        token = "Bearer " + new ObjectMapper().readValue(responseBody, Map.class).get("token");

        // Créer un jeu
        String newGame = """
            {
              "id": "mage_noir",
              "name": "Test Game",
              "description": "Un jeu pour tester le CRUD"
            }
        """;

        mockMvc.perform(post("/api/games")
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(newGame))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value("mage_noir"));
    }

    @Test
    void shouldImportCardsAndReturnLocalizedList() throws Exception {
        // Payload JSON multilingue
        String importPayload = """
            [
              {
                "id": "fireball",
                "properties": {
                  "Type": "Sort",
                  "Élément": "Feu",
                  "Coût": "3"
                },
                "localizations": {
                  "fr": {
                    "name": "Boule de feu",
                    "description": "Inflige 4 dégâts à une cible"
                  },
                  "en": {
                    "name": "Fireball",
                    "description": "Deals 4 damage to a target"
                  }
                }
              }
            ]
        """;

        // Import des cartes
        mockMvc.perform(post("/api/games/mage_noir/import")
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(importPayload))
                .andExpect(status().isOk());

        // Récupération localisée (fr)
        mockMvc.perform(get("/api/games/mage_noir/cards?locale=fr")
                        .header("Authorization", token))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].id").value("fireball"))
                .andExpect(jsonPath("$[0].name").value("Boule de feu"))
                .andExpect(jsonPath("$[0].description").value("Inflige 4 dégâts à une cible"))
                .andExpect(jsonPath("$[0].properties.Type").value("Sort"));
    }
}

