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

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(classes = Application.class)
@AutoConfigureMockMvc
public class GameControllerTest {

    @Autowired
    private MockMvc mockMvc;

    private String token;

    private final ObjectMapper objectMapper = new ObjectMapper();

    @BeforeEach
    void setup() throws Exception {
        // Enregistre un utilisateur
        mockMvc.perform(post("/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "email": "gameuser@example.com",
                              "password": "secret"
                            }
                        """))
                .andExpect(status().isOk());

        // Récupère le token
        MvcResult result = mockMvc.perform(post("/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                            {
                              "email": "gameuser@example.com",
                              "password": "secret"
                            }
                        """))
                .andExpect(status().isOk())
                .andReturn();

        String responseBody = result.getResponse().getContentAsString();
        token = "Bearer " + objectMapper.readValue(responseBody, Map.class).get("token");
    }

    @Test
    void shouldCreateReadUpdateDeleteGame() throws Exception {
        // Créer un jeu
        String newGame = """
            {
              "id": "test_game",
              "name": "Test Game",
              "description": "Un jeu pour tester le CRUD"
            }
        """;

        mockMvc.perform(post("/api/games")
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(newGame))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value("test_game"));

        // Lire le jeu
        mockMvc.perform(get("/api/games/test_game")
                        .header("Authorization", token))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Test Game"));

        // Mettre à jour le jeu
        String updatedGame = """
            {
              "id": "test_game",
              "name": "Test Game Updated",
              "description": "Description modifiée"
            }
        """;

        mockMvc.perform(put("/api/games/test_game")
                        .header("Authorization", token)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(updatedGame))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Test Game Updated"));

        // Supprimer le jeu
        mockMvc.perform(delete("/api/games/test_game")
                        .header("Authorization", token))
                .andExpect(status().isNoContent());

        // Vérifie que le jeu est supprimé
        mockMvc.perform(get("/api/games/test_game")
                        .header("Authorization", token))
                .andExpect(status().isNotFound());
    }
}
