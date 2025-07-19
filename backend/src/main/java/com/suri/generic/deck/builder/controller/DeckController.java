package com.suri.generic.deck.builder.controller;

import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.dto.response.DeckSummaryResponseDTO;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.service.DeckService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/decks")
@RequiredArgsConstructor
@SecurityRequirement(name = "bearerAuth") // Protège tous les endpoints via JWT
public class DeckController {

    private final DeckService deckService;

    @PostMapping
    public ResponseEntity<DeckResponseDTO> createDeck(@RequestBody DeckRequestDTO deckDTO,
            @AuthenticationPrincipal User user) {
        return ResponseEntity.ok(deckService.createDeck(deckDTO, user));
    }

    @GetMapping("/{id}")
    public ResponseEntity<DeckResponseDTO> getDeck(@PathVariable UUID id,
            @AuthenticationPrincipal User user) {
        return ResponseEntity.ok(deckService.getDeck(id, user));
    }

    @GetMapping
    public ResponseEntity<List<DeckSummaryResponseDTO>> getAllDecks(@AuthenticationPrincipal User user) {
        return ResponseEntity.ok(deckService.getAllDecks(user));
    }

    @PutMapping("/{id}")
    public ResponseEntity<DeckResponseDTO> updateDeck(@PathVariable UUID id,
            @RequestBody DeckRequestDTO deckRequestDTO,
            @AuthenticationPrincipal User user) {
        return ResponseEntity.ok(deckService.updateDeck(id, deckRequestDTO, user));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, String>> deleteDeck(@PathVariable UUID id,
            @AuthenticationPrincipal User user) {
        deckService.deleteDeck(id, user);
        return ResponseEntity.ok(Map.of("message", "Deck supprimé avec succès"));
    }
}
