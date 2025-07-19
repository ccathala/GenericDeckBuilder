package com.suri.generic.deck.builder.controller;

import com.suri.generic.deck.builder.model.Game;
import com.suri.generic.deck.builder.service.GameService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/games")
@SecurityRequirement(name = "bearerAuth") // Protège tous les endpoints via JWT
public class GameController {

    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
    }

    @Operation(summary = "Créer un nouveau jeu")
    @PostMapping
    public ResponseEntity<Game> createGame(@Valid @RequestBody Game game) {
        return ResponseEntity.ok(gameService.create(game));
    }

    @Operation(summary = "Lister tous les jeux")
    @GetMapping
    public ResponseEntity<List<Game>> getAllGames() {
        return ResponseEntity.ok(gameService.findAll());
    }

    @Operation(summary = "Récupérer un jeu par son ID")
    @GetMapping("/{id}")
    public ResponseEntity<Game> getGame(@PathVariable String id) {
        return gameService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @Operation(summary = "Mettre à jour un jeu existant")
    @PutMapping("/{id}")
    public ResponseEntity<Game> updateGame(
            @PathVariable String id,
            @Valid @RequestBody Game game) {
        return ResponseEntity.ok(gameService.update(id, game));
    }

    @Operation(summary = "Supprimer un jeu")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteGame(@PathVariable String id) {
        gameService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
