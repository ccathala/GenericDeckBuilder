package com.suri.generic.deck.builder.util;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class TextNormalizer {

    private static final Pattern MULTIPLE_SPACES = Pattern.compile("\\s+");
    private static final Pattern DIACRITICS = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
    private static final Pattern APOSTROPHES = Pattern.compile("[''-]");

    /**
     * Normalise un nom de carte pour la recherche flexible
     */
    public static String normalizeCardName(String cardName) {
        if (cardName == null || cardName.trim().isEmpty()) {
            return "";
        }

        String normalized = cardName.trim();

        // Suppression des accents via décomposition Unicode
        normalized = Normalizer.normalize(normalized, Normalizer.Form.NFD);
        normalized = DIACRITICS.matcher(normalized).replaceAll("");

        // Remplacement des apostrophes et tirets par des espaces
        normalized = APOSTROPHES.matcher(normalized).replaceAll(" ");

        // Normalisation des espaces multiples
        normalized = MULTIPLE_SPACES.matcher(normalized).replaceAll(" ");

        // Conversion en minuscules
        normalized = normalized.toLowerCase().trim();

        return normalized;
    }
}
