package com.suri.generic.deck.builder.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AssetDebugInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler) {
        String requestURI = request.getRequestURI();
        
        // Log toutes les requêtes d'assets
        if (requestURI.startsWith("/assets/") || requestURI.startsWith("/static/")) {
            System.out.println("=== ASSET REQUEST DEBUG ===");
            System.out.println("URI: " + requestURI);
            System.out.println("Method: " + request.getMethod());
            System.out.println("Origin: " + request.getHeader("Origin"));
            System.out.println("Referer: " + request.getHeader("Referer"));
            System.out.println("User-Agent: " + request.getHeader("User-Agent"));
            System.out.println("Authorization: " + (request.getHeader("Authorization") != null ? "Present" : "None"));
            System.out.println("========================");
        }
        
        return true;
    }

    @Override
    public void afterCompletion(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler, @Nullable Exception ex) {
        String requestURI = request.getRequestURI();
        
        // Log le résultat final pour les assets
        if (requestURI.startsWith("/assets/") || requestURI.startsWith("/static/")) {
            System.out.println("=== ASSET RESPONSE DEBUG ===");
            System.out.println("URI: " + requestURI);
            System.out.println("Status: " + response.getStatus());
            System.out.println("Content-Type: " + response.getContentType());
            if (ex != null) {
                System.out.println("Exception: " + ex.getMessage());
            }
            System.out.println("==========================");
        }
    }
}
