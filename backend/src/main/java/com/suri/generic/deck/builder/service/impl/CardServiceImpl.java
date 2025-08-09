package com.suri.generic.deck.builder.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.suri.generic.deck.builder.dto.response.CardResponseDTO;
import com.suri.generic.deck.builder.model.Card;
import com.suri.generic.deck.builder.model.CardLocalization;
import com.suri.generic.deck.builder.model.CardLocalizationId;
import com.suri.generic.deck.builder.model.Game;
import com.suri.generic.deck.builder.repository.CardRepository;
import com.suri.generic.deck.builder.repository.GameRepository;
import com.suri.generic.deck.builder.service.CardService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CardServiceImpl implements CardService {

    private static final TypeReference<Map<String, Object>> MAP_TYPE_REF = new TypeReference<Map<String, Object>>() {
    };

    private final GameRepository gameRepository;
    private final CardRepository cardRepository;

    public CardServiceImpl(
            GameRepository gameRepository,
            CardRepository cardRepository) {
        this.gameRepository = gameRepository;
        this.cardRepository = cardRepository;
    }

    @Override
    public List<CardResponseDTO> getCardsByLocale(String gameId, String locale) {
        // Use the new ordered method to get cards sorted by element, extension and mana
        // cost
        List<Card> cards = cardRepository.findByGameIdOrderedByElementExtensionAndManaCost(gameId);
        List<CardResponseDTO> result = new ArrayList<>();

        for (Card card : cards) {
            // Find the right localization
            Optional<CardLocalization> loc = card.getLocalizations().stream()
                    .filter(l -> l.getId().getLocale().equalsIgnoreCase(locale))
                    .findFirst();

            String name = loc.map(CardLocalization::getName).orElse("Nom inconnu");
            String description = loc.map(CardLocalization::getDescription).orElse("");
            String imageUrl = loc.map(CardLocalization::getImageUrl).orElse("");
            String cardUrl = loc.map(CardLocalization::getCardUrl).orElse("");

            // Parse properties
            Map<String, Object> props;
            try {
                props = new ObjectMapper().readValue(card.getProperties(), MAP_TYPE_REF);
            } catch (Exception e) {
                props = Map.of(); // fail-safe
            }

            result.add(CardResponseDTO.builder()
                    .id(card.getId())
                    .name(name)
                    .description(description)
                    .imageUrl(imageUrl)
                    .cardUrl(cardUrl)
                    .properties(props)
                    .build());
        }

        return result;
    }

    @Override
    public void importCards(String gameId, List<Map<String, Object>> rawCards) {
        Game game = gameRepository.findById(gameId)
                .orElseThrow(() -> new IllegalArgumentException("Jeu introuvable : " + gameId));

        ObjectMapper mapper = new ObjectMapper();

        for (Map<String, Object> cardData : rawCards) {
            String cardId = (String) cardData.get("id");
            if (cardId == null || cardId.isBlank()) {
                throw new IllegalArgumentException("Chaque carte doit avoir un champ 'id'");
            }

            // Create the card
            Card card = new Card();
            card.setId(cardId);
            card.setGame(game);

            // Store properties (object → JSON string)
            Object properties = cardData.get("properties");
            if (properties == null || !(properties instanceof Map)) {
                throw new IllegalArgumentException("Le champ 'properties' est requis et doit être un objet.");
            }

            try {
                String propertiesJson = mapper.writeValueAsString(properties);
                card.setProperties(propertiesJson);
            } catch (Exception e) {
                throw new RuntimeException("Erreur JSON dans 'properties'", e);
            }

            // Process localizations
            Object localizationsObj = cardData.get("localizations");
            if (!(localizationsObj instanceof Map<?, ?>))
                continue;

            @SuppressWarnings("unchecked")
            Map<String, Object> localizations = (Map<String, Object>) localizationsObj;
            List<CardLocalization> localizationList = new ArrayList<>();

            for (Map.Entry<String, Object> entry : localizations.entrySet()) {
                String locale = entry.getKey();
                Object locData = entry.getValue();

                if (!(locData instanceof Map<?, ?>))
                    continue;

                @SuppressWarnings("unchecked")
                Map<String, String> locMap = (Map<String, String>) locData;
                String name = locMap.getOrDefault("name", "");
                String description = locMap.getOrDefault("description", "");
                String imageUrl = locMap.getOrDefault("imageUrl", "");

                CardLocalization localization = new CardLocalization();
                localization.setCard(card);
                localization.setName(name);
                localization.setDescription(description);
                localization.setImageUrl(imageUrl);
                localization.setId(new CardLocalizationId(card.getId(), locale));

                localizationList.add(localization);
            }

            card.setLocalizations(localizationList);
            cardRepository.save(card);
        }
    }

    @Override
    public CardResponseDTO getCardById(String cardId, String locale) {
        Optional<Card> cardOpt = cardRepository.findById(cardId);
        if (cardOpt.isEmpty()) {
            return null;
        }

        Card card = cardOpt.get();
        Optional<CardLocalization> loc = card.getLocalizations().stream()
                .filter(l -> l.getId().getLocale().equalsIgnoreCase(locale))
                .findFirst();

        String name = loc.map(CardLocalization::getName).orElse("Nom inconnu");
        String description = loc.map(CardLocalization::getDescription).orElse("");
        String imageUrl = loc.map(CardLocalization::getImageUrl).orElse("");
        String cardUrl = loc.map(CardLocalization::getCardUrl).orElse("");

        // Parse properties
        Map<String, Object> props;
        try {
            props = new ObjectMapper().readValue(card.getProperties(), MAP_TYPE_REF);
        } catch (Exception e) {
            props = Map.of(); // fail-safe
        }

        return CardResponseDTO.builder()
                .id(card.getId())
                .name(name)
                .description(description)
                .imageUrl(imageUrl)
                .cardUrl(cardUrl)
                .properties(props)
                .build();
    }

    @Override
    public List<String> getAvailableLocales(String cardId) {
        Optional<Card> cardOpt = cardRepository.findById(cardId);
        if (cardOpt.isEmpty()) {
            return List.of();
        }

        return cardOpt.get().getLocalizations().stream()
                .map(loc -> loc.getId().getLocale())
                .distinct()
                .collect(Collectors.toList());
    }

    @Override
    public boolean cardExists(String cardId) {
        return cardRepository.existsById(cardId);
    }
}
