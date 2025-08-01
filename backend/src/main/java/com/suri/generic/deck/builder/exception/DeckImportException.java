package com.suri.generic.deck.builder.exception;

import lombok.Getter;

import java.util.List;

/**
 * Exception lancée lors d'erreurs d'importation de deck
 */
@Getter
public class DeckImportException extends RuntimeException {

    private final List<String> errors;

    public DeckImportException(String message, List<String> errors) {
        super(message);
        this.errors = errors;
    }

    public DeckImportException(String message) {
        super(message);
        this.errors = List.of();
    }
}
