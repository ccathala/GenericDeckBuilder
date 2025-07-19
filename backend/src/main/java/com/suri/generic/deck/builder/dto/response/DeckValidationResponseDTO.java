package com.suri.generic.deck.builder.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DeckValidationResponseDTO {

    /**
     * Indique si le deck respecte toutes les règles du jeu
     */
    private boolean isValid;

    /**
     * Liste des messages de validation (erreurs et avertissements)
     */
    private List<ValidationMessageDTO> messages;

    /**
     * Règles appliquées pour la validation
     */
    private DeckRulesetDTO appliedRules;

    /**
     * Statistiques actuelles du deck
     */
    private DeckStatisticsDTO statistics;

    /**
     * DTO pour les messages de validation individuels
     */
    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class ValidationMessageDTO {

        /**
         * Type de message : ERROR, WARNING, INFO
         */
        private MessageType type;

        /**
         * Code du message pour l'internationalisation
         */
        private String messageCode;

        /**
         * Message par défaut en anglais
         */
        private String defaultMessage;

        /**
         * Paramètres pour interpoler dans le message
         * Ex: pour "Minimum {minCards} cartes requis", params = {"minCards": 40}
         */
        private Object[] parameters;

        public enum MessageType {
            ERROR, // Violation grave des règles
            WARNING, // Avertissement non bloquant
            INFO // Information générale
        }
    }

    /**
     * DTO pour les règles appliquées
     */
    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class DeckRulesetDTO {

        /**
         * Nombre minimum de cartes dans le deck
         */
        private int minCards;

        /**
         * Nombre maximum de copies par carte unique
         */
        private int maxCopiesPerCard;

        /**
         * ID du jeu pour lequel les règles s'appliquent
         */
        private String gameId;
    }

    /**
     * DTO pour les statistiques actuelles du deck
     */
    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class DeckStatisticsDTO {

        /**
         * Nombre total de cartes dans le deck
         */
        private int totalCards;

        /**
         * Nombre de cartes uniques (différentes) dans le deck
         */
        private int uniqueCards;

        /**
         * Détails des violations par carte (si applicable)
         */
        private List<CardViolationDTO> cardViolations;

        /**
         * DTO pour les violations spécifiques à une carte
         */
        @Getter
        @Setter
        @NoArgsConstructor
        @AllArgsConstructor
        @Builder
        public static class CardViolationDTO {

            /**
             * ID de la carte en violation
             */
            private String cardId;

            /**
             * Nom de la carte (localisé si possible)
             */
            private String cardName;

            /**
             * Quantité actuelle dans le deck
             */
            private int currentQuantity;

            /**
             * Quantité maximum autorisée
             */
            private int maxAllowed;

            /**
             * Nombre d'exemplaires en excès
             */
            private int excess;
        }
    }
}
