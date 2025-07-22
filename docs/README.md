# 📚 GenericDeckBuilder Documentation

Bienvenue dans la documentation complète du projet GenericDeckBuilder - un constructeur de decks générique pour jeux de cartes avec support multilingue.

## 🏗️ Architecture du Projet

- [**Vue d'ensemble**](architecture/overview.md) - Architecture globale et composants principaux
- [**Backend (Spring Boot)**](architecture/backend.md) - API REST, sécurité, base de données
- [**Frontend (React + Vite)**](architecture/frontend.md) - Interface utilisateur, composants, état
- [**Base de données**](architecture/database.md) - Modèle de données, migrations, requêtes

## 🚀 Déploiement

- [**Guide Railway**](deployment/railway.md) - Déploiement automatique sur Railway
- [**Configuration Environment**](deployment/environment.md) - Variables d'environnement et profils
- [**Images & CDN**](deployment/images.md) - Gestion des images et CDN
- [**Monitoring & Logs**](deployment/monitoring.md) - Surveillance et debugging

## 📡 API Documentation

- [**Authentification**](api/authentication.md) - JWT, login, registration
- [**Cartes**](api/cards.md) - CRUD des cartes, recherche, filtrage
- [**Decks**](api/decks.md) - Gestion des decks utilisateur
- [**Images**](api/images.md) - URLs d'images et CDN
- [**Admin**](api/admin.md) - Endpoints d'administration

## 💻 Développement

- [**Setup Local**](development/setup.md) - Installation et configuration locale
- [**Conventions**](development/conventions.md) - Standards de code et nommage
- [**Testing**](development/testing.md) - Tests unitaires et d'intégration
- [**Debugging**](development/debugging.md) - Outils et techniques de debug

## 🎯 Guides Spécifiques

### Pour les Développeurs

- [Setup Environnement de Développement](development/setup.md)
- [Architecture des Composants](architecture/frontend.md)
- [Guide des APIs](api/README.md)

### Pour les Administrateurs

- [Déploiement Production](deployment/railway.md)
- [Configuration Sécurité](deployment/environment.md)
- [Monitoring Application](deployment/monitoring.md)

### Pour les Contributeurs

- [Standards de Code](development/conventions.md)
- [Process de Test](development/testing.md)
- [Guide de Contribution](../CONTRIBUTING.md)

## 📋 Liens Rapides

| Ressource              | Lien                                                                          |
| ---------------------- | ----------------------------------------------------------------------------- |
| **Repository GitHub**  | [ccathala/GenericDeckBuilder](https://github.com/ccathala/GenericDeckBuilder) |
| **Production Railway** | [Lien vers l'app déployée]                                                    |
| **API Swagger**        | `/swagger-ui.html` (en dev)                                                   |
| **Issues & Bugs**      | [GitHub Issues](https://github.com/ccathala/GenericDeckBuilder/issues)        |

## 🔄 Structure des Branches

```
main/           # Production stable
├── dev/        # Développement principal
├── feature/*   # Nouvelles fonctionnalités
└── hotfix/*    # Corrections urgentes
```

## 📝 Changelog

Voir [CHANGELOG.md](../CHANGELOG.md) pour l'historique des versions.

---

_Documentation mise à jour le 21 juillet 2025_
