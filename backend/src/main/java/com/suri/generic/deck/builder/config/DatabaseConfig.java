package com.suri.generic.deck.builder.config;

import com.zaxxer.hikari.HikariDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;

import javax.sql.DataSource;

/**
 * Configuration de la base de données pour l'environnement de production.
 * Gère la conversion automatique des URLs Railway vers le format JDBC.
 */
@Configuration
@Profile("prod")
public class DatabaseConfig {

    private final Environment environment;

    public DatabaseConfig(Environment environment) {
        this.environment = environment;
    }

    @Bean
    @ConfigurationProperties("spring.datasource.hikari")
    public DataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        
        // Récupération de l'URL depuis Railway
        String databaseUrl = environment.getProperty("DATABASE_URL");
        
        if (databaseUrl != null) {
            // Conversion de l'URL Railway vers le format JDBC
            String jdbcUrl = convertRailwayUrlToJdbcUrl(databaseUrl);
            dataSource.setJdbcUrl(jdbcUrl);
            dataSource.setDriverClassName("org.postgresql.Driver");
            
            // Configuration HikariCP optimisée pour production
            dataSource.setMaximumPoolSize(10);
            dataSource.setMinimumIdle(2);
            dataSource.setConnectionTimeout(20000);
            dataSource.setIdleTimeout(300000);
            dataSource.setMaxLifetime(1200000);
            dataSource.setLeakDetectionThreshold(60000);
        }
        
        return dataSource;
    }

    /**
     * Convertit une URL Railway au format PostgreSQL vers le format JDBC.
     * Railway fournit: postgresql://user:pass@host:port/db
     * JDBC attend: jdbc:postgresql://host:port/db
     */
    private String convertRailwayUrlToJdbcUrl(String railwayUrl) {
        if (railwayUrl.startsWith("postgresql://")) {
            return "jdbc:" + railwayUrl;
        } else if (railwayUrl.startsWith("postgres://")) {
            return railwayUrl.replace("postgres://", "jdbc:postgresql://");
        }
        return railwayUrl; // Déjà au bon format
    }
}
