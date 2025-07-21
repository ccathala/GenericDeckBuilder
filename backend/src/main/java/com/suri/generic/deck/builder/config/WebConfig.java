package com.suri.generic.deck.builder.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.lang.NonNull;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.time.Duration;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(@NonNull CorsRegistry registry) {
        // Configuration CORS pour toutes les routes API et Auth
        registry.addMapping("/api/**")
                .allowedOrigins("https://mage-noir-deckbuilder.up.railway.app", "http://localhost:5173")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true);

        // CORS pour les endpoints d'authentification
        registry.addMapping("/auth/**")
                .allowedOrigins("https://mage-noir-deckbuilder.up.railway.app", "http://localhost:5173")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true);
    }

    @Override
    public void addResourceHandlers(@NonNull ResourceHandlerRegistry registry) {
        // Assets statiques avec headers optimaux (JS, CSS, images)
        registry.addResourceHandler("/assets/**")
                .addResourceLocations("classpath:/static/assets/")
                .setCacheControl(CacheControl.maxAge(Duration.ofDays(365))) // Cache 1 an
                .resourceChain(true);

        // Autres ressources statiques (favicon, robots.txt, etc.)
        registry.addResourceHandler("/static/**", "/*.ico", "/*.svg", "/*.png", "/*.txt")
                .addResourceLocations("classpath:/static/")
                .setCacheControl(CacheControl.maxAge(Duration.ofDays(7))) // Cache 1 semaine
                .resourceChain(true);

        // Fallback pour SPA - sans cache pour permettre les updates
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/")
                .setCacheControl(CacheControl.noCache())
                .resourceChain(false);

        // Configuration des images statiques - chemin corrigé pour Spring Boot qui
        // démarre depuis /backend
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:../images/")
                .setCachePeriod(3600); // Cache 1h
    }

    @Override
    public void addViewControllers(@NonNull ViewControllerRegistry registry) {
        // Rediriger toutes les routes non-API vers index.html (SPA routing)
        registry.addViewController("/")
                .setViewName("forward:/index.html");
        registry.addViewController("/{path:[^.]*}")
                .setViewName("forward:/index.html");
    }
}
