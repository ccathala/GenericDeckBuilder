package com.suri.generic.deck.builder.security;

import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.service.JwtService;
import com.suri.generic.deck.builder.service.UserService;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.FilterChain;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.context.SecurityContextHolder;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.Key;
import java.util.Date;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("JWT Token Expiration Tests")
class JwtTokenExpirationTest {

    @Mock
    private JwtService jwtService;

    @Mock
    private UserService userService;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private FilterChain filterChain;

    @InjectMocks
    private JwtFilter jwtFilter;

    private User testUser;
    private String validToken;
    private String expiredToken;
    private String invalidToken;

    // Clé secrète de test (doit être identique à celle utilisée dans les tests)
    private final String SECRET_KEY = "dGVzdC1zZWNyZXQta2V5LWZvci1qd3QtdG9rZW4tZ2VuZXJhdGlvbi1hbmQtdmFsaWRhdGlvbi10ZXN0aW5n";

    @BeforeEach
    void setUp() {
        SecurityContextHolder.clearContext();

        testUser = new User();
        testUser.setId(1L);
        testUser.setEmail("test@example.com");
        testUser.setName("Test User");

        // Créer des tokens pour les tests
        validToken = createTestToken(testUser.getEmail(), false);
        expiredToken = createTestToken(testUser.getEmail(), true);
        invalidToken = "invalid.jwt.token";
    }

    @Test
    @DisplayName("Doit gérer un token JWT expiré et renvoyer 401")
    void shouldHandleExpiredJwtTokenAndReturn401() throws Exception {
        // Given
        when(request.getHeader("Authorization")).thenReturn("Bearer " + expiredToken);
        when(jwtService.extractUsername(expiredToken)).thenThrow(new ExpiredJwtException(null, null, "Token expired"));

        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(printWriter);

        // When
        jwtFilter.doFilterInternal(request, response, filterChain);

        // Then
        verify(response).setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        verify(response).setContentType("application/json");
        verify(filterChain, never()).doFilter(request, response);

        String responseBody = stringWriter.toString();
        assertEquals("{\"error\":\"Token expiré. Veuillez vous reconnecter.\",\"code\":\"TOKEN_EXPIRED\"}",
                responseBody);

        // Vérifier que l'authentification n'a pas été définie
        assertNull(SecurityContextHolder.getContext().getAuthentication());
    }

    @Test
    @DisplayName("Doit gérer un token JWT invalide et renvoyer 401")
    void shouldHandleInvalidJwtTokenAndReturn401() throws Exception {
        // Given
        when(request.getHeader("Authorization")).thenReturn("Bearer " + invalidToken);
        when(jwtService.extractUsername(invalidToken))
                .thenThrow(new io.jsonwebtoken.MalformedJwtException("Invalid token"));

        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(printWriter);

        // When
        jwtFilter.doFilterInternal(request, response, filterChain);

        // Then
        verify(response).setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        verify(response).setContentType("application/json");
        verify(filterChain, never()).doFilter(request, response);

        String responseBody = stringWriter.toString();
        assertEquals("{\"error\":\"Token invalide. Veuillez vous reconnecter.\",\"code\":\"TOKEN_INVALID\"}",
                responseBody);

        assertNull(SecurityContextHolder.getContext().getAuthentication());
    }

    @Test
    @DisplayName("Doit traiter correctement un token valide")
    void shouldProcessValidTokenCorrectly() throws Exception {
        // Given
        when(request.getHeader("Authorization")).thenReturn("Bearer " + validToken);
        when(jwtService.extractUsername(validToken)).thenReturn(testUser.getEmail());
        when(userService.findUserByEmail(testUser.getEmail())).thenReturn(testUser);
        when(jwtService.isTokenValid(validToken, testUser)).thenReturn(true);

        // When
        jwtFilter.doFilterInternal(request, response, filterChain);

        // Then
        verify(response, never()).setStatus(anyInt());
        verify(filterChain).doFilter(request, response);

        // Vérifier que l'authentification a été définie
        assertEquals(testUser, SecurityContextHolder.getContext().getAuthentication().getPrincipal());
    }

    @Test
    @DisplayName("Doit passer à travers sans header Authorization")
    void shouldPassThroughWithoutAuthorizationHeader() throws Exception {
        // Given
        when(request.getHeader("Authorization")).thenReturn(null);

        // When
        jwtFilter.doFilterInternal(request, response, filterChain);

        // Then
        verify(jwtService, never()).extractUsername(anyString());
        verify(filterChain).doFilter(request, response);
        assertNull(SecurityContextHolder.getContext().getAuthentication());
    }

    @Test
    @DisplayName("Doit gérer les erreurs génériques et renvoyer 401")
    void shouldHandleGenericErrorsAndReturn401() throws Exception {
        // Given
        when(request.getHeader("Authorization")).thenReturn("Bearer " + validToken);
        when(jwtService.extractUsername(validToken)).thenThrow(new RuntimeException("Unexpected error"));

        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(printWriter);

        // When
        jwtFilter.doFilterInternal(request, response, filterChain);

        // Then
        verify(response).setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        verify(response).setContentType("application/json");
        verify(filterChain, never()).doFilter(request, response);

        String responseBody = stringWriter.toString();
        assertEquals("{\"error\":\"Erreur d'authentification. Veuillez vous reconnecter.\",\"code\":\"AUTH_ERROR\"}",
                responseBody);
    }

    /**
     * Crée un token JWT de test
     */
    private String createTestToken(String email, boolean expired) {
        Key key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(SECRET_KEY));
        Date issuedAt = new Date();
        Date expiration = expired
                ? new Date(System.currentTimeMillis() - 1000) // Expiré depuis 1 seconde
                : new Date(System.currentTimeMillis() + 86400000); // Expire dans 24h

        return Jwts.builder()
                .setSubject(email)
                .setIssuedAt(issuedAt)
                .setExpiration(expiration)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }
}
