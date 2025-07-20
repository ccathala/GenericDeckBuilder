package com.suri.generic.deck.builder.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;

@Component
public class DatabaseInitializer implements CommandLineRunner {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void run(String... args) throws Exception {
        try {
            // Attendre un peu que les tables soient créées par Hibernate
            Thread.sleep(2000);
            
            // Vérifier si les données existent déjà
            Integer gameCount = safeCount("SELECT COUNT(*) FROM game WHERE id = 'mage_noir'");
            
            if (gameCount > 0) {
                System.out.println("✅ Données déjà initialisées, skip de l'initialisation");
                return;
            }

            System.out.println("🚀 Initialisation des données de base...");

            // Exécuter les scripts d'initialisation dans l'ordre
            executeScript("mage_noir_game_init.sql");
            System.out.println("✅ Jeux initialisés");
            
            executeScript("mage_noir_rules_init.sql");
            System.out.println("✅ Règles initialisées");
            
            executeScript("mage_noir_card_init.sql");
            System.out.println("✅ Cartes initialisées");

            // Vérification finale avec gestion des erreurs
            Integer finalGameCount = safeCount("SELECT COUNT(*) FROM game");
            Integer cardCount = safeCount("SELECT COUNT(*) FROM card");
            Integer rulesCount = safeCount("SELECT COUNT(*) FROM deckruleset");

            System.out.println("🎉 Initialisation terminée:");
            System.out.println("   - Jeux: " + finalGameCount);
            System.out.println("   - Cartes: " + cardCount);
            System.out.println("   - Règles: " + rulesCount);

        } catch (Exception e) {
            System.err.println("❌ Erreur lors de l'initialisation: " + e.getMessage());
            // Ne pas faire échouer l'application, juste logger l'erreur
        }
    }

    private Integer safeCount(String query) {
        try {
            Integer result = jdbcTemplate.queryForObject(query, Integer.class);
            return result != null ? result : 0;
        } catch (Exception e) {
            System.out.println("⚠️ Table pas encore créée: " + e.getMessage());
            return 0;
        }
    }

    private void executeScript(String scriptName) throws Exception {
        ClassPathResource resource = new ClassPathResource(scriptName);
        String sql = resource.getContentAsString(StandardCharsets.UTF_8);
        
        // Diviser le script en commandes individuelles
        String[] commands = sql.split(";");
        
        for (String command : commands) {
            String trimmedCommand = command.trim();
            if (!trimmedCommand.isEmpty() && 
                !trimmedCommand.startsWith("--") && 
                !trimmedCommand.startsWith("/*")) {
                try {
                    jdbcTemplate.execute(trimmedCommand);
                } catch (Exception e) {
                    // Log mais continue (pour gérer les contraintes et données existantes)
                    System.out.println("⚠️ Warning: " + e.getMessage());
                }
            }
        }
    }
}
