package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.dto.response.CardResponseDTO;

import java.util.List;
import java.util.Map;

/**
 * Service interface for Card management operations.
 * Handles card data retrieval, localization, and import functionality.
 */
public interface CardService {

    /**
     * Get all cards for a specific game in a given locale
     * 
     * @param gameId the game identifier
     * @param locale the locale (e.g., "fr", "en")
     * @return list of localized card data
     */
    List<CardResponseDTO> getCardsByLocale(String gameId, String locale);

    /**
     * Import cards from raw data
     * 
     * @param gameId   the game identifier
     * @param rawCards raw card data
     */
    void importCards(String gameId, List<Map<String, Object>> rawCards);

    /**
     * Get a single card by ID in a specific locale
     * 
     * @param cardId the card identifier
     * @param locale the locale (e.g., "fr", "en")
     * @return the localized card data or null if not found
     */
    CardResponseDTO getCardById(String cardId, String locale);

    /**
     * Get available locales for a specific card
     * 
     * @param cardId the card identifier
     * @return list of available locale codes
     */
    List<String> getAvailableLocales(String cardId);

    /**
     * Check if a card exists
     * 
     * @param cardId the card identifier
     * @return true if card exists, false otherwise
     */
    boolean cardExists(String cardId);
}
