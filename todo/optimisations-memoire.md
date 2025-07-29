# 🚀 Optimisations Mémoire - GenericDeckBuilder

## 📊 Contexte Actuel

- **Usage mémoire production** : 560 Mo
- **Évaluation** : Normal-élevé pour Spring Boot + JPA
- **Statut** : Acceptable (si serveur >= 2 Go RAM)
- **Priorité** : À traiter plus tard
- **Date d'ajout** : 25 juillet 2025

## 🎯 Objectifs

- Réduire l'empreinte mémoire de 15-25% (objectif : ~420-480 Mo)
- Améliorer les performances et la stabilité
- Implémenter un monitoring proactif

## 🔧 Modifications à Implémenter

### 1. Configuration JVM et Base de Données

#### A. Pool de connexions HikariCP
**Fichier :** `backend/src/main/resources/application.properties`
```properties
# Optimiser le pool de connexions
spring.datasource.hikari.maximum-pool-size=5
spring.datasource.hikari.minimum-idle=2
spring.datasource.hikari.connection-timeout=30000
spring.datasource.hikari.idle-timeout=600000
```

#### B. Paramètres JVM
**Fichier :** `backend/Dockerfile` ou script de démarrage
```bash
# Configuration JVM optimisée
JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC -XX:MaxGCPauseMillis=200"
```

#### C. Configuration Hibernate
**Fichier :** `backend/src/main/resources/application.properties`
```properties
# Optimisations Hibernate
spring.jpa.hibernate.batch_size=25
spring.jpa.properties.hibernate.jdbc.batch_size=25
spring.jpa.properties.hibernate.order_inserts=true
spring.jpa.properties.hibernate.order_updates=true

# Réduire les logs en production
logging.level.org.hibernate.SQL=WARN
logging.level.org.hibernate.type.descriptor.sql.BasicBinder=WARN
```

### 2. Optimisations Code

#### A. Service CardServiceImpl
**Fichier :** `backend/src/main/java/com/suri/generic/deck/builder/service/impl/CardServiceImpl.java`

**Problème :** Utilisation de `findAll()` qui charge toutes les cartes en mémoire

**Solution :** Implémenter la pagination
```java
// Remplacer findAll() par pagination
public Page<Card> getCardsByGame(Long gameId, Pageable pageable) {
    return cardRepository.findByGameIdOrderByNameAsc(gameId, pageable);
}

// Ajouter des projections pour réduire les données
public List<CardSummaryDto> getCardSummaries(Long gameId) {
    return cardRepository.findCardSummariesByGameId(gameId);
}
```

#### B. Repository CardRepository
**Fichier :** `backend/src/main/java/com/suri/generic/deck/builder/repository/CardRepository.java`

**Solution :** Ajouter des requêtes optimisées
```java
// Projection pour éviter de charger les propriétés JSON volumineuses
@Query("SELECT new com.suri.generic.deck.builder.dto.CardSummaryDto(c.id, c.name, c.gameId) " +
       "FROM Card c WHERE c.gameId = :gameId")
List<CardSummaryDto> findCardSummariesByGameId(@Param("gameId") Long gameId);

// Pagination native
Page<Card> findByGameIdOrderByNameAsc(Long gameId, Pageable pageable);
```

#### C. Nouveau DTO CardSummaryDto
**Fichier :** `backend/src/main/java/com/suri/generic/deck/builder/dto/CardSummaryDto.java`

**À créer :** DTO léger pour éviter de charger les propriétés JSON
```java
public class CardSummaryDto {
    private UUID id;
    private String name;
    private Long gameId;
    
    // Constructeurs, getters, setters
    // Évite de charger les propriétés JSON volumineuses
}
```

### 3. Configuration Cache

#### A. Nouveau fichier CacheConfig
**Fichier :** `backend/src/main/java/com/suri/generic/deck/builder/config/CacheConfig.java`

**À créer :** Cache contrôlé avec Caffeine
```java
@Configuration
@EnableCaching
public class CacheConfig {
    
    @Bean
    public CacheManager cacheManager() {
        CaffeineCacheManager cacheManager = new CaffeineCacheManager();
        cacheManager.setCaffeine(Caffeine.newBuilder()
            .maximumSize(1000)  // Limiter la taille du cache
            .expireAfterWrite(30, TimeUnit.MINUTES)
            .weakKeys()
            .recordStats());
        return cacheManager;
    }
}
```

#### B. Dépendance Maven
**Fichier :** `backend/pom.xml`
```xml
<!-- Ajouter la dépendance Caffeine -->
<dependency>
    <groupId>com.github.ben-manes.caffeine</groupId>
    <artifactId>caffeine</artifactId>
</dependency>
```

### 4. Monitoring et Métriques

#### A. Configuration monitoring
**Fichier :** `backend/src/main/resources/application.properties`
```properties
# Monitoring mémoire
management.endpoints.web.exposure.include=health,metrics,prometheus
management.endpoint.metrics.enabled=true
management.metrics.export.prometheus.enabled=true
```

#### B. Nouveau fichier MetricsConfig
**Fichier :** `backend/src/main/java/com/suri/generic/deck/builder/config/MetricsConfig.java`

**À créer :** Configuration des métriques
```java
@Configuration
public class MetricsConfig {
    
    @Bean
    public MeterRegistryCustomizer<MeterRegistry> metricsCommonTags() {
        return registry -> registry.config()
            .commonTags("application", "generic-deck-builder");
    }
}
```

## 📈 Résultats Attendus

### Gains de Performance
- **Réduction mémoire** : 15-25% (560 Mo → 420-480 Mo)
- **Temps de réponse** : Amélioration des requêtes avec pagination
- **Stabilité GC** : Réduction de la fréquence du garbage collection
- **Throughput** : Meilleure capacité de traitement simultané

### Métriques à Surveiller
- **Heap utilization** : < 80% de la limite
- **GC frequency** : < 10% du temps CPU
- **Response time** : Pas de dégradation
- **Memory leaks** : Détection proactive

## 🗓️ Planification

### Estimation
- **Durée** : 1-2 jours de développement
- **Complexité** : Moyenne
- **Risque** : Faible (modifications non-breaking)
- **Tests requis** : Validation en dev + staging

### Étapes d'Implémentation
1. **Phase 1** : Configuration JVM et base de données (2h)
2. **Phase 2** : Optimisations code (4h)
3. **Phase 3** : Cache et monitoring (3h)
4. **Phase 4** : Tests et validation (8h)

### Critères de Validation
- [ ] Tests unitaires passent
- [ ] Performance en dev >= performance actuelle
- [ ] Usage mémoire réduit de 15%+ en staging
- [ ] Stabilité validée sur 24-48h
- [ ] Monitoring fonctionnel

## 📚 Références Techniques

### Benchmarks Applications Similaires
- **API CRUD simple** : 200-350 Mo
- **API avec authentification** : 300-450 Mo
- **API avec JPA + Cache** : 400-600 Mo ← **Position actuelle**
- **API complexe e-commerce** : 600-1000 Mo

### Outils de Profiling
- **VisualVM** : Profiling en développement
- **JProfiler** : Analyse détaillée mémoire
- **Micrometer + Prometheus** : Monitoring production
- **JVM flags** : `-XX:+PrintGC -XX:+PrintGCDetails`

## ⚠️ Notes Importantes

- **Priorité** : Non critique, optimisation de performance
- **Compatibilité** : Vérifier les versions Spring Boot/Caffeine
- **Rollback** : Conserver la configuration actuelle en backup
- **Documentation** : Mettre à jour le README avec les nouvelles métriques

---

**Créé le** : 25 juillet 2025  
**Statut** : En attente  
**Assigné à** : À définir  
**Dépendances** : Aucune
