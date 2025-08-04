package com.suri.generic.deck.builder.controller;

import com.suri.generic.deck.builder.exception.DeckNotFoundException;
import com.suri.generic.deck.builder.exception.UnauthorizedAccessException;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import jakarta.persistence.EntityNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import java.util.Map;

@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * Gère les IllegalArgumentException avec des messages personnalisés
     * (ex: validation de deck, paramètres invalides)
     */
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, String>> handleIllegalArgument(IllegalArgumentException ex) {
        log.warn("Validation error: {}", ex.getMessage());
        return ResponseEntity.badRequest().body(Map.of("error", ex.getMessage()));
    }

    /**
     * Gère les EntityNotFoundException
     * (ex: deck non trouvé, carte non trouvée)
     */
    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<Map<String, String>> handleEntityNotFound(EntityNotFoundException ex) {
        log.warn("Entity not found: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("error", ex.getMessage()));
    }

    /**
     * Gère les DeckNotFoundException
     * (ex: deck non trouvé par ID)
     */
    @ExceptionHandler(DeckNotFoundException.class)
    public ResponseEntity<Map<String, String>> handleDeckNotFound(DeckNotFoundException ex) {
        log.warn("Deck not found: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("error", ex.getMessage()));
    }

    /**
     * Gère les UnauthorizedAccessException
     * (ex: utilisateur non autorisé à accéder à une ressource)
     */
    @ExceptionHandler(UnauthorizedAccessException.class)
    public ResponseEntity<Map<String, String>> handleUnauthorizedAccess(UnauthorizedAccessException ex) {
        log.warn("Unauthorized access: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of("error", ex.getMessage()));
    }

    /**
     * Gère les MethodArgumentTypeMismatchException
     * (ex: UUID invalide dans les paramètres d'URL)
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public ResponseEntity<Map<String, String>> handleTypeMismatch(MethodArgumentTypeMismatchException ex) {
        log.warn("Type mismatch error: {}", ex.getMessage());
        String errorMessage = "Paramètre invalide: " + ex.getName();
        return ResponseEntity.badRequest().body(Map.of("error", errorMessage));
    }

    /**
     * Gère les BadCredentialsException (erreurs d'authentification)
     * (ex: identifiants incorrects lors de la connexion)
     */
    @ExceptionHandler(BadCredentialsException.class)
    public ResponseEntity<Map<String, String>> handleBadCredentials(BadCredentialsException ex) {
        log.warn("Authentication failed: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", "Identifiants incorrects"));
    }

    /**
     * Gère les tokens JWT expirés
     * Renvoie toujours 401 Unauthorized pour forcer la déconnexion côté frontend
     */
    @ExceptionHandler(ExpiredJwtException.class)
    public ResponseEntity<Map<String, String>> handleExpiredJwt(ExpiredJwtException ex) {
        log.warn("JWT token expired: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(Map.of("error", "Token expiré. Veuillez vous reconnecter.", "code", "TOKEN_EXPIRED"));
    }

    /**
     * Gère les autres erreurs JWT (token invalide, malformé, etc.)
     * Renvoie toujours 401 Unauthorized pour forcer la déconnexion côté frontend
     */
    @ExceptionHandler(JwtException.class)
    public ResponseEntity<Map<String, String>> handleJwtException(JwtException ex) {
        log.warn("JWT error: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(Map.of("error", "Token invalide. Veuillez vous reconnecter.", "code", "TOKEN_INVALID"));
    }

    /**
     * Gère les erreurs de validation des DTOs Spring
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Map<String, String>> handleValidation(MethodArgumentNotValidException ex) {
        log.warn("Validation error: {}", ex.getMessage());
        String errorMessage = ex.getBindingResult().getAllErrors().stream()
                .findFirst()
                .map(error -> error.getDefaultMessage())
                .orElse("Erreur de validation");
        return ResponseEntity.badRequest().body(Map.of("error", errorMessage));
    }

    /**
     * Gestionnaire générique pour toutes les autres exceptions
     * Maintenu pour la sécurité mais ne devrait plus masquer les erreurs métier
     */
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, String>> handleGeneric(Exception ex) {
        log.error("Unhandled exception: {}", ex.getClass().getSimpleName(), ex);
        return ResponseEntity.internalServerError().body(Map.of("error", "Erreur interne du serveur"));
    }
}
