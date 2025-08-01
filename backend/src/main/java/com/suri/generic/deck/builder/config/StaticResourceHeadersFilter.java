package com.suri.generic.deck.builder.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class StaticResourceHeadersFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response,
            @NonNull FilterChain filterChain) throws ServletException, IOException {

        String requestURI = request.getRequestURI();

        // Headers optimaux pour assets statiques
        if (requestURI.startsWith("/assets/")) {
            // Headers de cache agressif pour assets avec hash
            response.setHeader("Cache-Control", "public, max-age=31536000, immutable");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "GET, OPTIONS");
            response.setHeader("Access-Control-Max-Age", "86400");

            // Headers de sécurité pour assets
            response.setHeader("X-Content-Type-Options", "nosniff");
            response.setHeader("Referrer-Policy", "strict-origin-when-cross-origin");

        } else if (requestURI.matches(".*\\.(ico|svg|png|txt)$")) {
            // Headers pour ressources statiques simples
            response.setHeader("Cache-Control", "public, max-age=604800"); // 1 semaine
            response.setHeader("Access-Control-Allow-Origin", "*");

        } else if (requestURI.startsWith("/auth/") || requestURI.startsWith("/api/")) {
            // Headers pour endpoints API et Auth (JSON responses)
            response.setHeader("Content-Type", "application/json");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("X-Content-Type-Options", "nosniff");
            response.setHeader("Referrer-Policy", "strict-origin-when-cross-origin");
            response.setHeader("X-Frame-Options", "DENY");

        } else if (requestURI.equals("/") || requestURI.equals("/index.html")) {
            // Headers pour la page principale (pas de cache pour permettre updates)
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
        }

        filterChain.doFilter(request, response);
    }

    @Override
    protected boolean shouldNotFilter(@NonNull HttpServletRequest request) {
        // Appliquer le filtre à tous les endpoints SAUF actuator (health check)
        String path = request.getRequestURI();
        return path.startsWith("/actuator/");
    }
}
