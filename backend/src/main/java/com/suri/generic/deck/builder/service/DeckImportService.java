package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.dto.request.DeckCardRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckImportRequestDTO;
import com.suri.generic.deck.builder.dto.request.DeckRequestDTO;
import com.suri.generic.deck.builder.dto.response.DeckResponseDTO;
import com.suri.generic.deck.builder.exception.DeckImportException;
import com.suri.generic.deck.builder.model.CardLocalization;
import com.suri.generic.deck.builder.model.ParsedCard;
import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.CardLocalizationRepository;
import com.suri.generic.deck.builder.util.TextNormalizer;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class DeckImportService {

    private final CardLocalizationRepository cardLocalizationRepository;
    private final DeckService deckService;

    private static final Pattern CARD_LINE_PATTERN = Pattern.compile("^(\\d+)\\s+(.+)$");

    @Transactional
    public DeckResponseDTO importDeck(DeckImportRequestDTO importRequest, User user) {
        // 🛡️ SÉCURITÉ: Validation et sanitisation des paramètres d'entrée
        validateImportRequest(importRequest);
        
        log.info("Importation d'un deck : {} par l'utilisateur {}", importRequest.getTitle(), user.getUsername());

        // 1. Parser la liste des cartes
        List<ParsedCard> parsedCards = parseCardsList(importRequest.getCardsList());

        Map<String, CardLocalization> allLocalizations = cardLocalizationRepository
                .findByGameId(importRequest.getGameId()).stream()
                .collect(Collectors.toMap(loc -> TextNormalizer.normalizeCardName(loc.getName()), loc -> loc,
                        (existing, replacement) -> existing));
        log.debug("Récupération de {} localisations pour le jeu {}", allLocalizations.size(),
                importRequest.getGameId());

        // 3. Valider et mapper les cartes
        List<DeckCardRequestDTO> deckCards = validateAndMapCards(parsedCards, allLocalizations);

        // 4. Créer le deck
        DeckRequestDTO deckRequest = new DeckRequestDTO();
        deckRequest.setName(importRequest.getTitle());
        deckRequest.setGameId(importRequest.getGameId());
        deckRequest.setCards(deckCards);

        DeckResponseDTO result = deckService.createDeck(deckRequest, user);
        log.info("Deck importé avec succès : ID {}", result.getId());

        return result;
    }

    private List<ParsedCard> parseCardsList(String cardsList) {
        List<ParsedCard> parsedCards = new ArrayList<>();
        String[] lines = cardsList.split("\\r?\\n");

        for (int i = 0; i < lines.length; i++) {
            String line = lines[i].trim();
            if (line.isEmpty())
                continue;

            Matcher matcher = CARD_LINE_PATTERN.matcher(line);
            if (matcher.matches()) {
                try {
                    int quantity = Integer.parseInt(matcher.group(1));
                    if (quantity <= 0) {
                        throw new DeckImportException("Quantité invalide",
                                List.of("Ligne " + (i + 1) + ": La quantité doit être positive"));
                    }
                    String cardName = matcher.group(2).trim();
                    parsedCards.add(new ParsedCard(quantity, cardName, i + 1));
                } catch (NumberFormatException e) {
                    throw new DeckImportException("Format incorrect",
                            List.of("Ligne " + (i + 1) + ": Quantité invalide '" + matcher.group(1) + "'"));
                }
            } else {
                throw new DeckImportException("Format incorrect",
                        List.of("Ligne " + (i + 1) + ": " + line +
                                "\nFormat attendu: 'quantité nom_de_carte' (ex: '4 anneau d'azur')"));
            }
        }

        if (parsedCards.isEmpty()) {
            throw new DeckImportException("Aucune carte",
                    List.of("Aucune carte valide trouvée dans la liste"));
        }

        return parsedCards;
    }

    private List<DeckCardRequestDTO> validateAndMapCards(List<ParsedCard> parsedCards,
            Map<String, CardLocalization> allLocalizations) {
        List<DeckCardRequestDTO> result = new ArrayList<>();
        List<String> notFoundCards = new ArrayList<>();

        for (ParsedCard parsed : parsedCards) {
            String originalName = TextNormalizer.normalizeCardName(parsed.getCardName());

            // Recherche flexible dans toutes les localisations
            CardLocalization foundLocalization = allLocalizations.get(originalName);

            if (foundLocalization != null) {
                result.add(new DeckCardRequestDTO(foundLocalization.getId().getCard(), parsed.getQuantity()));
                log.debug("Carte trouvée: '{}' -> '{}'", originalName, foundLocalization.getName());
            } else {
                notFoundCards.add(originalName + " (ligne " + parsed.getLineNumber() + ")");
                log.warn("Carte non trouvée: '{}' à la ligne {}", originalName, parsed.getLineNumber());
            }
        }

        if (!notFoundCards.isEmpty()) {
            throw new DeckImportException("Cartes non trouvées", notFoundCards);
        }

        return result;
    }

    /**
     * 🛡️ SÉCURITÉ: Validation et sanitisation des paramètres d'entrée
     * pour prévenir les injections SQL et autres attaques
     */
    private void validateImportRequest(DeckImportRequestDTO importRequest) {
        if (importRequest == null) {
            throw new DeckImportException("Paramètres invalides", 
                List.of("La requête d'import ne peut pas être nulle"));
        }
        
        if (importRequest.getGameId() == null || importRequest.getGameId().trim().isEmpty()) {
            throw new DeckImportException("Paramètres invalides", 
                List.of("L'ID du jeu ne peut pas être vide"));
        }
        
        if (importRequest.getTitle() == null || importRequest.getTitle().trim().isEmpty()) {
            throw new DeckImportException("Paramètres invalides", 
                List.of("Le titre du deck ne peut pas être vide"));
        }
        
        if (importRequest.getCardsList() == null) {
            throw new DeckImportException("Paramètres invalides", 
                List.of("La liste des cartes ne peut pas être nulle"));
        }
        
        // 🛡️ Validation de sécurité: gameId ne doit contenir que des caractères autorisés
        String gameId = importRequest.getGameId().trim();
        if (!gameId.matches("^[a-zA-Z0-9_-]+$")) {
            throw new DeckImportException("Paramètres invalides", 
                List.of("L'ID du jeu contient des caractères non autorisés"));
        }
        
        // 🛡️ Limitation de taille pour éviter les attaques DoS
        if (importRequest.getTitle().length() > 100) {
            throw new DeckImportException("Paramètres invalides", 
                List.of("Le titre du deck ne peut pas dépasser 100 caractères"));
        }
        
        if (importRequest.getCardsList().length() > 10000) {
            throw new DeckImportException("Paramètres invalides", 
                List.of("La liste des cartes ne peut pas dépasser 10000 caractères"));
        }
    }
}
