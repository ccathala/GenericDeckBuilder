package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.service.JwtService;
import io.jsonwebtoken.Claims;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.context.TestPropertySource;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
 * Tests d'intégration pour JwtServiceImpl avec Spring Boot context
 * Ces tests vérifient l'intégration avec la configuration Spring Boot
 */
@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
@Transactional
class JwtServiceImplIntegrationTest {

    @Autowired
    private JwtService jwtService;

    private User testUser;

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setId(1L);
        testUser.setEmail("integration@test.com");
        testUser.setName("Integration Test User");
        testUser.setPassword("password123");
    }

    @Test
    void testJwtServiceInjection() {
        // Then
        assertThat(jwtService).isNotNull();
        assertThat(jwtService).isInstanceOf(JwtServiceImpl.class);
    }

    @Test
    void testGenerateAndValidateTokenIntegration() {
        // When
        String token = jwtService.generateToken(testUser);

        // Then
        assertThat(token).isNotNull();
        assertThat(token).isNotEmpty();

        // Create UserDetails mock that matches our user
        UserDetails userDetails = mock(UserDetails.class);
        when(userDetails.getUsername()).thenReturn(testUser.getEmail());

        // Validate the token
        boolean isValid = jwtService.isTokenValid(token, userDetails);
        assertThat(isValid).isTrue();
    }

    @Test
    void testTokenClaimsExtractionIntegration() {
        // Given
        String token = jwtService.generateToken(testUser);

        // When
        String extractedUsername = jwtService.extractUsername(token);
        Date issuedAt = jwtService.extractClaim(token, Claims::getIssuedAt);
        Date expiration = jwtService.extractClaim(token, Claims::getExpiration);

        // Then
        assertThat(extractedUsername).isEqualTo(testUser.getEmail());
        assertThat(issuedAt).isNotNull();
        assertThat(expiration).isNotNull();
        assertThat(expiration).isAfter(issuedAt);

        // Vérifier que l'expiration est environ 24h après l'émission
        long timeDiff = expiration.getTime() - issuedAt.getTime();
        assertThat(timeDiff).isBetween(86400000L - 1000L, 86400000L + 1000L); // 24h ± 1s
    }

    @Test
    void testMultipleTokensIntegration() {
        // Given
        User user1 = new User();
        user1.setEmail("user1@test.com");
        user1.setName("User One");

        User user2 = new User();
        user2.setEmail("user2@test.com");
        user2.setName("User Two");

        // When
        String token1 = jwtService.generateToken(user1);
        String token2 = jwtService.generateToken(user2);

        // Then
        assertThat(token1).isNotNull();
        assertThat(token2).isNotNull();
        assertThat(token1).isNotEqualTo(token2);

        assertThat(jwtService.extractUsername(token1)).isEqualTo("user1@test.com");
        assertThat(jwtService.extractUsername(token2)).isEqualTo("user2@test.com");
    }

    @Test
    void testTokenValidationWithSpringSecurityIntegration() {
        // Given
        String token = jwtService.generateToken(testUser);

        // Create a UserDetails that implements Spring Security's UserDetails
        UserDetails validUserDetails = new org.springframework.security.core.userdetails.User(
                testUser.getEmail(),
                testUser.getPassword(),
                java.util.Collections.emptyList());

        UserDetails invalidUserDetails = new org.springframework.security.core.userdetails.User(
                "different@test.com",
                "password",
                java.util.Collections.emptyList());

        // When & Then
        assertThat(jwtService.isTokenValid(token, validUserDetails)).isTrue();
        assertThat(jwtService.isTokenValid(token, invalidUserDetails)).isFalse();
    }

    @Test
    void testConfigurationLoadingIntegration() {
        // This test ensures that the JWT secret is properly loaded from
        // application-test.properties
        // Given
        String token = jwtService.generateToken(testUser);

        // When
        String extractedUsername = jwtService.extractUsername(token);

        // Then
        assertThat(extractedUsername).isEqualTo(testUser.getEmail());

        // If the configuration wasn't loaded properly, token generation/extraction
        // would fail
        assertThatCode(() -> {
            jwtService.generateToken(testUser);
            jwtService.extractUsername(token);
        }).doesNotThrowAnyException();
    }
}
