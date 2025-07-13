package com.suri.generic.deck.builder.controller;

import com.suri.generic.deck.builder.dto.response.CardResponseDTO;
import com.suri.generic.deck.builder.service.CardService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/public/games")
public class PublicCardController {

    private final CardService cardService;

    public PublicCardController(CardService cardService) {
        this.cardService = cardService;
    }


    @Operation(summary = "Récupère toutes les cartes localisées pour un jeu donné")
    @GetMapping("/{gameId}/cards")
    public ResponseEntity<List<CardResponseDTO>> getCardsByGameAndLocale(
            @PathVariable String gameId,
            @RequestParam(defaultValue = "fr") String locale
    ) {
        List<CardResponseDTO> cards = cardService.getCardsByLocale(gameId, locale);
        return ResponseEntity.ok(cards);
    }

}

