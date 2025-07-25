package com.suri.generic.deck.builder.integration;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;
import java.util.List;

/**
 * Test d'intégration pour valider le tri des cartes selon les critères spécifiés
 */
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@ActiveProfiles("test")
public class CardSortingIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    // Ordre attendu des éléments
    private static final List<String> ELEMENT_ORDER = Arrays.asList(
        "Végétal", "Feu", "Air", "Eau", "Minéral", "Arcane"
    );

    @Test
    public void testCardSortingOrder() throws Exception {
        // Appel de l'API
        MvcResult result = mockMvc.perform(get("/api/public/games/mage_noir/cards")
                .param("locale", "fr"))
                .andExpect(status().isOk())
                .andReturn();

        String responseContent = result.getResponse().getContentAsString();
        JsonNode cardsArray = objectMapper.readTree(responseContent);

        assertTrue(cardsArray.isArray(), "La réponse doit être un tableau");
        assertTrue(cardsArray.size() > 0, "Le tableau ne doit pas être vide");

        // Validation du tri
        validateElementSorting(cardsArray);
        validateExtensionSorting(cardsArray);
        validateManaCostSorting(cardsArray);
        
        System.out.println("✅ Test de tri réussi avec " + cardsArray.size() + " cartes");
    }

    private void validateElementSorting(JsonNode cardsArray) {
        String previousElement = null;
        int previousElementIndex = -1;

        for (JsonNode card : cardsArray) {
            JsonNode properties = card.get("properties");
            if (properties != null) {
                JsonNode elementNode = properties.get("element");
                if (elementNode != null) {
                    String currentElement = elementNode.asText();
                    int currentElementIndex = ELEMENT_ORDER.indexOf(currentElement);
                    
                    if (currentElementIndex != -1) {
                        assertTrue(currentElementIndex >= previousElementIndex,
                            String.format("Erreur de tri par élément: %s devrait venir après %s", 
                                currentElement, previousElement));
                        
                        if (currentElementIndex > previousElementIndex) {
                            previousElement = currentElement;
                            previousElementIndex = currentElementIndex;
                        }
                    }
                }
            }
        }
        
        System.out.println("✅ Tri par élément validé");
    }

    private void validateExtensionSorting(JsonNode cardsArray) {
        String currentElement = null;
        String previousExtension = null;

        for (JsonNode card : cardsArray) {
            JsonNode properties = card.get("properties");
            if (properties != null) {
                JsonNode elementNode = properties.get("element");
                JsonNode extensionNode = properties.get("extension");
                
                if (elementNode != null) {
                    String cardElement = elementNode.asText();
                    
                    // Nouveau élément, reset de l'extension
                    if (!cardElement.equals(currentElement)) {
                        currentElement = cardElement;
                        previousExtension = null;
                    }
                    
                    if (extensionNode != null) {
                        String currentExtension = extensionNode.asText();
                        
                        // "Jeu de base" doit venir en premier
                        if (previousExtension != null && previousExtension.equals("Jeu de base")) {
                            assertNotEquals("Jeu de base", currentExtension,
                                "Une extension non-base ne peut pas venir après 'Jeu de base' pour le même élément");
                        }
                        
                        previousExtension = currentExtension;
                    }
                }
            }
        }
        
        System.out.println("✅ Tri par extension validé");
    }

    private void validateManaCostSorting(JsonNode cardsArray) {
        String currentElement = null;
        String currentExtension = null;
        Integer previousManaCost = null;

        for (JsonNode card : cardsArray) {
            JsonNode properties = card.get("properties");
            if (properties != null) {
                JsonNode elementNode = properties.get("element");
                JsonNode extensionNode = properties.get("extension");
                JsonNode manaCostNode = properties.get("manaCost");
                
                String cardElement = elementNode != null ? elementNode.asText() : null;
                String cardExtension = extensionNode != null ? extensionNode.asText() : null;
                
                // Nouveau groupe (élément ou extension différent)
                if (!java.util.Objects.equals(cardElement, currentElement) || 
                    !java.util.Objects.equals(cardExtension, currentExtension)) {
                    currentElement = cardElement;
                    currentExtension = cardExtension;
                    previousManaCost = null;
                }
                
                if (manaCostNode != null) {
                    JsonNode totalNode = manaCostNode.get("total");
                    if (totalNode != null) {
                        int currentManaCost = totalNode.asInt(0);
                        
                        if (previousManaCost != null) {
                            assertTrue(currentManaCost >= previousManaCost,
                                String.format("Erreur de tri par mana: %d devrait être >= %d pour %s/%s", 
                                    currentManaCost, previousManaCost, cardElement, cardExtension));
                        }
                        
                        previousManaCost = currentManaCost;
                    }
                }
            }
        }
        
        System.out.println("✅ Tri par coût mana validé");
    }

    @Test
    public void testCardSortingWithDifferentLocales() throws Exception {
        // Test avec locale française
        MvcResult frResult = mockMvc.perform(get("/api/public/games/mage_noir/cards")
                .param("locale", "fr"))
                .andExpect(status().isOk())
                .andReturn();

        // Test avec locale anglaise
        MvcResult enResult = mockMvc.perform(get("/api/public/games/mage_noir/cards")
                .param("locale", "en"))
                .andExpect(status().isOk())
                .andReturn();

        JsonNode frCards = objectMapper.readTree(frResult.getResponse().getContentAsString());
        JsonNode enCards = objectMapper.readTree(enResult.getResponse().getContentAsString());

        // Les deux doivent avoir le même nombre de cartes
        assertEquals(frCards.size(), enCards.size(), 
            "Le nombre de cartes doit être identique pour toutes les locales");

        // L'ordre des propriétés doit être le même (indépendant de la locale)
        for (int i = 0; i < frCards.size(); i++) {
            JsonNode frCard = frCards.get(i);
            JsonNode enCard = enCards.get(i);
            
            JsonNode frProperties = frCard.get("properties");
            JsonNode enProperties = enCard.get("properties");
            
            if (frProperties != null && enProperties != null) {
                assertEquals(frProperties, enProperties,
                    "Les propriétés doivent être identiques entre les locales à l'index " + i);
            }
        }
        
        System.out.println("✅ Tri identique pour toutes les locales validé");
    }
}
