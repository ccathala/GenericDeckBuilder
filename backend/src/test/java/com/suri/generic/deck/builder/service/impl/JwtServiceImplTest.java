package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.service.JwtService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.MalformedJwtException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.Date;
import java.util.function.Function;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
 * Tests unitaires pour JwtServiceImpl
 * Ces tests vérifient la génération, validation et extraction des données JWT
 */
@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class JwtServiceImplTest {

    private JwtService jwtService;
    private User testUser;
    private UserDetails mockUserDetails;
    private String validToken;

    // Clé de test fixe pour assurer la cohérence des tests
    private static final String TEST_SECRET = "testSecretKeyThatIsAtLeast256BitsLongForJwtTestingPurposesOnly12345";
    private static final Long TEST_EXPIRATION = 86400000L; // 24h pour les tests

    @BeforeEach
    void setUp() {
        jwtService = new JwtServiceImpl();

        // Injecter la clé secrète de test
        ReflectionTestUtils.setField(jwtService, "secret", TEST_SECRET);
        // Injecter la durée d'expiration de test
        ReflectionTestUtils.setField(jwtService, "jwtExpirationInMs", TEST_EXPIRATION);

        // Créer un utilisateur de test
        testUser = new User();
        testUser.setId(1L);
        testUser.setEmail("test@example.com");
        testUser.setName("Test User");
        testUser.setPassword("encodedPassword");

        // Mock UserDetails
        mockUserDetails = mock(UserDetails.class);
        when(mockUserDetails.getUsername()).thenReturn("test@example.com");

        // Générer un token valide pour les tests
        validToken = jwtService.generateToken(testUser);
    }

    @Test
    void testGenerateToken_Success() {
        // When
        String token = jwtService.generateToken(testUser);

        // Then
        assertThat(token).isNotNull();
        assertThat(token).isNotEmpty();
        // Un JWT valide a 3 parties séparées par des points
        assertThat(token.split("\\.")).hasSize(3);
    }

    @Test
    void testGenerateToken_WithNullUser_ThrowsException() {
        // When & Then
        assertThatThrownBy(() -> jwtService.generateToken(null))
                .isInstanceOf(NullPointerException.class);
    }

    @Test
    void testExtractUsername_Success() {
        // When
        String extractedUsername = jwtService.extractUsername(validToken);

        // Then
        assertThat(extractedUsername).isEqualTo("test@example.com");
    }

    @Test
    void testExtractUsername_WithInvalidToken_ThrowsException() {
        // Given
        String invalidToken = "invalid.jwt.token";

        // When & Then
        assertThatThrownBy(() -> jwtService.extractUsername(invalidToken))
                .isInstanceOf(MalformedJwtException.class);
    }

    @Test
    void testExtractUsername_WithMalformedToken_ThrowsException() {
        // Given
        String malformedToken = "not-a-jwt-token";

        // When & Then
        assertThatThrownBy(() -> jwtService.extractUsername(malformedToken))
                .isInstanceOf(MalformedJwtException.class);
    }

    @Test
    void testExtractClaim_WithSubjectClaim_Success() {
        // Given
        Function<Claims, String> subjectExtractor = Claims::getSubject;

        // When
        String subject = jwtService.extractClaim(validToken, subjectExtractor);

        // Then
        assertThat(subject).isEqualTo("test@example.com");
    }

    @Test
    void testExtractClaim_WithIssuedAtClaim_Success() {
        // Given
        Function<Claims, Date> issuedAtExtractor = Claims::getIssuedAt;

        // When
        Date issuedAt = jwtService.extractClaim(validToken, issuedAtExtractor);

        // Then
        assertThat(issuedAt).isNotNull();
        assertThat(issuedAt).isBeforeOrEqualTo(new Date());
    }

    @Test
    void testExtractClaim_WithExpirationClaim_Success() {
        // Given
        Function<Claims, Date> expirationExtractor = Claims::getExpiration;

        // When
        Date expiration = jwtService.extractClaim(validToken, expirationExtractor);

        // Then
        assertThat(expiration).isNotNull();
        assertThat(expiration).isAfter(new Date());
    }

    @Test
    void testExtractClaim_WithInvalidToken_ThrowsException() {
        // Given
        String invalidToken = "invalid.token.here";
        Function<Claims, String> subjectExtractor = Claims::getSubject;

        // When & Then
        assertThatThrownBy(() -> jwtService.extractClaim(invalidToken, subjectExtractor))
                .isInstanceOf(MalformedJwtException.class);
    }

    @Test
    void testIsTokenValid_WithValidToken_ReturnsTrue() {
        // When
        boolean isValid = jwtService.isTokenValid(validToken, mockUserDetails);

        // Then
        assertThat(isValid).isTrue();
        verify(mockUserDetails).getUsername();
    }

    @Test
    void testIsTokenValid_WithDifferentUsername_ReturnsFalse() {
        // Given
        when(mockUserDetails.getUsername()).thenReturn("different@example.com");

        // When
        boolean isValid = jwtService.isTokenValid(validToken, mockUserDetails);

        // Then
        assertThat(isValid).isFalse();
        verify(mockUserDetails).getUsername();
    }

    @Test
    void testIsTokenValid_WithExpiredToken_ReturnsFalse() throws InterruptedException {
        // Given - Créer un token expiré
        String expiredToken = createExpiredToken();

        // When
        boolean isValid = jwtService.isTokenValid(expiredToken, mockUserDetails);

        // Then
        assertThat(isValid).isFalse();
    }

    @Test
    void testIsTokenValid_WithMalformedToken_ReturnsFalse() {
        // Given
        String malformedToken = "malformed-token";

        // When
        boolean isValid = jwtService.isTokenValid(malformedToken, mockUserDetails);

        // Then
        assertThat(isValid).isFalse();
    }

    @Test
    void testIsTokenValid_WithWrongSignature_ReturnsFalse() {
        // Given - Token signé avec une clé différente
        JwtServiceImpl differentKeyService = new JwtServiceImpl();
        ReflectionTestUtils.setField(differentKeyService, "secret", "differentSecretKey123456789012345678901234567890");
        ReflectionTestUtils.setField(differentKeyService, "jwtExpirationInMs", TEST_EXPIRATION);
        String tokenWithDifferentSignature = differentKeyService.generateToken(testUser);

        // When
        boolean isValid = jwtService.isTokenValid(tokenWithDifferentSignature, mockUserDetails);

        // Then
        assertThat(isValid).isFalse();
    }

    @Test
    void testTokenLifecycle_GenerateValidateExtract() {
        // Given
        User user = new User();
        user.setEmail("lifecycle@test.com");
        user.setName("Lifecycle User");

        UserDetails userDetails = mock(UserDetails.class);
        when(userDetails.getUsername()).thenReturn("lifecycle@test.com");

        // When - Générer le token
        String token = jwtService.generateToken(user);

        // Then - Le token doit être valide
        assertThat(token).isNotNull();
        assertThat(jwtService.isTokenValid(token, userDetails)).isTrue();
        assertThat(jwtService.extractUsername(token)).isEqualTo("lifecycle@test.com");
    }

    @Test
    void testExtractClaim_WithNullResolver_ThrowsException() {
        // When & Then
        assertThatThrownBy(() -> jwtService.extractClaim(validToken, null))
                .isInstanceOf(NullPointerException.class);
    }

    @Test
    void testJwtExpirationConfiguration_DifferentValues() {
        // Given - Créer un service avec une expiration différente
        JwtServiceImpl customExpirationService = new JwtServiceImpl();
        ReflectionTestUtils.setField(customExpirationService, "secret", TEST_SECRET);
        Long customExpiration = 3600000L; // 1 heure
        ReflectionTestUtils.setField(customExpirationService, "jwtExpirationInMs", customExpiration);

        User testUser = new User();
        testUser.setEmail("config@test.com");

        // When
        String token = customExpirationService.generateToken(testUser);

        // Then
        Date issuedAt = customExpirationService.extractClaim(token, Claims::getIssuedAt);
        Date expiration = customExpirationService.extractClaim(token, Claims::getExpiration);

        long actualExpiration = expiration.getTime() - issuedAt.getTime();
        assertThat(actualExpiration).isBetween(customExpiration - 5000L, customExpiration + 5000L);
    }

    @Test
    void testGenerateToken_ConsistentClaims() {
        // Given
        Date beforeGeneration = new Date(System.currentTimeMillis() - 1000); // 1 seconde avant

        // When
        String token = jwtService.generateToken(testUser);

        // Then
        Date afterGeneration = new Date(System.currentTimeMillis() + 1000); // 1 seconde après

        String username = jwtService.extractUsername(token);
        Date issuedAt = jwtService.extractClaim(token, Claims::getIssuedAt);
        Date expiration = jwtService.extractClaim(token, Claims::getExpiration);

        assertThat(username).isEqualTo(testUser.getEmail());
        assertThat(issuedAt).isBetween(beforeGeneration, afterGeneration);
        assertThat(expiration).isAfter(issuedAt);

        // Vérifier que l'expiration correspond à la configuration de test
        long timeDiff = expiration.getTime() - issuedAt.getTime();
        assertThat(timeDiff).isBetween(TEST_EXPIRATION - 5000L, TEST_EXPIRATION + 5000L); // ± 5s
    }

    /**
     * Méthode helper pour créer un token expiré
     */
    private String createExpiredToken() {
        // Utiliser la réflection pour créer temporairement un token avec une date
        // d'expiration passée
        User expiredUser = new User();
        expiredUser.setEmail("expired@test.com");
        expiredUser.setName("Expired User");

        // Créer manuellement un token expiré
        return io.jsonwebtoken.Jwts.builder()
                .setSubject(expiredUser.getEmail())
                .setIssuedAt(new Date(System.currentTimeMillis() - 86400000)) // Hier
                .setExpiration(new Date(System.currentTimeMillis() - 3600000)) // Il y a 1h
                .signWith(io.jsonwebtoken.security.Keys.hmacShaKeyFor(TEST_SECRET.getBytes()),
                        io.jsonwebtoken.SignatureAlgorithm.HS256)
                .compact();
    }
}
