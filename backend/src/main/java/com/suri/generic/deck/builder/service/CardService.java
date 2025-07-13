package com.suri.generic.deck.builder.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.suri.generic.deck.builder.dto.response.CardResponseDTO;
import com.suri.generic.deck.builder.model.Card;
import com.suri.generic.deck.builder.model.CardLocalization;
import com.suri.generic.deck.builder.model.CardLocalizationId;
import com.suri.generic.deck.builder.model.Game;
import com.suri.generic.deck.builder.repository.CardRepository;
import com.suri.generic.deck.builder.repository.GameRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class CardService {

    private final GameRepository gameRepository;
    private final CardRepository cardRepository;

    public CardService(
            GameRepository gameRepository,
            CardRepository cardRepository
    ) {
        this.gameRepository = gameRepository;
        this.cardRepository = cardRepository;
    }

    /**
     * Récupère toutes les cartes localisées d'un jeu dans une langue donnée
     */
    public List<CardResponseDTO> getCardsByLocale(String gameId, String locale) {
        Game game = gameRepository.findById(gameId)
                .orElseThrow(() -> new IllegalArgumentException("Jeu introuvable : " + gameId));

        List<Card> cards = cardRepository.findByGame(game);
        List<CardResponseDTO> result = new ArrayList<>();

        for (Card card : cards) {
            // Chercher la bonne localisation
            Optional<CardLocalization> loc = card.getLocalizations().stream()
                    .filter(l -> l.getId().getLocale().equalsIgnoreCase(locale))
                    .findFirst();

            String name = loc.map(CardLocalization::getName).orElse("Nom inconnu");
            String description = loc.map(CardLocalization::getDescription).orElse("");
            String imageUrl = loc.map(CardLocalization::getImageUrl).orElse("");

            // Parser les propriétés
            Map<String, Object> props;
            try {
                props = new ObjectMapper().readValue(card.getProperties(), Map.class);
            } catch (Exception e) {
                props = Map.of(); // fail-safe
            }

            result.add(new CardResponseDTO(card.getId(), name, description, imageUrl, props));
        }

        return result;
    }


    public void importCards(String gameId, List<Map<String, Object>> rawCards) {
        Game game = gameRepository.findById(gameId)
                .orElseThrow(() -> new IllegalArgumentException("Jeu introuvable : " + gameId));

        ObjectMapper mapper = new ObjectMapper();

        for (Map<String, Object> cardData : rawCards) {
            String cardId = (String) cardData.get("id");
            if (cardId == null || cardId.isBlank()) {
                throw new IllegalArgumentException("Chaque carte doit avoir un champ 'id'");
            }

            // Créer la carte
            Card card = new Card();
            card.setId(cardId);
            card.setGame(game);

            // Stocker les propriétés (objet → JSON string)
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

            // Traiter les localizations
            Object localizationsObj = cardData.get("localizations");
            if (!(localizationsObj instanceof Map)) continue;

            Map<String, Object> localizations = (Map<String, Object>) localizationsObj;
            List<CardLocalization> localizationList = new ArrayList<>();

            for (Map.Entry<String, Object> entry : localizations.entrySet()) {
                String locale = entry.getKey();
                Object locData = entry.getValue();

                if (!(locData instanceof Map)) continue;

                Map<String, String> locMap = (Map<String, String>) locData;
                String name = locMap.getOrDefault("name", "");
                String description = locMap.getOrDefault("description", "");
                String imageUrl = locMap.getOrDefault("imageUrl","");

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
}
