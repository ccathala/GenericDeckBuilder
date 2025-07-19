package com.suri.generic.deck.builder.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.suri.generic.deck.builder.dto.response.AuthResponse;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.UserRepository;
import com.suri.generic.deck.builder.service.JwtService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.Map;
import java.util.Optional;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Tests unitaires pour AuthController
 * Ces tests vérifient les endpoints d'authentification (register et login)
 */
@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class AuthControllerTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private AuthenticationManager authenticationManager;

    @Mock
    private JwtService jwtService;

    @InjectMocks
    private AuthController authController;

    private MockMvc mockMvc;
    private ObjectMapper objectMapper;

    private User testUser;
    private Map<String, String> registerPayload;
    private Map<String, String> loginPayload;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(authController).build();
        objectMapper = new ObjectMapper();

        // Créer un utilisateur de test
        testUser = new User();
        testUser.setId(1L);
        testUser.setEmail("test@example.com");
        testUser.setName("Test User");
        testUser.setPassword("encodedPassword");

        // Créer les payloads de test
        registerPayload = Map.of(
                "email", "test@example.com",
                "password", "password123",
                "name", "Test User");

        loginPayload = Map.of(
                "email", "test@example.com",
                "password", "password123");
    }

    // ===== TESTS REGISTER =====

    @Test
    void testRegister_Success() {
        // Given
        when(userRepository.existsByEmail("test@example.com")).thenReturn(false);
        when(passwordEncoder.encode("password123")).thenReturn("encodedPassword");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setId(1L);
            return user;
        });
        when(jwtService.generateToken(any(User.class))).thenReturn("jwt-token");

        // When
        ResponseEntity<?> response = authController.register(registerPayload);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).isInstanceOf(AuthResponse.class);

        if (response.getBody() instanceof AuthResponse authResponse) {
            assertThat(authResponse.getToken()).isEqualTo("jwt-token");
            assertThat(authResponse.getUser().getEmail()).isEqualTo("test@example.com");
            assertThat(authResponse.getUser().getName()).isEqualTo("Test User");
        }

        verify(userRepository).existsByEmail("test@example.com");
        verify(passwordEncoder).encode("password123");
        verify(userRepository).save(any(User.class));
        verify(jwtService).generateToken(any(User.class));
    }

    @Test
    void testRegister_WithMockMvc_Success() throws Exception {
        // Given
        when(userRepository.existsByEmail("test@example.com")).thenReturn(false);
        when(passwordEncoder.encode("password123")).thenReturn("encodedPassword");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setId(1L);
            return user;
        });
        when(jwtService.generateToken(any(User.class))).thenReturn("jwt-token");

        // When & Then
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").value("jwt-token"))
                .andExpect(jsonPath("$.user.email").value("test@example.com"))
                .andExpect(jsonPath("$.user.name").value("Test User"))
                .andExpect(jsonPath("$.user.id").value(1));
    }

    @Test
    void testRegister_EmailAlreadyExists_ReturnsBadRequest() {
        // Given
        when(userRepository.existsByEmail("test@example.com")).thenReturn(true);

        // When
        ResponseEntity<?> response = authController.register(registerPayload);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
        assertThat(response.getBody()).isInstanceOf(Map.class);

        if (response.getBody() instanceof Map<?, ?> errorResponse) {
            assertThat(errorResponse.get("error")).isEqualTo("Email déjà utilisé");
        }

        verify(userRepository).existsByEmail("test@example.com");
        verify(userRepository, never()).save(any(User.class));
        verify(jwtService, never()).generateToken(any(User.class));
    }

    @Test
    void testRegister_EmailAlreadyExists_WithMockMvc() throws Exception {
        // Given
        when(userRepository.existsByEmail("test@example.com")).thenReturn(true);

        // When & Then
        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registerPayload)))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.error").value("Email déjà utilisé"));
    }

    @Test
    void testRegister_CreatesUserWithCorrectData() {
        // Given
        when(userRepository.existsByEmail("test@example.com")).thenReturn(false);
        when(passwordEncoder.encode("password123")).thenReturn("encodedPassword");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setId(1L);
            return user;
        });
        when(jwtService.generateToken(any(User.class))).thenReturn("jwt-token");

        // When
        authController.register(registerPayload);

        // Then - Vérifier que l'utilisateur est créé avec les bonnes données
        verify(userRepository).save(argThat(user -> {
            assertThat(user.getEmail()).isEqualTo("test@example.com");
            assertThat(user.getName()).isEqualTo("Test User");
            assertThat(user.getPassword()).isEqualTo("encodedPassword");
            return true;
        }));
    }

    // ===== TESTS LOGIN =====

    @Test
    void testLogin_Success() {
        // Given
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenReturn(null); // Authentication réussie
        when(userRepository.findByEmail("test@example.com")).thenReturn(Optional.of(testUser));
        when(jwtService.generateToken(testUser)).thenReturn("jwt-token");

        // When
        ResponseEntity<?> response = authController.login(loginPayload);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).isInstanceOf(AuthResponse.class);

        if (response.getBody() instanceof AuthResponse authResponse) {
            assertThat(authResponse.getToken()).isEqualTo("jwt-token");
            assertThat(authResponse.getUser().getEmail()).isEqualTo("test@example.com");
            assertThat(authResponse.getUser().getName()).isEqualTo("Test User");
            assertThat(authResponse.getUser().getId()).isEqualTo(1L);
        }

        verify(authenticationManager).authenticate(any(UsernamePasswordAuthenticationToken.class));
        verify(userRepository).findByEmail("test@example.com");
        verify(jwtService).generateToken(testUser);
    }

    @Test
    void testLogin_WithMockMvc_Success() throws Exception {
        // Given
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenReturn(null);
        when(userRepository.findByEmail("test@example.com")).thenReturn(Optional.of(testUser));
        when(jwtService.generateToken(testUser)).thenReturn("jwt-token");

        // When & Then
        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(loginPayload)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").value("jwt-token"))
                .andExpect(jsonPath("$.user.email").value("test@example.com"))
                .andExpect(jsonPath("$.user.name").value("Test User"))
                .andExpect(jsonPath("$.user.id").value(1));
    }

    @Test
    void testLogin_InvalidCredentials_ThrowsException() {
        // Given
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenThrow(new BadCredentialsException("Bad credentials"));

        // When & Then
        assertThatThrownBy(() -> authController.login(loginPayload))
                .isInstanceOf(BadCredentialsException.class)
                .hasMessage("Bad credentials");

        verify(authenticationManager).authenticate(any(UsernamePasswordAuthenticationToken.class));
        verify(userRepository, never()).findByEmail(anyString());
        verify(jwtService, never()).generateToken(any(User.class));
    }

    @Test
    void testLogin_UserNotFoundAfterAuthentication_ThrowsException() {
        // Given
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenReturn(null);
        when(userRepository.findByEmail("test@example.com")).thenReturn(Optional.empty());

        // When & Then
        assertThatThrownBy(() -> authController.login(loginPayload))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("Utilisateur non trouvé");

        verify(authenticationManager).authenticate(any(UsernamePasswordAuthenticationToken.class));
        verify(userRepository).findByEmail("test@example.com");
        verify(jwtService, never()).generateToken(any(User.class));
    }

    @Test
    void testLogin_CorrectAuthenticationCall() {
        // Given
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenReturn(null);
        when(userRepository.findByEmail("test@example.com")).thenReturn(Optional.of(testUser));
        when(jwtService.generateToken(testUser)).thenReturn("jwt-token");

        // When
        authController.login(loginPayload);

        // Then - Vérifier que l'authentification est appelée avec les bons paramètres
        verify(authenticationManager).authenticate(argThat(token -> {
            assertThat(token.getPrincipal()).isEqualTo("test@example.com");
            assertThat(token.getCredentials()).isEqualTo("password123");
            return true;
        }));
    }

    // ===== TESTS EDGE CASES =====

    @Test
    void testRegister_WithNullValues() {
        // Given
        Map<String, String> nullPayload = Map.of(
                "email", "test@example.com",
                "password", "password123"
        // name manquant
        );

        when(userRepository.existsByEmail("test@example.com")).thenReturn(false);
        when(passwordEncoder.encode("password123")).thenReturn("encodedPassword");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setId(1L);
            return user;
        });
        when(jwtService.generateToken(any(User.class))).thenReturn("jwt-token");

        // When
        ResponseEntity<?> response = authController.register(nullPayload);

        // Then - Doit fonctionner même avec des valeurs null
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);

        verify(userRepository).save(argThat(user -> {
            assertThat(user.getEmail()).isEqualTo("test@example.com");
            assertThat(user.getName()).isNull();
            assertThat(user.getPassword()).isEqualTo("encodedPassword");
            return true;
        }));
    }

    @Test
    void testAuthenticationTokenCreation() {
        // Given
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenReturn(null);
        when(userRepository.findByEmail("test@example.com")).thenReturn(Optional.of(testUser));
        when(jwtService.generateToken(testUser)).thenReturn("jwt-token");

        // When
        authController.login(loginPayload);

        // Then - Vérifier la création du token d'authentification
        verify(authenticationManager).authenticate(argThat(authToken -> {
            return authToken instanceof UsernamePasswordAuthenticationToken &&
                    authToken.getPrincipal().equals("test@example.com") &&
                    authToken.getCredentials().equals("password123");
        }));
    }

    @Test
    void testRegister_ResponseStructure() {
        // Given
        when(userRepository.existsByEmail("test@example.com")).thenReturn(false);
        when(passwordEncoder.encode("password123")).thenReturn("encodedPassword");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setId(1L);
            return user;
        });
        when(jwtService.generateToken(any(User.class))).thenReturn("jwt-token");

        // When
        ResponseEntity<?> response = authController.register(registerPayload);

        // Then - Vérifier la structure complète de la réponse
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).isInstanceOf(AuthResponse.class);

        if (response.getBody() instanceof AuthResponse authResponse) {
            assertThat(authResponse.getToken()).isEqualTo("jwt-token");
            assertThat(authResponse.getUser()).isNotNull();
            assertThat(authResponse.getUser().getId()).isEqualTo(1L);
            assertThat(authResponse.getUser().getEmail()).isEqualTo("test@example.com");
            assertThat(authResponse.getUser().getName()).isEqualTo("Test User");
        }
    }

    @Test
    void testLogin_ResponseStructure() {
        // Given
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenReturn(null);
        when(userRepository.findByEmail("test@example.com")).thenReturn(Optional.of(testUser));
        when(jwtService.generateToken(testUser)).thenReturn("jwt-token");

        // When
        ResponseEntity<?> response = authController.login(loginPayload);

        // Then - Vérifier la structure complète de la réponse
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).isInstanceOf(AuthResponse.class);

        if (response.getBody() instanceof AuthResponse authResponse) {
            assertThat(authResponse.getToken()).isEqualTo("jwt-token");
            assertThat(authResponse.getUser()).isNotNull();
            assertThat(authResponse.getUser().getId()).isEqualTo(1L);
            assertThat(authResponse.getUser().getEmail()).isEqualTo("test@example.com");
            assertThat(authResponse.getUser().getName()).isEqualTo("Test User");
        }
    }

    @Test
    void testPasswordEncoding() {
        // Given
        when(userRepository.existsByEmail("test@example.com")).thenReturn(false);
        when(passwordEncoder.encode("password123")).thenReturn("super-encoded-password");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setId(1L);
            return user;
        });
        when(jwtService.generateToken(any(User.class))).thenReturn("jwt-token");

        // When
        authController.register(registerPayload);

        // Then - Vérifier que le mot de passe est encodé
        verify(passwordEncoder).encode("password123");
        verify(userRepository).save(argThat(user -> user.getPassword().equals("super-encoded-password")));
    }
}
