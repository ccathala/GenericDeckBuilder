package com.suri.generic.deck.builder.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class SecurityDebugFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull FilterChain filterChain) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        
        if (requestURI.startsWith("/assets/") || requestURI.startsWith("/static/")) {
            System.out.println("=== SECURITY FILTER DEBUG ===");
            System.out.println("Before Security: " + requestURI);
            System.out.println("Method: " + request.getMethod());
            System.out.println("Authenticated: " + (request.getUserPrincipal() != null));
            
            try {
                filterChain.doFilter(request, response);
                System.out.println("After Security: Status = " + response.getStatus());
            } catch (Exception e) {
                System.out.println("Security Exception: " + e.getMessage());
                throw e;
            } finally {
                System.out.println("==========================");
            }
        } else {
            filterChain.doFilter(request, response);
        }
    }
}
