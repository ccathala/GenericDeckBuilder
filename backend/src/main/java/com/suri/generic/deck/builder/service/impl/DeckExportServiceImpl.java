package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.dto.response.DeckExportResponseDTO;
import com.suri.generic.deck.builder.exception.DeckNotFoundException;
import com.suri.generic.deck.builder.exception.UnauthorizedAccessException;
import com.suri.generic.deck.builder.model.Card;
import com.suri.generic.deck.builder.model.CardLocalization;
import com.suri.generic.deck.builder.model.Deck;
import com.suri.generic.deck.builder.model.DeckCard;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.CardLocalizationRepository;
import com.suri.generic.deck.builder.repository.DeckRepository;
import com.suri.generic.deck.builder.service.DeckExportService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * Implémentation du service d'export de deck.
 * Génère le contenu exporté au format "quantité nom_localisé".
 */
@Service
@RequiredArgsConstructor
@Slf4j
@Transactional(readOnly = true)
public class DeckExportServiceImpl implements DeckExportService {
    
    private final DeckRepository deckRepository;
    private final CardLocalizationRepository cardLocalizationRepository;
    
    @Override
    public DeckExportResponseDTO exportDeck(UUID deckId, String locale, User user) {
        log.debug("Début de l'export du deck {} pour l'utilisateur {} en locale {}", 
                  deckId, user.getId(), locale);
        
        // Récupération du deck avec vérification des droits
        Deck deck = deckRepository.findById(deckId)
                .orElseThrow(() -> new DeckNotFoundException("Deck non trouvé avec l'ID: " + deckId));
        
        // Vérification que l'utilisateur est propriétaire du deck
        if (!deck.getOwner().getId().equals(user.getId())) {
            throw new UnauthorizedAccessException("L'utilisateur n'est pas autorisé à exporter ce deck");
        }
        
        // Génération du contenu exporté
        String exportedContent = generateExportContent(deck, locale);
        
        log.debug("Export du deck {} terminé avec succès. Contenu généré: {} lignes", 
                  deckId, exportedContent.split("\n").length);
        
        return new DeckExportResponseDTO(exportedContent);
    }
    
    /**
     * Génère le contenu exporté au format "quantité nom_localisé".
     */
    private String generateExportContent(Deck deck, String locale) {
        return deck.getCards().stream()
                .sorted(Comparator.comparing(deckCard -> getLocalizedCardName(deckCard.getCard(), locale)))
                .map(deckCard -> formatCardLine(deckCard, locale))
                .collect(Collectors.joining("\n"));
    }
    
    /**
     * Formate une ligne de carte au format "quantité nom_localisé".
     */
    private String formatCardLine(DeckCard deckCard, String locale) {
        String localizedName = getLocalizedCardName(deckCard.getCard(), locale);
        return deckCard.getQuantity() + " " + localizedName;
    }
    
    /**
     * Récupère le nom localisé d'une carte.
     */
    private String getLocalizedCardName(Card card, String locale) {
        Optional<CardLocalization> localization = cardLocalizationRepository
                .findByIdCardAndIdLocale(card.getId(), locale);
        
        if (localization.isPresent()) {
            return localization.get().getName();
        }
        
        // Fallback sur le nom français si la localisation demandée n'existe pas
        Optional<CardLocalization> frenchLocalization = cardLocalizationRepository
                .findByIdCardAndIdLocale(card.getId(), "fr");
        
        if (frenchLocalization.isPresent()) {
            log.warn("Localisation {} non trouvée pour la carte {}. Utilisation du français.", 
                     locale, card.getId());
            return frenchLocalization.get().getName();
        }
        
        // Dernière fallback sur l'ID de la carte si aucune localisation trouvée
        log.warn("Aucune localisation trouvée pour la carte {}. Utilisation de l'ID.", 
                 card.getId());
        return card.getId();
    }
}
