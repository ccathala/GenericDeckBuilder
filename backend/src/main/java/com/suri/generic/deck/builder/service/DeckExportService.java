package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.dto.response.DeckExportResponseDTO;
import com.suri.generic.deck.builder.model.User;

import java.util.UUID;

/**
 * Interface pour le service d'export de deck.
 * Permet un couplage faible entre les contrôleurs et l'implémentation du service.
 */
public interface DeckExportService {
    
    /**
     * Exporte un deck au format texte avec les noms localisés des cartes.
     *
     * @param deckId l'identifiant du deck à exporter
     * @param locale la locale pour la localisation des noms de cartes
     * @param user l'utilisateur demandant l'export (pour vérification des droits)
     * @return le contenu exporté au format "quantité nom_localisé"
     */
    DeckExportResponseDTO exportDeck(UUID deckId, String locale, User user);
}
