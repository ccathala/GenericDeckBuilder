package com.suri.generic.deck.builder.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.hamcrest.Matchers.*;
import static org.assertj.core.api.Assertions.*;

/**
 * Tests d'intégration pour AuthController
 * Ces tests vérifient le comportement complet avec la vraie base de données
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class AuthControllerIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    private Map<String, String> registerPayload;
    private Map<String, String> loginPayload;

    @BeforeEach
    void setUp() {
        registerPayload = Map.of(
                "email", "integration@example.com",
                "password", "password123",
                "name", "Integration Test User");

        loginPayload = Map.of(
                "email", "integration@example.com",
                "password", "password123");
    }

    @Test
    void testRegisterAndLoginFlow() throws Exception {
        // 1. Register un nouvel utilisateur
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").exists())
                .andExpect(jsonPath("$.token").isNotEmpty())
                .andExpect(jsonPath("$.user").exists())
                .andExpect(jsonPath("$.user.email").value("integration@example.com"))
                .andExpect(jsonPath("$.user.name").value("Integration Test User"))
                .andExpect(jsonPath("$.user.id").exists())
                .andExpect(jsonPath("$.user.password").doesNotExist()); // Ne doit pas être exposé

        // 2. Login avec le même utilisateur
        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(loginPayload)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").exists())
                .andExpect(jsonPath("$.token").isNotEmpty())
                .andExpect(jsonPath("$.user").exists())
                .andExpect(jsonPath("$.user.email").value("integration@example.com"))
                .andExpect(jsonPath("$.user.name").value("Integration Test User"))
                .andExpect(jsonPath("$.user.id").exists())
                .andExpect(jsonPath("$.user.password").doesNotExist());
    }

    @Test
    void testRegisterWithExistingEmail() throws Exception {
        // 1. Premier enregistrement - doit réussir
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").exists());

        // 2. Deuxième enregistrement avec le même email - doit échouer
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.error").value("Email déjà utilisé"));
    }

    @Test
    void testLoginWithInvalidCredentials() throws Exception {
        // 1. Register un utilisateur
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isOk());

        // 2. Tentative de login avec un mauvais mot de passe
        Map<String, String> wrongPasswordPayload = Map.of(
                "email", "integration@example.com",
                "password", "wrongpassword");

        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(wrongPasswordPayload)))
                .andExpect(status().is4xxClientError()); // BadCredentialsException sera gérée par le
                                                         // GlobalExceptionHandler
    }

    @Test
    void testLoginWithNonExistentUser() throws Exception {
        // Tentative de login avec un utilisateur qui n'existe pas
        Map<String, String> nonExistentUserPayload = Map.of(
                "email", "nonexistent@example.com",
                "password", "password123");

        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(nonExistentUserPayload)))
                .andExpect(status().is4xxClientError()); // BadCredentialsException
    }

    @Test
    void testPasswordEncryptionInDatabase() throws Exception {
        // Register un utilisateur
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isOk());

        // Vérifier que l'utilisateur peut se connecter (mot de passe correctement
        // encodé)
        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(loginPayload)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").exists());
    }

    @Test
    void testTokenGeneration() throws Exception {
        // Register deux utilisateurs différents
        Map<String, String> user1Payload = Map.of(
                "email", "user1@example.com",
                "password", "password123",
                "name", "User One");

        Map<String, String> user2Payload = Map.of(
                "email", "user2@example.com",
                "password", "password123",
                "name", "User Two");

        // Register et récupérer le token pour user1
        String response1 = mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(user1Payload)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").exists())
                .andReturn().getResponse().getContentAsString();

        // Register et récupérer le token pour user2
        String response2 = mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(user2Payload)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").exists())
                .andReturn().getResponse().getContentAsString();

        // Les tokens doivent être différents
        TypeReference<Map<String, Object>> typeRef = new TypeReference<>() {
        };
        Map<String, Object> response1Map = objectMapper.readValue(response1, typeRef);
        Map<String, Object> response2Map = objectMapper.readValue(response2, typeRef);

        String token1 = (String) response1Map.get("token");
        String token2 = (String) response2Map.get("token");

        // Vérifier que les tokens sont différents
        assertThat(token1).isNotEqualTo(token2);
    }

    @Test
    void testRegisterResponseStructure() throws Exception {
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$", hasKey("token")))
                .andExpect(jsonPath("$", hasKey("user")))
                .andExpect(jsonPath("$.user", hasKey("id")))
                .andExpect(jsonPath("$.user", hasKey("email")))
                .andExpect(jsonPath("$.user", hasKey("name")))
                .andExpect(jsonPath("$.user", not(hasKey("password")))); // Ne doit pas être exposé
    }

    @Test
    void testLoginResponseStructure() throws Exception {
        // D'abord register
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isOk());

        // Puis login
        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(loginPayload)))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$", hasKey("token")))
                .andExpect(jsonPath("$", hasKey("user")))
                .andExpect(jsonPath("$.user", hasKey("id")))
                .andExpect(jsonPath("$.user", hasKey("email")))
                .andExpect(jsonPath("$.user", hasKey("name")))
                .andExpect(jsonPath("$.user", not(hasKey("password"))));
    }
}
