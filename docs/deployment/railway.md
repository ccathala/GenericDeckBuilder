# 🚀 Guide Déploiement Railway

## Vue d'Ensemble

Railway est la plateforme de déploiement cloud utilisée pour héberger GenericDeckBuilder en production. Ce guide couvre la configuration complète et le déploiement automatique.

## 🎯 Configuration Railway

### 1. Création du Projet Railway

1. **Connecter GitHub :** `https://railway.app` → Connect GitHub Repository
2. **Sélectionner Repository :** `ccathala/GenericDeckBuilder`
3. **Configuration Automatique :** Railway détecte Spring Boot automatiquement

### 2. Configuration Variables d'Environnement

#### Variables Obligatoires

```bash
# Base de données (générée automatiquement par Railway)
DATABASE_URL=postgresql://postgres:password@host:port/database

# JWT Security
JWT_SECRET=your-super-secret-jwt-key-256-bits-minimum
JWT_EXPIRATION=86400000

# Profil Spring Boot
SPRING_PROFILES_ACTIVE=prod

# Images CDN
APP_CDN_BASE_URL=https://magenoir.com/cards
APP_CDN_ENABLE_FALLBACK=false

# Configuration Railway
PORT=8080
```

#### Variables Optionnelles

```bash
# Debug (désactiver en production)
LOGGING_LEVEL_COM_SURI=INFO
SKIP_IMAGE_SETUP=true

# Base de données overrides (si nécessaire)
SPRING_DATASOURCE_URL=${DATABASE_URL}
```

### 3. Configuration Build & Deploy

#### Dockerfile (Railway le génère automatiquement)

```dockerfile
FROM openjdk:17-jdk-slim
COPY target/generic-deck-builder-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
```

#### Configuration Maven

Le `pom.xml` inclut déjà :

- Plugin Spring Boot pour JAR exécutable
- Profil production avec optimisations
- Dépendances minimales pour container

## 🗄️ Base de Données Railway

### PostgreSQL Automatique

Railway créé automatiquement :

- **Instance PostgreSQL 16**
- **Variable DATABASE_URL** générée
- **Connexions automatiques** configurées
- **Backups quotidiens** inclus

### Initialisation des Données

Au premier déploiement, les données sont initialisées **manuellement** :

```sql
-- Connexion via DBeaver ou client PostgreSQL
-- Exécution manuelle des scripts dans l'ordre :
-- 1. mageNoirInitGame.sql     : Structure des tables et jeu initial
-- 2. mageNoirCardInit.sql     : Données initiales (410 cartes)
-- 3. mage_noir_rules_init.sql : Règles de validation des decks
```

**Processus manuel requis :**

1. Se connecter à la base Railway via DBeaver
2. Exécuter `mageNoirInitGame.sql`
3. Exécuter `mageNoirCardInit.sql`
4. Exécuter `mage_noir_rules_init.sql`
5. Vérifier l'insertion des 410 cartes et des règles

### Monitoring Database

```bash
# Connexion manuelle via DBeaver recommandée
# Utiliser DATABASE_URL de Railway pour la connexion

# Ou via Railway CLI (optionnel)
railway db connect

# Vérification en logs d'application
# Chercher: "HHH000204: Processing PersistenceUnitInfo"
```

## 🌐 Configuration Images & CDN

### Mode CDN (Configuration Actuelle)

```properties
app.cdn.base-url=https://magenoir.com/cards
app.cdn.enable-fallback=false
```

**Avantages :**

- ✅ Aucun stockage Railway nécessaire
- ✅ Démarrage instantané (pas de téléchargement)
- ✅ Bande passante illimitée
- ✅ Images toujours à jour depuis la source

**Important :** Le projet n'utilise **pas** de volume Railway pour la persistance des images. Toutes les images sont servies directement depuis le CDN externe.

## 🔄 CI/CD Pipeline

### Déploiement Automatique

```
GitHub Push → Railway Webhook → Build → Deploy → Health Check
```

### Processus de Build

1. **Detection :** Maven project détecté
2. **Build :** `mvn clean package -DskipTests`
3. **Container :** JAR Spring Boot dans OpenJDK 17
4. **Deploy :** Health check sur `/actuator/health`

### Branches de Déploiement

- **Production :** `main` branch → Railway Production
- **Staging :** `dev` branch → Railway Preview (optionnel)

## 🔧 Configuration Profils Spring

### Profil Production (`prod`)

```properties
# src/main/resources/application-prod.properties
spring.datasource.url=${DATABASE_URL}
spring.jpa.hibernate.ddl-auto=validate
spring.jpa.show-sql=false
logging.level.com.suri.generic.deck.builder=INFO

# CDN Images
app.cdn.base-url=https://magenoir.com/cards
app.cdn.enable-fallback=false

# Security
server.error.include-stacktrace=never
```

### Components Profil-Spécifiques

Le profil production utilise la configuration standard Spring Boot sans composants spécifiques.

## 📊 Monitoring & Logs

### Health Checks

Railway vérifie automatiquement :

- **HTTP Response :** Port 8080 répond
- **Actuator Health :** `/actuator/health` returns OK
- **Database Connection :** HikariCP pool status

### Logs d'Application

```bash
# Via Railway Dashboard
Dashboard → Votre service → Deploy Logs

# Logs Spring Boot recherchés :
# Started Application in X.XXX seconds
# HikariPool-1 - Start completed
```

### Métriques Performance

- **Startup Time :** ~30-45 secondes (premier démarrage)
- **Memory Usage :** ~512MB-1GB
- **Response Time :** < 200ms (API calls)

## 🚨 Dépannage Production

### Problèmes Courants

#### 1. Application ne démarre pas

```bash
# Vérifier logs Railway
# Chercher erreurs dans :
# - Database connection
# - Missing environment variables
# - Port binding issues
```

#### 2. Images ne s'affichent pas

```bash
# Test direct CDN
curl -I https://magenoir.com/cards/FR/Vegetal/Graine.png

# Vérifier logs d'application pour erreurs CDN
```

#### 3. Base de données inaccessible

```bash
# Vérifier DATABASE_URL dans variables Railway
# Format attendu : postgresql://user:pass@host:port/db
```

### Debug en Production

```bash
# Endpoints disponibles :
GET /actuator/health             # Health check général
GET /actuator/info               # Informations application
```

## 🔒 Sécurité Production

### Variables Sensibles

- **JWT_SECRET :** Généré aléatoirement, 256+ bits
- **DATABASE_URL :** Géré automatiquement par Railway
- **API Keys :** Stockés dans Railway Secrets

### HTTPS/SSL

- **Automatique :** Railway configure SSL/TLS automatiquement
- **Custom Domain :** Configurable dans Railway Dashboard
- **Certificats :** Let's Encrypt automatique

### CORS Configuration

```java
// Configuré pour production
@CrossOrigin(origins = {"https://votre-domaine.railway.app"})
```

## 💰 Coûts Railway

### Usage Type (Gratuit)

- **Limites :** 512MB RAM, 1GB storage, 100GB bandwidth/mois
- **Suffisant pour :** Développement et petites apps

### Pro Plan (~$5/mois)

- **Resources :** Plus de RAM/CPU
- **Features :** Custom domains, priorité support
- **Recommandé pour :** Production avec trafic

## 📋 Checklist Déploiement

### Avant Premier Déploiement

- [ ] Variables d'environnement configurées
- [ ] JWT_SECRET généré et sécurisé
- [ ] Base de données Railway créée
- [ ] Configuration CDN validée
- [ ] Branch `main` prête à déployer

### Après Déploiement

- [ ] Health check OK (`/actuator/health`)
- [ ] **Initialisation manuelle DB via DBeaver**
- [ ] **Exécution mageNoirInitGame.sql**
- [ ] **Exécution mageNoirCardInit.sql**
- [ ] **Exécution mage_noir_rules_init.sql**
- [ ] Vérification 410 cartes insérées
- [ ] Vérification règles deck configurées (min 40 cartes, max 4 copies)
- [ ] API répond (`/api/public/games/magenoir/cards`)
- [ ] Images s'affichent depuis CDN externe
- [ ] Logs sans erreurs critiques

### Monitoring Continu

- [ ] Vérification hebdomadaire des logs
- [ ] Performance response times
- [ ] Usage bandwidth Railway
- [ ] Database backup status

---

_Guide Railway mis à jour pour la configuration production actuelle_
