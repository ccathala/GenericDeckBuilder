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
            // Vérifier si les données existent déjà
            Integer gameCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM game WHERE id = 'mage_noir'", Integer.class);
            
            if (gameCount != null && gameCount > 0) {
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

            // Vérification finale
            Integer finalGameCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM game", Integer.class);
            Integer cardCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM card", Integer.class);
            Integer rulesCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM deck_ruleset", Integer.class);

            System.out.println("🎉 Initialisation terminée:");
            System.out.println("   - Jeux: " + (finalGameCount != null ? finalGameCount : 0));
            System.out.println("   - Cartes: " + (cardCount != null ? cardCount : 0));
            System.out.println("   - Règles: " + (rulesCount != null ? rulesCount : 0));

        } catch (Exception e) {
            System.err.println("❌ Erreur lors de l'initialisation: " + e.getMessage());
            // Ne pas faire échouer l'application, juste logger l'erreur
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
