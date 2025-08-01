package com.suri.generic.deck.builder.exception;

/**
 * Exception lancée lorsqu'un utilisateur tente d'accéder à une ressource 
 * pour laquelle il n'a pas les droits nécessaires.
 */
public class UnauthorizedAccessException extends RuntimeException {
    
    public UnauthorizedAccessException(String message) {
        super(message);
    }
    
    public UnauthorizedAccessException(String message, Throwable cause) {
        super(message, cause);
    }
}
