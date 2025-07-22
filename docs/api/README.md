# 📡 API Documentation

Documentation complète de l'API REST GenericDeckBuilder.

## 🌐 Base URL

- **Development :** `http://localhost:8080/api`
- **Production :** `https://your-app.railway.app/api`

## 🔐 Authentification

Toutes les APIs (sauf `/auth/**`) nécessitent un token JWT :

```bash
Authorization: Bearer <jwt-token>
```

## 📚 Endpoints Disponibles

### Authentication

- [`POST /auth/login`](authentication.md#login) - Connexion utilisateur
- [`POST /auth/register`](authentication.md#register) - Inscription utilisateur

### Games Management

- [`GET /api/games`](games.md#list-games) - Lister tous les jeux
- [`GET /api/games/{id}`](games.md#get-game) - Détail d'un jeu
- [`POST /api/games`](games.md#create-game) - Créer jeu
- [`PUT /api/games/{id}`](games.md#update-game) - Modifier jeu
- [`DELETE /api/games/{id}`](games.md#delete-game) - Supprimer jeu
- [`GET /api/games/{id}/ruleset`](games.md#get-ruleset) - Ruleset d'un jeu

### Cards Management

- [`GET /api/public/games/{gameId}/cards`](cards.md#list-cards) - Lister cartes par jeu et langue (public)
- [`POST /api/games/{gameId}/import`](cards.md#import-cards) - Importer cartes pour un jeu

### Deck Management

- [`GET /api/decks`](decks.md#user-decks) - Decks de l'utilisateur
- [`GET /api/decks/{id}`](decks.md#get-deck) - Détail d'un deck
- [`POST /api/decks`](decks.md#create-deck) - Créer nouveau deck
- [`PUT /api/decks/{id}`](decks.md#update-deck) - Modifier deck
- [`DELETE /api/decks/{id}`](decks.md#delete-deck) - Supprimer deck

## 🔄 Status Codes Standards

| Code    | Signification  | Usage                            |
| ------- | -------------- | -------------------------------- |
| **200** | OK             | Requête réussie                  |
| **201** | Created        | Ressource créée                  |
| **204** | No Content     | Suppression réussie              |
| **400** | Bad Request    | Données invalides                |
| **401** | Unauthorized   | Token manquant/invalide          |
| **403** | Forbidden      | Permissions insuffisantes        |
| **404** | Not Found      | Ressource introuvable            |
| **409** | Conflict       | Conflit (ex: email déjà utilisé) |
| **500** | Internal Error | Erreur serveur                   |

## 📝 Format des Réponses

### Réponse de Succès

```json
{
  "data": { ... },
  "message": "Operation successful",
  "timestamp": "2025-07-21T21:30:00Z"
}
```

### Réponse d'Erreur

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": [
      {
        "field": "email",
        "message": "Email is required"
      }
    ]
  },
  "timestamp": "2025-07-21T21:30:00Z"
}
```

## 🧪 Testing avec Swagger UI

En mode développement, accéder à la documentation interactive :

**URL :** `http://localhost:8080/swagger-ui.html`

Features :

- Interface graphique pour tester les endpoints
- Schémas des modèles de données
- Exemples de requêtes/réponses
- Test d'authentification JWT intégré

## 🔍 Exemples d'Usage

### Authentification Complète

```bash
# 1. Login
curl -X POST http://localhost:8080/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "password123"
  }'

# Response
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "id": 1,
    "email": "user@example.com",
    "name": "User Name"
  }
}

# 2. Utiliser le token
curl -X GET http://localhost:8080/api/games \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIs..."
```

### Lister Cartes par Jeu

```bash
# Récupérer les cartes françaises du jeu MageNoir
curl -X GET "http://localhost:8080/api/public/games/magenoir/cards?locale=fr"

# Response
[
  {
    "id": 1,
    "name": "Graine",
    "element": "VEGETAL",
    "language": "FRENCH",
    "imagePath": "fr/vegetal/Graine.png"
  }
]
```

## 🛡️ Sécurité API

### Authentification JWT

- Les endpoints `/auth/**` et `/api/public/**` sont accessibles sans authentification
- Tous les autres endpoints nécessitent un token JWT valide
- Token obtenu via `/auth/login` ou `/auth/register`
- Header requis : `Authorization: Bearer <token>`

### Validation Input

- Toutes les entrées sont validées côté serveur
- Protection contre injection SQL via JPA/Hibernate
- Messages d'erreur standardisés

### Headers de Sécurité

Les headers suivants peuvent être configurés :

```bash
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
```

## � Notes Techniques

### Format des Réponses

Les réponses suivent le format standard JSON :

- **Succès** : Données directes ou dans un objet wrapper
- **Erreur** : `{ "error": "message d'erreur" }`
- **Listes** : Arrays directs ou avec pagination

### Ressources Statiques

- **Images** : Servies via `/images/**` (configuration WebMvcConfigurer)
- **Swagger UI** : Disponible en développement à `/swagger-ui.html`

---

_Voir les sections détaillées pour chaque groupe d'endpoints_
