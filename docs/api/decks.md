# 🎴 Decks API

Documentation des endpoints de gestion des decks utilisateur.

**Base Path:** `/api/decks`  
**Authentication:** JWT Token requis pour tous les endpoints

---

## GET /api/decks

Récupère tous les decks de l'utilisateur connecté.

### Request

```http
GET /api/decks
Authorization: Bearer <jwt-token>
```

### Response Success (200)

```json
[
  {
    "id": "550e8400-e29b-41d4-a716-446655440001",
    "name": "Deck Végétal"
  },
  {
    "id": "550e8400-e29b-41d4-a716-446655440002",
    "name": "Deck Feu"
  }
]
```

### Curl Example

```bash
curl -X GET http://localhost:8080/api/decks \
  -H "Authorization: Bearer <your-jwt-token>"
```

---

## GET /api/decks/{id}

Récupère les détails complets d'un deck spécifique.

### Request

```http
GET /api/decks/550e8400-e29b-41d4-a716-446655440001
Authorization: Bearer <jwt-token>
```

### Response Success (200)

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440001",
  "name": "Deck Végétal",
  "description": "Un deck axé sur les cartes végétales",
  "gameId": "magenoir",
  "cards": [
    {
      "cardId": "seed",
      "quantity": 3
    },
    {
      "cardId": "tree_animated",
      "quantity": 2
    }
  ]
}
```

### Response Error (404)

```json
{
  "error": "Deck non trouvé"
}
```

### Response Error (403)

```json
{
  "error": "Accès non autorisé à ce deck"
}
```

---

## POST /api/decks

Crée un nouveau deck.

### Request

```http
POST /api/decks
Authorization: Bearer <jwt-token>
Content-Type: application/json

{
  "name": "Nouveau Deck",
  "description": "Description de mon nouveau deck",
  "gameId": "magenoir",
  "cards": [
    {
      "cardId": "seed",
      "quantity": 3
    },
    {
      "cardId": "flame",
      "quantity": 2
    }
  ]
}
```

### Request Body Schema

```typescript
interface DeckRequestDTO {
  name: string; // Nom du deck
  description?: string; // Description optionnelle
  gameId: string; // ID du jeu
  cards: DeckCardDTO[]; // Liste des cartes
}

interface DeckCardDTO {
  cardId: string; // ID de la carte (ex: "seed", "flame")
  quantity: number; // Quantité (1-3 généralement)
}
```

### Response Success (200)

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440003",
  "name": "Nouveau Deck",
  "description": "Description de mon nouveau deck",
  "gameId": "magenoir",
  "cards": [
    {
      "cardId": "seed",
      "quantity": 3
    }
  ]
}
```

---

## PUT /api/decks/{id}

Met à jour un deck existant.

### Request

```http
PUT /api/decks/550e8400-e29b-41d4-a716-446655440001
Authorization: Bearer <jwt-token>
Content-Type: application/json

{
  "name": "Deck Végétal Amélioré",
  "description": "Version optimisée de mon deck végétal",
  "gameId": "magenoir",
  "cards": [
    {
      "cardId": "seed",
      "quantity": 2
    },
    {
      "cardId": "oak_tree",
      "quantity": 3
    }
  ]
}
```

### Response Success (200)

Même format que la création (POST).

### Response Error (404)

```json
{
  "error": "Deck non trouvé"
}
```

---

## DELETE /api/decks/{id}

Supprime un deck.

### Request

```http
DELETE /api/decks/550e8400-e29b-41d4-a716-446655440001
Authorization: Bearer <jwt-token>
```

### Response Success (200)

```json
{
  "message": "Deck supprimé avec succès"
}
```

### Response Error (404)

```json
{
  "error": "Deck non trouvé"
}
```

---

## Models

### DeckSummaryResponseDTO (Liste)

```typescript
interface DeckSummaryResponseDTO {
  id: string; // UUID du deck
  name: string; // Nom du deck
}
```

### DeckResponseDTO (Détails)

```typescript
interface DeckResponseDTO {
  id: string; // UUID du deck
  name: string; // Nom du deck
  description: string; // Description du deck
  gameId: string; // ID du jeu
  cards: DeckCardResponseDTO[]; // Liste des cartes
}

interface DeckCardResponseDTO {
  cardId: string; // ID de la carte (ex: "seed", "flame")
  quantity: number; // Quantité de cette carte dans le deck
}
```

---

## JavaScript Integration

### Fetch User Decks

```javascript
const fetchUserDecks = async () => {
  const token = localStorage.getItem("jwt_token");

  const response = await fetch("/api/decks", {
    headers: { Authorization: `Bearer ${token}` },
  });

  if (!response.ok) {
    throw new Error("Failed to fetch decks");
  }

  return response.json();
};
```

### Create New Deck

```javascript
const createDeck = async (deckData) => {
  const token = localStorage.getItem("jwt_token");

  const response = await fetch("/api/decks", {
    method: "POST",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(deckData),
  });

  return response.json();
};

// Usage
const newDeck = await createDeck({
  name: "Mon Deck Test",
  description: "Deck pour tester l'API",
  gameId: "magenoir",
  cards: [
    { cardId: "seed", quantity: 3 },
    { cardId: "flame", quantity: 2 },
  ],
});
```

### Update Deck

```javascript
const updateDeck = async (deckId, deckData) => {
  const token = localStorage.getItem("jwt_token");

  const response = await fetch(`/api/decks/${deckId}`, {
    method: "PUT",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(deckData),
  });

  return response.json();
};
```

### Delete Deck

```javascript
const deleteDeck = async (deckId) => {
  const token = localStorage.getItem("jwt_token");

  const response = await fetch(`/api/decks/${deckId}`, {
    method: "DELETE",
    headers: { Authorization: `Bearer ${token}` },
  });

  return response.json();
};
```

---

## React Example

```jsx
import React, { useState, useEffect } from "react";

const DeckManager = () => {
  const [decks, setDecks] = useState([]);
  const [selectedDeck, setSelectedDeck] = useState(null);

  useEffect(() => {
    const loadDecks = async () => {
      try {
        const userDecks = await fetchUserDecks();
        setDecks(userDecks);
      } catch (error) {
        console.error("Error loading decks:", error);
      }
    };

    loadDecks();
  }, []);

  const handleDeckSelect = async (deckId) => {
    try {
      const token = localStorage.getItem("jwt_token");
      const response = await fetch(`/api/decks/${deckId}`, {
        headers: { Authorization: `Bearer ${token}` },
      });

      const deckDetails = await response.json();
      setSelectedDeck(deckDetails);
    } catch (error) {
      console.error("Error loading deck details:", error);
    }
  };

  return (
    <div className="deck-manager">
      <div className="decks-list">
        <h2>Mes Decks</h2>
        {decks.map((deck) => (
          <div
            key={deck.id}
            className="deck-item"
            onClick={() => handleDeckSelect(deck.id)}
          >
            <h3>{deck.name}</h3>
          </div>
        ))}
      </div>

      {selectedDeck && (
        <div className="deck-details">
          <h2>{selectedDeck.name}</h2>
          <p>{selectedDeck.description}</p>

          <div className="cards-list">
            {selectedDeck.cards.map((deckCard) => (
              <div key={deckCard.cardId} className="deck-card">
                <span className="quantity">{deckCard.quantity}x</span>
                <span className="card-id">{deckCard.cardId}</span>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
};
```

---

## Business Rules

### Validation Rules

- **Nom** : Obligatoire, max 100 caractères
- **Description** : Optionnelle, max 500 caractères
- **Cards** : Quantité entre 1-3 par carte (selon les règles du jeu)
- **Ownership** : Un utilisateur ne peut modifier que ses propres decks

### Game Rules (MageNoir)

- Minimum 40 cartes par deck
- Maximum 60 cartes par deck
- Maximum 3 copies d'une même carte

_Ces règles peuvent varier selon le jeu configuré._

---

_Retour à [l'index API](README.md)_
