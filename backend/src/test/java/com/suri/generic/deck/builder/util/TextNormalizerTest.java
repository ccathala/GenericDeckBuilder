package com.suri.generic.deck.builder.util;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.NullAndEmptySource;

import static org.junit.jupiter.api.Assertions.*;

class TextNormalizerTest {

    @Test
    void normalizeCardName_withNullInput_shouldReturnEmptyString() {
        // Given
        String input = null;

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("", result);
    }

    @ParameterizedTest
    @NullAndEmptySource
    void normalizeCardName_withNullOrEmptyInput_shouldReturnEmptyString(String input) {
        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("", result);
    }

    @Test
    void normalizeCardName_withWhitespaceOnlyInput_shouldReturnEmptyString() {
        // Given
        String input = "   \t\n  ";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("", result);
    }

    @Test
    void normalizeCardName_withBasicText_shouldConvertToLowercase() {
        // Given
        String input = "ANNEAU D'AZUR";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("anneau d azur", result);
    }

    @Test
    void normalizeCardName_withAccents_shouldRemoveAccents() {
        // Given
        String input = "épée sacrée";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("epee sacree", result);
    }

    @Test
    void normalizeCardName_withApostrophes_shouldReplaceWithSpaces() {
        // Given
        String input = "coup d'épée";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("coup d epee", result);
    }

    @Test
    void normalizeCardName_withCurlyApostrophe_shouldReplaceWithSpace() {
        // Given
        String input = "l'enchanteur";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("l enchanteur", result);
    }

    @Test
    void normalizeCardName_withHyphens_shouldReplaceWithSpaces() {
        // Given
        String input = "arc-en-ciel";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("arc en ciel", result);
    }

    @Test
    void normalizeCardName_withMultipleSpaces_shouldNormalizeToSingleSpaces() {
        // Given
        String input = "pierre    de     lune";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("pierre de lune", result);
    }

    @Test
    void normalizeCardName_withLeadingAndTrailingSpaces_shouldTrim() {
        // Given
        String input = "  anneau d'azur  ";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("anneau d azur", result);
    }

    @ParameterizedTest
    @CsvSource({
            "'coup d''épée', 'coup d epee'",
            "'l''enchanteur', 'l enchanteur'",
            "'arc-en-ciel', 'arc en ciel'",
            "'pierre-de-lune', 'pierre de lune'",
            "'ÉPÉE SACRÉE', 'epee sacree'",
            "'Bouclier d''Or', 'bouclier d or'",
            "'potion-de-vie', 'potion de vie'",
            "'  Anneau   d''Azur  ', 'anneau d azur'"
    })
    void normalizeCardName_withVariousInputs_shouldProduceExpectedOutput(String input, String expected) {
        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals(expected, result);
    }

    @Test
    void normalizeCardName_withComplexCard_shouldHandleAllTransformations() {
        // Given
        String input = "  L'ÉPÉE-SACRÉE  d'Élément  ";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("l epee sacree d element", result);
    }

    @Test
    void normalizeCardName_withNumbersAndSpecialChars_shouldKeepNumbers() {
        // Given
        String input = "Potion +5 d'endurance";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("potion +5 d endurance", result);
    }

    @Test
    void normalizeCardName_withTabsAndNewlines_shouldReplaceWithSpaces() {
        // Given
        String input = "pierre\tde\nlune";

        // When
        String result = TextNormalizer.normalizeCardName(input);

        // Then
        assertEquals("pierre de lune", result);
    }

    @Test
    void normalizeCardName_shouldBeIdempotent() {
        // Given
        String input = "L'épée-sacrée";

        // When
        String firstNormalization = TextNormalizer.normalizeCardName(input);
        String secondNormalization = TextNormalizer.normalizeCardName(firstNormalization);

        // Then
        assertEquals(firstNormalization, secondNormalization);
        assertEquals("l epee sacree", firstNormalization);
    }
}
