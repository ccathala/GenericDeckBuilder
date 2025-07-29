package com.suri.generic.deck.builder.controller;

import com.suri.generic.deck.builder.service.ComponentTranslationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/components")
public class ComponentTranslationController {

    @Autowired
    private ComponentTranslationService componentTranslationService;

    /**
     * Récupère les traductions des composants pour un jeu et une langue donnés
     * 
     * @param gameId   Identifiant du jeu
     * @param language Langue (fr, en)
     * @return Map des traductions (componentNameFr -> componentNameTranslated)
     */
    @GetMapping("/translations")
    public ResponseEntity<Map<String, String>> getComponentTranslations(
            @RequestParam String gameId,
            @RequestParam(defaultValue = "fr") String language) {

        try {
            Map<String, String> translations = componentTranslationService
                    .getComponentTranslations(gameId, language);

            return ResponseEntity.ok(translations);
        } catch (Exception e) {
            // En cas d'erreur, retourner une map vide
            return ResponseEntity.ok(Map.of());
        }
    }

    /**
     * Initialise les traductions manquantes pour un jeu
     * 
     * @param gameId Identifiant du jeu
     * @return Message de confirmation
     */
    @PostMapping("/initialize/{gameId}")
    public ResponseEntity<String> initializeTranslations(@PathVariable String gameId) {
        try {
            componentTranslationService.initializeComponentTranslations(gameId);
            return ResponseEntity.ok("Traductions initialisées pour le jeu: " + gameId);
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body("Erreur lors de l'initialisation: " + e.getMessage());
        }
    }
}
