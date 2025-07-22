# 🎮 Games API

Documentation des endpoints de gestion des jeux.

**Base Path:** `/api/games`  
**Authentication:** JWT Token requis sauf mention contraire

---

## GET /api/games

Lister tous les jeux disponibles.

### Request

```http
GET /api/games
Authorization: Bearer <jwt-token>
```

### Response Success (200)

```json
[
  {
    "id": "magenoir",
    "name": "Mage Noir",
    "description": "Un jeu de cartes magique",
    "createdAt": "2025-01-01T00:00:00Z"
  },
  {
    "id": "othergame",
    "name": "Other Game",
    "description": "Another card game",
    "createdAt": "2025-01-02T00:00:00Z"
  }
]
```

### Curl Example

```bash
curl -X GET http://localhost:8080/api/games \
  -H "Authorization: Bearer <your-jwt-token>"
```

---

## GET /api/games/{id}

Récupérer les détails d'un jeu spécifique.

### Request

```http
GET /api/games/magenoir
Authorization: Bearer <jwt-token>
```

### Response Success (200)

```json
{
  "id": "magenoir",
  "name": "Mage Noir",
  "description": "Un jeu de cartes magique avec des éléments",
  "createdAt": "2025-01-01T00:00:00Z"
}
```

### Response Error (404)

```json
{
  "error": "Jeu non trouvé"
}
```

---

## POST /api/games

Créer un nouveau jeu.

### Request

```http
POST /api/games
Authorization: Bearer <jwt-token>
Content-Type: application/json

{
  "id": "newgame",
  "name": "New Game",
  "description": "Description du nouveau jeu"
}
```

### Parameters

| Field       | Type   | Required | Description               |
| ----------- | ------ | -------- | ------------------------- |
| id          | string | ✅       | Identifiant unique du jeu |
| name        | string | ✅       | Nom d'affichage           |
| description | string | ❌       | Description du jeu        |

### Response Success (200)

```json
{
  "id": "newgame",
  "name": "New Game",
  "description": "Description du nouveau jeu",
  "createdAt": "2025-07-22T12:00:00Z"
}
```

---

## PUT /api/games/{id}

Modifier un jeu existant.

### Request

```http
PUT /api/games/magenoir
Authorization: Bearer <jwt-token>
Content-Type: application/json

{
  "name": "Mage Noir - Édition Révisée",
  "description": "Version mise à jour du jeu"
}
```

### Response Success (200)

```json
{
  "id": "magenoir",
  "name": "Mage Noir - Édition Révisée",
  "description": "Version mise à jour du jeu",
  "createdAt": "2025-01-01T00:00:00Z"
}
```

---

## DELETE /api/games/{id}

Supprimer un jeu.

### Request

```http
DELETE /api/games/oldgame
Authorization: Bearer <jwt-token>
```

### Response Success (204)

```
No Content
```

### Response Error (404)

```json
{
  "error": "Jeu non trouvé"
}
```

---

## GET /api/games/{id}/ruleset

Récupérer le ruleset (règles de deck) d'un jeu.

### Request

```http
GET /api/games/magenoir/ruleset
Authorization: Bearer <jwt-token>
```

### Response Success (200)

```json
{
  "id": 1,
  "gameId": "magenoir",
  "minDeckSize": 40,
  "maxDeckSize": 60,
  "maxCopiesPerCard": 3,
  "rules": [
    "Au moins 40 cartes dans un deck",
    "Maximum 3 copies d'une même carte"
  ]
}
```

### Response Error (404)

```json
{
  "error": "Ruleset non trouvé pour ce jeu"
}
```

---

## Models

### Game Model

```typescript
interface Game {
  id: string; // Identifiant unique
  name: string; // Nom d'affichage
  description?: string; // Description optionnelle
  createdAt: string; // Date de création (ISO 8601)
}
```

### DeckRuleset Model

```typescript
interface DeckRuleset {
  id: number;
  gameId: string;
  minDeckSize: number;
  maxDeckSize: number;
  maxCopiesPerCard: number;
  rules: string[];
}
```

---

## JavaScript Integration

### Fetch all games

```javascript
const fetchGames = async () => {
  const token = localStorage.getItem("jwt_token");
  const response = await fetch("/api/games", {
    headers: { Authorization: `Bearer ${token}` },
  });

  if (!response.ok) {
    throw new Error("Failed to fetch games");
  }

  return response.json();
};
```

### Create new game

```javascript
const createGame = async (gameData) => {
  const token = localStorage.getItem("jwt_token");
  const response = await fetch("/api/games", {
    method: "POST",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(gameData),
  });

  return response.json();
};
```

---

_Retour à [l'index API](README.md)_
