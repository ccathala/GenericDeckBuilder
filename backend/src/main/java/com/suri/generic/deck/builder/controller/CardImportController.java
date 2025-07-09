package com.suri.generic.deck.builder.controller;

import com.suri.generic.deck.builder.service.CardService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/games")
@SecurityRequirement(name = "bearerAuth") // Applique JWT à tous les endpoints du contrôleur
public class CardImportController {

    private final CardService cardService;

    public CardImportController(CardService cardService) {
        this.cardService = cardService;
    }

    @Operation(summary = "Importe un bloc de cartes avec plusieurs localisations pour un jeu")
    @PostMapping("/{gameId}/import")
    public ResponseEntity<String> importCards(
            @PathVariable String gameId,
            @RequestBody List<Map<String, Object>> rawCards
    ) {
        cardService.importCards(gameId, rawCards);
        return ResponseEntity.ok("Cartes importées avec succès.");
    }
}

