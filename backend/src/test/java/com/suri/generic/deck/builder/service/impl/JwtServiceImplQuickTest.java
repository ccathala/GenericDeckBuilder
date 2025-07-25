package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test rapide pour valider que la nouvelle clé JWT fonctionne correctement
 */
@SpringBootTest
@ActiveProfiles("test")
class JwtServiceImplQuickTest {

    @Autowired
    private JwtServiceImpl jwtService;

    @Test
    void testJwtKeyIsSecureEnough() {
        // Ce test vérifie que la clé JWT peut être utilisée sans lever d'exception WeakKeyException
        assertDoesNotThrow(() -> {
            // Créer un utilisateur de test
            User testUser = new User();
            testUser.setEmail("testuser@example.com");
            
            // Cette méthode utilise getSigningKey() qui lèverait WeakKeyException si la clé était trop courte
            String token = jwtService.generateToken(testUser);
            assertNotNull(token);
            assertTrue(token.length() > 0);
            
            // Vérifier que nous pouvons extraire le nom d'utilisateur (email)
            String extractedUsername = jwtService.extractUsername(token);
            assertEquals("testuser@example.com", extractedUsername);
            
            System.out.println("✅ JWT Token généré avec succès avec la nouvelle clé sécurisée!");
            System.out.println("Token (tronqué): " + token.substring(0, Math.min(50, token.length())) + "...");
        });
    }

    @Test
    void testSigningKeyGeneration() {
        // Test direct de la génération de clé de signature
        assertDoesNotThrow(() -> {
            // Utiliser réflexion pour accéder à la méthode privée getSigningKey()
            java.lang.reflect.Method getSigningKeyMethod = JwtServiceImpl.class.getDeclaredMethod("getSigningKey");
            getSigningKeyMethod.setAccessible(true);
            
            Object signingKey = getSigningKeyMethod.invoke(jwtService);
            assertNotNull(signingKey);
            
            System.out.println("✅ Clé de signature JWT générée sans erreur WeakKeyException!");
        });
    }
}
