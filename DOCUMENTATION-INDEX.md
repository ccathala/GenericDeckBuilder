# 📋 Index Documentation Complète

Cette page référence tous les documents de documentation disponibles dans le projet GenericDeckBuilder.

## 📚 Documentation Organisée

### 🏗️ Architecture & Design

- [**Vue d'ensemble**](docs/architecture/overview.md) - Architecture globale du système
- [**Backend Architecture**](docs/architecture/backend.md) - Spring Boot, APIs, sécurité _(à créer)_
- [**Frontend Architecture**](docs/architecture/frontend.md) - React, composants, état _(à créer)_
- [**Database Design**](docs/architecture/database.md) - Modèle de données, relations _(à créer)_

### 🚀 Déploiement & Production

- [**Guide Railway**](docs/deployment/railway.md) - Déploiement production complet
- [**Volume Setup**](RAILWAY-VOLUME-GUIDE.md) - Configuration stockage persistant
- [**CDN Setup**](CDN-SETUP-GUIDE.md) - Configuration CDN images _(créé puis annulé)_
- [**Environment Config**](docs/deployment/environment.md) - Variables d'environnement _(à créer)_

### 💻 Développement

- [**Setup Local**](docs/development/setup.md) - Installation environnement développement
- [**Conventions**](docs/development/conventions.md) - Standards de code et nommage
- [**Testing Guide**](docs/development/testing.md) - Tests unitaires/intégration _(à créer)_
- [**Debugging Guide**](docs/development/debugging.md) - Outils de debug _(à créer)_

### 📡 API Documentation

- [**API Overview**](docs/api/README.md) - Documentation API complète
- [**Authentication**](docs/api/authentication.md) - JWT, login, registration _(à créer)_
- [**Cards API**](docs/api/cards.md) - CRUD cartes, recherche _(à créer)_
- [**Decks API**](docs/api/decks.md) - Gestion decks utilisateur _(à créer)_
- [**Images API**](docs/api/images.md) - URLs images et CDN _(à créer)_

### 🤝 Contribution

- [**Guide Contribution**](CONTRIBUTING.md) - Comment contribuer au projet
- [**Code of Conduct**](CODE_OF_CONDUCT.md) - Règles de conduite _(à créer)_
- [**Issue Templates**](.github/ISSUE_TEMPLATE/) - Templates GitHub _(à créer)_

## 📂 Documentation Legacy/Technique

### Guides Spécifiques

- [**Railway Bash Fix**](todo/railway-bash-fix.md) - Résolution problèmes shell
- [**Config Conflicts**](todo/config-conflicts-analysis.md) - Analyse conflits configuration
- [**Script Setup Images**](scripts/README.md) - Scripts téléchargement images

### Fichiers Techniques

- [**Application Properties**](backend/src/main/resources/application.properties) - Configuration Spring Boot
- [**Package.json Frontend**](frontend/package.json) - Dépendances React
- [**POM.xml Backend**](backend/pom.xml) - Dépendances Maven
- [**Docker/Railway Config**](railway.json) - Configuration déploiement _(si existe)_

## 🎯 Documentation par Audience

### Pour Développeurs Débutants

1. [Setup Local](docs/development/setup.md) - Installer et lancer
2. [Architecture Overview](docs/architecture/overview.md) - Comprendre le système
3. [Conventions](docs/development/conventions.md) - Standards de code
4. [Guide Contribution](CONTRIBUTING.md) - Première contribution

### Pour Développeurs Expérimentés

1. [API Documentation](docs/api/README.md) - Endpoints disponibles
2. [Backend Architecture](docs/architecture/backend.md) _(à créer)_
3. [Testing Guide](docs/development/testing.md) _(à créer)_
4. [Performance Guidelines](docs/development/conventions.md#performance-guidelines)

### Pour Administrateurs/DevOps

1. [Railway Deployment](docs/deployment/railway.md) - Déploiement production
2. [Environment Config](docs/deployment/environment.md) _(à créer)_
3. [Monitoring Guide](docs/deployment/monitoring.md) _(à créer)_
4. [Security Config](docs/deployment/security.md) _(à créer)_

### Pour Product Owners/Stakeholders

1. [Project README](README.md) - Vue d'ensemble projet
2. [Architecture Overview](docs/architecture/overview.md) - Vision technique
3. [API Overview](docs/api/README.md) - Capacités système
4. [Contribution Guide](CONTRIBUTING.md) - Processus développement

## ✅ État de la Documentation

### ✅ Complété

- [x] Index documentation
- [x] Setup développement local
- [x] Guide déploiement Railway
- [x] Conventions de développement
- [x] Vue d'ensemble architecture
- [x] API documentation structure
- [x] Guide contribution
- [x] Configuration volume Railway

### 🚧 En Cours

- [ ] Backend architecture détaillée
- [ ] Frontend architecture détaillée
- [ ] Database design documentation
- [ ] Testing guide complet
- [ ] Environment configuration guide

### 📋 À Faire

- [ ] Individual API endpoints documentation
- [ ] Debugging guide
- [ ] Monitoring & observability guide
- [ ] Security configuration guide
- [ ] Performance optimization guide
- [ ] Mobile/responsive documentation
- [ ] Internationalization guide

## 🔍 Comment Naviguer

### Par Tâche

- **Je veux développer localement** → [Setup Local](docs/development/setup.md)
- **Je veux déployer en production** → [Guide Railway](docs/deployment/railway.md)
- **Je veux comprendre l'architecture** → [Overview](docs/architecture/overview.md)
- **Je veux utiliser les APIs** → [API Docs](docs/api/README.md)
- **Je veux contribuer** → [Guide Contribution](CONTRIBUTING.md)

### Par Composant

- **Backend Spring Boot** → [Backend docs](docs/architecture/backend.md) _(à créer)_
- **Frontend React** → [Frontend docs](docs/architecture/frontend.md) _(à créer)_
- **Base de données** → [Database docs](docs/architecture/database.md) _(à créer)_
- **Déploiement** → [Deployment docs](docs/deployment/)
- **Images/CDN** → [Railway Volume Guide](RAILWAY-VOLUME-GUIDE.md)

## 🔄 Mise à Jour Documentation

### Responsabilités

- **Développeurs** : Documenter nouveau code/APIs
- **Maintainers** : Revoir et valider documentation
- **Contributors** : Améliorer documentation existante

### Process

1. **Modification code** → Mise à jour docs correspondante
2. **Nouvelle feature** → Documentation API/usage
3. **Bug fix** → Update troubleshooting guides
4. **Architecture change** → Update overview/design docs

### Standards Documentation

- **Markdown** : Format standard pour tous les docs
- **Structure** : Headers hiérarchiques (H1-H6)
- **Liens** : Relatifs pour navigation interne
- **Exemples** : Code samples avec syntax highlighting
- **Mise à jour** : Date de dernière modification

---

_Index mis à jour automatiquement - Dernière version : 21 juillet 2025_
