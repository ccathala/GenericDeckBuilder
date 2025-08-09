package com.suri.generic.deck.builder.controller;

import com.suri.generic.deck.builder.dto.*;
import com.suri.generic.deck.builder.dto.request.*;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.service.DeckVisualizationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

/**
 * Contrôleur REST pour la gestion de la visualisation des decks avec colonnes
 * personnalisables
 */
@RestController
@RequestMapping("/api/decks/{deckId}/visualization")
@RequiredArgsConstructor
@Slf4j
@Tag(name = "Deck Visualization", description = "API pour la visualisation personnalisée des decks")
public class DeckVisualizationController {

    private final DeckVisualizationService visualizationService;

    @GetMapping
    @Operation(summary = "Récupérer la visualisation d'un deck", description = "Récupère les colonnes et cartes d'un deck")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Visualisation récupérée avec succès"),
            @ApiResponse(responseCode = "404", description = "Deck non trouvé"),
            @ApiResponse(responseCode = "403", description = "Accès non autorisé")
    })
    public ResponseEntity<DeckVisualizationResponseDTO> getDeckVisualization(
            @Parameter(description = "ID du deck") @PathVariable UUID deckId,
            @AuthenticationPrincipal User user) {

        log.info("Récupération visualisation deck {} par utilisateur {}", deckId, user.getEmail());
        DeckVisualizationResponseDTO response = visualizationService.getDeckVisualization(deckId, user.getId());
        return ResponseEntity.ok(response);
    }

    @PostMapping("/columns")
    @Operation(summary = "Créer une nouvelle colonne", description = "Crée une nouvelle colonne de visualisation pour le deck")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Colonne créée avec succès"),
            @ApiResponse(responseCode = "400", description = "Données de requête invalides"),
            @ApiResponse(responseCode = "403", description = "Accès non autorisé")
    })
    public ResponseEntity<DeckColumnGroupDTO> createColumn(
            @Parameter(description = "ID du deck") @PathVariable UUID deckId,
            @Valid @RequestBody DeckColumnCreateRequestDTO request,
            @AuthenticationPrincipal User user) {

        log.info("Création colonne '{}' pour deck {} par utilisateur {}",
                request.getName(), deckId, user.getEmail());

        DeckColumnGroupDTO response = visualizationService.createColumnGroup(deckId, request, user.getId());
        return ResponseEntity.ok(response);
    }

    @PutMapping("/columns/{columnId}")
    @Operation(summary = "Mettre à jour une colonne", description = "Met à jour les propriétés d'une colonne existante")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Colonne mise à jour avec succès"),
            @ApiResponse(responseCode = "400", description = "Données de requête invalides"),
            @ApiResponse(responseCode = "404", description = "Colonne non trouvée"),
            @ApiResponse(responseCode = "403", description = "Accès non autorisé")
    })
    public ResponseEntity<DeckColumnGroupDTO> updateColumn(
            @Parameter(description = "ID du deck") @PathVariable UUID deckId,
            @Parameter(description = "ID de la colonne") @PathVariable UUID columnId,
            @Valid @RequestBody DeckColumnUpdateRequestDTO request,
            @AuthenticationPrincipal User user) {

        log.info("Mise à jour colonne {} pour deck {} par utilisateur {}",
                columnId, deckId, user.getEmail());

        DeckColumnGroupDTO response = visualizationService.updateColumnGroup(deckId, columnId, request, user.getId());
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/columns/{columnId}")
    @Operation(summary = "Supprimer une colonne", description = "Supprime une colonne et redistribue ses cartes")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Colonne supprimée avec succès"),
            @ApiResponse(responseCode = "404", description = "Colonne non trouvée"),
            @ApiResponse(responseCode = "403", description = "Accès non autorisé")
    })
    public ResponseEntity<Void> deleteColumn(
            @Parameter(description = "ID du deck") @PathVariable UUID deckId,
            @Parameter(description = "ID de la colonne") @PathVariable UUID columnId,
            @AuthenticationPrincipal User user) {

        log.info("Suppression colonne {} pour deck {} par utilisateur {}",
                columnId, deckId, user.getEmail());

        visualizationService.deleteColumnGroup(deckId, columnId, user.getId());
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/move-card")
    @Operation(summary = "Déplacer une carte", description = "Déplace une carte d'une colonne à une autre avec position spécifique")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Carte déplacée avec succès"),
            @ApiResponse(responseCode = "400", description = "Données de requête invalides"),
            @ApiResponse(responseCode = "404", description = "Carte ou colonne non trouvée"),
            @ApiResponse(responseCode = "403", description = "Accès non autorisé")
    })
    public ResponseEntity<Void> moveCard(
            @Parameter(description = "ID du deck") @PathVariable UUID deckId,
            @Valid @RequestBody CardMoveRequestDTO request,
            @AuthenticationPrincipal User user) {

        log.info("Déplacement carte {} de {} vers {} pour deck {} par utilisateur {}",
                request.getCardId(), request.getSourceColumnId(), request.getTargetColumnId(),
                deckId, user.getEmail());

        visualizationService.moveCardBetweenColumns(
                deckId,
                UUID.fromString(request.getCardId()),
                request.getSourceColumnId(),
                request.getTargetColumnId(),
                request.getNewPositionInPile(),
                user.getId());
        return ResponseEntity.ok().build();
    }
}
