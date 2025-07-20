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

            // Debug: Comptages initiaux
            Integer initialGameCount = safeCount("SELECT COUNT(*) FROM game");
            Integer initialCardCount = safeCount("SELECT COUNT(*) FROM card");
            Integer initialRulesCount = safeCount("SELECT COUNT(*) FROM deckruleset");
            
            System.out.println("📊 État initial:");
            System.out.println("   - Jeux: " + initialGameCount);
            System.out.println("   - Cartes: " + initialCardCount);
            System.out.println("   - Règles: " + initialRulesCount);
            System.out.println();

            // Exécuter les scripts d'initialisation dans l'ordre
            executeScript("mage_noir_game_init.sql");
            Integer afterGameCount = safeCount("SELECT COUNT(*) FROM game");
            System.out.println("✅ Jeux initialisés (avant: " + initialGameCount + ", après: " + afterGameCount + ")");
            
            executeScript("mage_noir_rules_init.sql");
            Integer afterRulesCount = safeCount("SELECT COUNT(*) FROM deckruleset");
            System.out.println("✅ Règles initialisées (avant: " + initialRulesCount + ", après: " + afterRulesCount + ")");
            
            executeScript("mage_noir_card_init.sql");
            Integer afterCardCount = safeCount("SELECT COUNT(*) FROM card");
            System.out.println("✅ Cartes initialisées (avant: " + initialCardCount + ", après: " + afterCardCount + ")");

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
        System.out.println("🔍 Debug - Exécution script: " + scriptName);
        ClassPathResource resource = new ClassPathResource(scriptName);
        String sql = resource.getContentAsString(StandardCharsets.UTF_8);
        
        System.out.println("📄 Contenu script (" + sql.length() + " caractères)");
        
        // Diviser le script en commandes individuelles
        String[] commands = sql.split(";");
        System.out.println("📝 Nombre de commandes trouvées: " + commands.length);
        
        int executedCount = 0;
        int errorCount = 0;
        
        for (int i = 0; i < commands.length; i++) {
            String trimmedCommand = commands[i].trim();
            
            if (!trimmedCommand.isEmpty()) {
                // Nettoyer les commentaires du début de la commande
                String[] lines = trimmedCommand.split("\\n");
                StringBuilder cleanCommand = new StringBuilder();
                boolean foundSQL = false;
                
                for (String line : lines) {
                    String trimmedLine = line.trim();
                    if (!trimmedLine.startsWith("--") && !trimmedLine.startsWith("/*") && !trimmedLine.isEmpty()) {
                        cleanCommand.append(line).append("\n");
                        foundSQL = true;
                    } else if (foundSQL) {
                        // Si on a déjà trouvé du SQL, on garde même les lignes vides (pour les blocs multi-lignes)
                        cleanCommand.append(line).append("\n");
                    }
                }
                
                String finalCommand = cleanCommand.toString().trim();
                
                if (!finalCommand.isEmpty()) {
                    System.out.println("🔧 Exécution commande " + (i+1) + ": " + 
                        (finalCommand.length() > 100 ? 
                            finalCommand.substring(0, 100) + "..." : 
                            finalCommand));
                    
                    try {
                        int affectedRows = jdbcTemplate.update(finalCommand);
                        System.out.println("✅ Succès - Lignes affectées: " + affectedRows);
                        executedCount++;
                    } catch (Exception e) {
                        System.out.println("❌ Erreur: " + e.getMessage());
                        errorCount++;
                    }
                } else {
                    System.out.println("⏭️ Commande ignorée (commentaires uniquement)");
                }
            }
        }
        
        System.out.println("📊 Résumé " + scriptName + ":");
        System.out.println("   - Commandes exécutées: " + executedCount);
        System.out.println("   - Erreurs: " + errorCount);
        System.out.println();
    }
}
