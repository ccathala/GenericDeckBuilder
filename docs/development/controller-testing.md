# 🧪 Guide des Tests de Contrôleurs

Ce guide explique comment rédiger des tests unitaires efficaces pour les contrôleurs Spring Boot, en se basant sur les meilleures pratiques et les leçons apprises du projet GenericDeckBuilder.

## 📋 Table des Matières

- [Configuration de Base](#configuration-de-base)
- [Gestion de l'Authentification](#gestion-de-lauthentification)
- [Mocking des Services](#mocking-des-services)
- [Tests des Codes d'Erreur](#tests-des-codes-derreur)
- [Bonnes Pratiques](#bonnes-pratiques)
- [Exemple Complet](#exemple-complet)
- [Résolution de Problèmes](#résolution-de-problèmes)

## Configuration de Base

### Structure de Test avec @WebMvcTest

```java
@WebMvcTest(controllers = MonController.class)
@DisplayName("MonController Tests")
class MonControllerTest {

    @Autowired
    private MockMvc mockMvc;

    // Mocks des services nécessaires
    @MockBean
    private MonService monService;

    @MockBean
    private JwtService jwtService;  // Requis pour la sécurité JWT

    @MockBean
    private UserService userService;  // Requis pour l'authentification

    private User testUser;
    private UUID testId;

    @BeforeEach
    void setUp() {
        // Initialisation des objets de test
        testUser = new User();
        testUser.setId(1L);
        testUser.setEmail("test@example.com");
        testUser.setName("Test User");

        testId = UUID.randomUUID();

        // Configuration des mocks de base
        when(userService.findUserByEmail("test@example.com")).thenReturn(testUser);
        when(userService.loadUserByUsername("test@example.com")).thenReturn(testUser);
    }
}
```

### Imports Nécessaires

```java
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

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
```

## Gestion de l'Authentification

### Problème avec @WithMockUser

❌ **Ne fonctionne pas** avec `@AuthenticationPrincipal User` :

```java
@Test
@WithMockUser  // Ne fournit pas notre objet User personnalisé
void testWithMockUser() {
    // L'objet User sera null dans le contrôleur
}
```

### ✅ Solution : Authentification Manuelle

```java
private void authenticateUser() {
    UsernamePasswordAuthenticationToken authToken =
        new UsernamePasswordAuthenticationToken(testUser, null, testUser.getAuthorities());
    SecurityContextHolder.getContext().setAuthentication(authToken);
}

@Test
@DisplayName("Should perform action with authenticated user")
void testWithAuthentication() throws Exception {
    // Given
    authenticateUser();  // Configuration de l'authentification
    when(monService.performAction(eq(testId), any(User.class)))
        .thenReturn(expectedResult);

    // When & Then
    mockMvc.perform(post("/api/endpoint/{id}", testId)
            .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(content().contentType(MediaType.APPLICATION_JSON));
}
```

### Test sans Authentification

```java
@Test
@DisplayName("Should return 401 when user is not authenticated")
void testWithoutAuthentication() throws Exception {
    // Pas d'appel à authenticateUser()

    mockMvc.perform(get("/api/protected-endpoint")
            .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isUnauthorized());
}
```

## Mocking des Services

### Configuration des Mocks

```java
@BeforeEach
void setUp() {
    // Mocks pour les cas de succès
    when(monService.findById(testId)).thenReturn(expectedObject);
    when(monService.create(any(CreateRequestDTO.class), any(User.class)))
        .thenReturn(createdObject);

    // Mocks pour les cas d'erreur
    when(monService.findById(UUID.fromString("non-existent-id")))
        .thenThrow(new EntityNotFoundException("Objet non trouvé"));
}
```

### Vérification des Appels

```java
@Test
void testServiceCalled() throws Exception {
    // Given
    authenticateUser();

    // When
    mockMvc.perform(get("/api/endpoint/{id}", testId))
        .andExpect(status().isOk());

    // Then
    verify(monService).findById(eq(testId));
    verify(monService, never()).deleteById(any());
}
```

## Tests des Codes d'Erreur

### Configuration du GlobalExceptionHandler

Pour que les tests retournent les bons codes d'erreur, assurez-vous que votre `GlobalExceptionHandler` gère toutes les exceptions :

```java
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<Map<String, String>> handleEntityNotFound(EntityNotFoundException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
            .body(Map.of("error", ex.getMessage()));
    }

    @ExceptionHandler(UnauthorizedAccessException.class)
    public ResponseEntity<Map<String, String>> handleUnauthorizedAccess(UnauthorizedAccessException ex) {
        return ResponseEntity.status(HttpStatus.FORBIDDEN)
            .body(Map.of("error", ex.getMessage()));
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public ResponseEntity<Map<String, String>> handleTypeMismatch(MethodArgumentTypeMismatchException ex) {
        return ResponseEntity.badRequest()
            .body(Map.of("error", "Paramètre invalide: " + ex.getName()));
    }
}
```

### Tests des Différents Codes d'Erreur

```java
@Test
@DisplayName("Should return 404 when entity not found")
void testNotFound() throws Exception {
    // Given
    authenticateUser();
    when(monService.findById(testId))
        .thenThrow(new EntityNotFoundException("Entité non trouvée"));

    // When & Then
    mockMvc.perform(get("/api/endpoint/{id}", testId))
        .andExpect(status().isNotFound())
        .andExpect(jsonPath("$.error").value("Entité non trouvée"));
}

@Test
@DisplayName("Should return 403 when user is not authorized")
void testForbidden() throws Exception {
    // Given
    authenticateUser();
    when(monService.performAction(eq(testId), any(User.class)))
        .thenThrow(new UnauthorizedAccessException("Accès non autorisé"));

    // When & Then
    mockMvc.perform(post("/api/endpoint/{id}/action", testId))
        .andExpect(status().isForbidden());
}

@Test
@DisplayName("Should return 400 when UUID is invalid")
void testBadRequest() throws Exception {
    // Given
    authenticateUser();

    // When & Then
    mockMvc.perform(get("/api/endpoint/invalid-uuid"))
        .andExpect(status().isBadRequest());
}
```

## Bonnes Pratiques

### 1. Nommage des Tests

```java
// ✅ Bon : Description claire de ce qui est testé
@Test
@DisplayName("Should export deck successfully with default locale")
void exportDeck_withDefaultLocale_shouldSucceed() { }

@Test
@DisplayName("Should return 404 when deck not found")
void exportDeck_withNonExistentDeck_shouldReturn404() { }

// ❌ Mauvais : Noms peu descriptifs
@Test
void testExport() { }

@Test
void testError() { }
```

### 2. Structure Given-When-Then

```java
@Test
void testMethod() throws Exception {
    // Given - Configuration des données et mocks
    authenticateUser();
    RequestDTO request = new RequestDTO();
    request.setProperty("value");
    when(service.process(any(), any())).thenReturn(expectedResult);

    // When - Exécution de l'action
    ResultActions result = mockMvc.perform(post("/api/endpoint")
        .contentType(MediaType.APPLICATION_JSON)
        .content(objectMapper.writeValueAsString(request)));

    // Then - Vérifications
    result.andExpect(status().isOk())
          .andExpect(jsonPath("$.property").value("expectedValue"));

    verify(service).process(eq(request), eq(testUser));
}
```

### 3. Tests de Validation

```java
@Test
@DisplayName("Should validate request body")
void testValidation() throws Exception {
    // Given
    authenticateUser();
    RequestDTO invalidRequest = new RequestDTO(); // Champs requis manquants

    // When & Then
    mockMvc.perform(post("/api/endpoint")
            .contentType(MediaType.APPLICATION_JSON)
            .content(objectMapper.writeValueAsString(invalidRequest)))
        .andExpect(status().isBadRequest());
}
```

### 4. Tests de Contenu de Réponse

```java
@Test
void testResponseContent() throws Exception {
    // Given
    authenticateUser();
    ResponseDTO expectedResponse = new ResponseDTO();
    expectedResponse.setProperty("value");
    when(service.getEntity(testId)).thenReturn(expectedResponse);

    // When & Then
    mockMvc.perform(get("/api/endpoint/{id}", testId))
        .andExpect(status().isOk())
        .andExpect(content().contentType(MediaType.APPLICATION_JSON))
        .andExpect(jsonPath("$.property").value("value"))
        .andExpect(jsonPath("$.property").exists())
        .andExpect(jsonPath("$.nonExistentProperty").doesNotExist());
}
```

## Exemple Complet

Voici un exemple complet d'une classe de test de contrôleur :

```java
@WebMvcTest(controllers = DeckController.class)
@DisplayName("DeckController Tests")
class DeckControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private DeckService deckService;

    @MockBean
    private JwtService jwtService;

    @MockBean
    private UserService userService;

    private User testUser;
    private UUID testDeckId;
    private DeckResponseDTO deckResponse;

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setId(1L);
        testUser.setEmail("test@example.com");
        testUser.setName("Test User");

        testDeckId = UUID.randomUUID();

        deckResponse = new DeckResponseDTO();
        deckResponse.setId(testDeckId);
        deckResponse.setName("Test Deck");

        // Configuration des mocks pour l'authentification
        when(userService.findUserByEmail("test@example.com")).thenReturn(testUser);
        when(userService.loadUserByUsername("test@example.com")).thenReturn(testUser);
    }

    private void authenticateUser() {
        UsernamePasswordAuthenticationToken authToken =
            new UsernamePasswordAuthenticationToken(testUser, null, testUser.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authToken);
    }

    @Test
    @DisplayName("Should get deck successfully")
    void getDeck_withValidId_shouldSucceed() throws Exception {
        // Given
        authenticateUser();
        when(deckService.getDeck(testDeckId, testUser)).thenReturn(deckResponse);

        // When & Then
        mockMvc.perform(get("/api/decks/{id}", testDeckId)
                .contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON))
            .andExpect(jsonPath("$.id").value(testDeckId.toString()))
            .andExpect(jsonPath("$.name").value("Test Deck"));

        verify(deckService).getDeck(testDeckId, testUser);
    }

    @Test
    @DisplayName("Should return 404 when deck not found")
    void getDeck_withNonExistentId_shouldReturn404() throws Exception {
        // Given
        authenticateUser();
        when(deckService.getDeck(testDeckId, testUser))
            .thenThrow(new DeckNotFoundException("Deck non trouvé"));

        // When & Then
        mockMvc.perform(get("/api/decks/{id}", testDeckId)
                .contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isNotFound())
            .andExpect(jsonPath("$.error").value("Deck non trouvé"));
    }

    @Test
    @DisplayName("Should return 401 when user is not authenticated")
    void getDeck_withoutAuthentication_shouldReturn401() throws Exception {
        // When & Then (pas d'authentification)
        mockMvc.perform(get("/api/decks/{id}", testDeckId)
                .contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isUnauthorized());
    }
}
```

## Résolution de Problèmes

### Problème : "Content type not set"

**Cause** : L'objet User est null dans le contrôleur
**Solution** : Utiliser l'authentification manuelle au lieu de `@WithMockUser`

### Problème : "ApplicationContext failure"

**Cause** : Mocks manquants pour les services requis par Spring Security
**Solution** : Ajouter `@MockBean` pour `JwtService` et `UserService`

### Problème : Codes d'erreur 500 au lieu des codes attendus

**Cause** : Exceptions non gérées par le `GlobalExceptionHandler`
**Solution** : Ajouter les gestionnaires d'exception appropriés

### Problème : @MockBean deprecated

**Cause** : Spring Boot 3.4+ marque `@MockBean` comme déprécié
**Impact** : Warnings de compilation mais fonctionnalité préservée
**Action** : Surveiller les alternatives dans les futures versions

## 📚 Ressources Additionnelles

- [Documentation Spring Boot Testing](https://spring.io/guides/gs/testing-web/)
- [MockMvc Documentation](https://docs.spring.io/spring-framework/docs/current/reference/html/testing.html#spring-mvc-test-framework)
- [Guide des Tests d'Intégration](testing.md)

---

_Documentation mise à jour le 1er août 2025_
