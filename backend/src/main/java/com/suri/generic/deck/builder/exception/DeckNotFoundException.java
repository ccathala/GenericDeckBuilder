package com.suri.generic.deck.builder.exception;

/**
 * Exception lancée lorsqu'un deck n'est pas trouvé.
 */
public class DeckNotFoundException extends RuntimeException {
    
    public DeckNotFoundException(String message) {
        super(message);
    }
    
    public DeckNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
