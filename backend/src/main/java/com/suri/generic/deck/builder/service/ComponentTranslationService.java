package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.dto.response.CardResponseDTO;
import com.suri.generic.deck.builder.model.ComponentTranslation;
import com.suri.generic.deck.builder.repository.ComponentTranslationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.annotation.PostConstruct;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ComponentTranslationService {

    @Autowired
    private ComponentTranslationRepository componentTranslationRepository;

    @Autowired
    private CardService cardService;

    /**
     * Récupère les traductions des composants pour un jeu et une langue donnés
     */
    public Map<String, String> getComponentTranslations(String gameId, String language) {
        List<ComponentTranslation> translations = componentTranslationRepository.findByGameId(gameId);

        return translations.stream()
                .collect(Collectors.toMap(
                        ComponentTranslation::getComponentNameFr,
                        t -> getTranslatedName(t, language)));
    }

    /**
     * Récupère le nom traduit selon la langue
     */
    private String getTranslatedName(ComponentTranslation translation, String language) {
        if ("en".equalsIgnoreCase(language)) {
            return translation.getComponentNameEn() != null
                    ? translation.getComponentNameEn()
                    : translation.getComponentNameFr();
        }
        return translation.getComponentNameFr();
    }

    /**
     * Extrait tous les noms de composants uniques des cartes d'un jeu
     */
    public Set<String> extractComponentNamesFromCards(String gameId) {
        List<CardResponseDTO> cards = cardService.getCardsByLocale(gameId, "fr");
        Set<String> componentNames = new HashSet<>();

        for (CardResponseDTO card : cards) {
            if (card.getProperties() != null) {
                Object componentCostObj = card.getProperties().get("componentCost");
                if (componentCostObj instanceof List<?>) {
                    @SuppressWarnings("unchecked")
                    List<Map<String, Object>> componentCost = (List<Map<String, Object>>) componentCostObj;

                    for (Map<String, Object> component : componentCost) {
                        Object componentName = component.get("componentName");
                        if (componentName != null) {
                            componentNames.add(componentName.toString());
                        }
                    }
                }
            }
        }

        return componentNames;
    }

    /**
     * Initialise les traductions manquantes pour un jeu
     */
    @Transactional
    public void initializeComponentTranslations(String gameId) {
        Set<String> componentNames = extractComponentNamesFromCards(gameId);

        for (String componentName : componentNames) {
            if (!componentTranslationRepository.existsByComponentNameFrAndGameId(componentName, gameId)) {
                ComponentTranslation translation = new ComponentTranslation();
                translation.setComponentNameFr(componentName);
                translation.setComponentNameEn(getDefaultEnglishTranslation(componentName));
                translation.setGameId(gameId);

                componentTranslationRepository.save(translation);
            }
        }
    }

    /**
     * Fournit une traduction anglaise par défaut (à améliorer avec un vrai service
     * de traduction)
     */
    private String getDefaultEnglishTranslation(String frenchName) {
        Map<String, String> defaultTranslations = Map.of(
                "Graine", "Seed",
                "Bois", "Wood",
                "Pierre", "Stone",
                "Eau", "Water",
                "Feu", "Fire",
                "Fer", "Iron",
                "Or", "Gold",
                "Cristal", "Crystal",
                "Cuir", "Leather",
                "Tissu", "Fabric");

        return defaultTranslations.getOrDefault(frenchName, frenchName);
    }

    /**
     * Méthode appelée au démarrage pour initialiser les traductions de Mage Noir
     */
    @PostConstruct
    public void initializeMageNoirTranslations() {
        try {
            initializeComponentTranslations("mage_noir");
        } catch (Exception e) {
            // Ignorer les erreurs au démarrage (base de données peut ne pas être prête)
            System.out.println("Initialisation des traductions reportée: " + e.getMessage());
        }
    }

    /**
     * Crée ou met à jour une traduction
     */
    @Transactional
    public ComponentTranslation saveOrUpdateTranslation(String componentNameFr, String componentNameEn, String gameId) {
        Optional<ComponentTranslation> existing = componentTranslationRepository
                .findByComponentNameFrAndGameId(componentNameFr, gameId);

        ComponentTranslation translation;
        if (existing.isPresent()) {
            translation = existing.get();
            translation.setComponentNameEn(componentNameEn);
        } else {
            translation = new ComponentTranslation(componentNameFr, componentNameEn, gameId);
        }

        return componentTranslationRepository.save(translation);
    }
}
