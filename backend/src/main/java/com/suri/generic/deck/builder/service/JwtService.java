package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.model.User;
import io.jsonwebtoken.Claims;

import java.security.Key;
import java.util.function.Function;

public interface JwtService {
    String extractUsername(String token);
    <T> T extractClaim(String token, Function<Claims, T> resolver);
    boolean isTokenValid(String token, org.springframework.security.core.userdetails.UserDetails userDetails);
    public String generateToken(User user);
}
