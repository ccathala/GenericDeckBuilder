package com.suri.generic.deck.builder.config;

import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;

import javax.sql.DataSource;
import java.net.URI;

/**
 * Configuration de la base de données pour l'environnement de production.
 * Parse correctement l'URL Railway et configure HikariCP avec les credentials séparés.
 */
@Configuration
@Profile("prod")
public class DatabaseConfig {

    private final Environment environment;

    public DatabaseConfig(Environment environment) {
        this.environment = environment;
    }

    @Bean
    public DataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        
        // Récupération de l'URL depuis Railway
        String databaseUrl = environment.getProperty("DATABASE_URL");
        
        if (databaseUrl != null) {
            try {
                // Parse de l'URL Railway
                DatabaseUrlInfo urlInfo = parseDatabaseUrl(databaseUrl);
                
                // Configuration de HikariCP avec les composants séparés
                dataSource.setJdbcUrl(urlInfo.getJdbcUrl());
                dataSource.setUsername(urlInfo.getUsername());
                dataSource.setPassword(urlInfo.getPassword());
                dataSource.setDriverClassName("org.postgresql.Driver");
                
                // Configuration HikariCP optimisée pour Railway
                dataSource.setMaximumPoolSize(10);
                dataSource.setMinimumIdle(2);
                dataSource.setConnectionTimeout(20000);
                dataSource.setIdleTimeout(300000);
                dataSource.setMaxLifetime(1200000);
                dataSource.setLeakDetectionThreshold(60000);
                
                // Propriétés spécifiques PostgreSQL
                dataSource.addDataSourceProperty("stringtype", "unspecified");
                dataSource.addDataSourceProperty("prepareThreshold", 0);
                
            } catch (Exception e) {
                throw new RuntimeException("Erreur lors du parsing de DATABASE_URL: " + databaseUrl, e);
            }
        }
        
        return dataSource;
    }

    /**
     * Parse une URL de base de données Railway et extrait les composants.
     * Format attendu: postgresql://user:pass@host:port/database
     */
    private DatabaseUrlInfo parseDatabaseUrl(String url) throws Exception {
        URI uri = new URI(url);
        
        String scheme = uri.getScheme();
        if (!"postgresql".equals(scheme) && !"postgres".equals(scheme)) {
            throw new IllegalArgumentException("Schéma non supporté: " + scheme);
        }
        
        String host = uri.getHost();
        int port = uri.getPort() != -1 ? uri.getPort() : 5432;
        String database = uri.getPath().substring(1); // Retire le "/" initial
        
        String userInfo = uri.getUserInfo();
        String username = null;
        String password = null;
        
        if (userInfo != null) {
            String[] userParts = userInfo.split(":");
            username = userParts[0];
            password = userParts.length > 1 ? userParts[1] : "";
        }
        
        // Construction de l'URL JDBC sans les credentials
        String jdbcUrl = String.format("jdbc:postgresql://%s:%d/%s", host, port, database);
        
        return new DatabaseUrlInfo(jdbcUrl, username, password);
    }

    /**
     * Classe interne pour stocker les informations de connexion.
     */
    private static class DatabaseUrlInfo {
        private final String jdbcUrl;
        private final String username;
        private final String password;

        public DatabaseUrlInfo(String jdbcUrl, String username, String password) {
            this.jdbcUrl = jdbcUrl;
            this.username = username;
            this.password = password;
        }

        public String getJdbcUrl() { return jdbcUrl; }
        public String getUsername() { return username; }
        public String getPassword() { return password; }
    }
}
