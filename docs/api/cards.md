# 🃏 Cards API

Documentation des endpoints de gestion des cartes.

---

## GET /api/public/games/{gameId}/cards

**🌍 Endpoint Public** - Aucune authentification requise

Récupère toutes les cartes localisées pour un jeu donné.

### Request

```http
GET /api/public/games/magenoir/cards?locale=fr
```

### Parameters

| Parameter | Type   | Required | Default | Description       |
| --------- | ------ | -------- | ------- | ----------------- |
| gameId    | string | ✅       | -       | ID du jeu         |
| locale    | string | ❌       | `fr`    | Langue des cartes |

### Supported Locales

- `fr` - Français
- `en` - Anglais

### Response Success (200)

```json
[
  {
    "id": "seed",
    "name": "Graine",
    "description": "Une graine qui peut pousser rapidement",
    "imageUrl": "fr/vegetal/Graine.png",
    "properties": {
      "element": "VEGETAL",
      "cost": 2,
      "attack": 1,
      "defense": 1
    }
  },
  {
    "id": "flame",
    "name": "Flamme",
    "description": "Une flamme brûlante et destructrice",
    "imageUrl": "fr/feu/Flamme.png",
    "properties": {
      "element": "FEU",
      "cost": 3,
      "attack": 2,
      "defense": 0
    }
  }
]
```

### Response Error (404)

```json
{
  "error": "Jeu non trouvé"
}
```

### Curl Example

```bash
# Récupérer les cartes françaises
curl -X GET "http://localhost:8080/api/public/games/magenoir/cards?locale=fr"

# Récupérer les cartes anglaises
curl -X GET "http://localhost:8080/api/public/games/magenoir/cards?locale=en"
```

---

## POST /api/games/{gameId}/import

**🔒 Authentication requise**

Importe un bloc de cartes avec plusieurs localisations pour un jeu.

### Request

```http
POST /api/games/magenoir/import
Authorization: Bearer <jwt-token>
Content-Type: application/json

[
  {
    "baseId": "seed",
    "element": "VEGETAL",
    "localizations": {
      "fr": {
        "name": "Graine",
        "imagePath": "fr/vegetal/Graine.png"
      },
      "en": {
        "name": "Seed",
        "imagePath": "en/vegetal/Seed.png"
      }
    }
  }
]
```

### Request Body Schema

```typescript
interface CardImport {
  baseId: string; // ID de base de la carte
  element: string; // Élément de la carte
  localizations: {
    [locale: string]: {
      name: string; // Nom localisé
      imagePath: string; // Chemin de l'image
    };
  };
}
```

### Response Success (200)

```json
"Cartes importées avec succès."
```

### Response Error (400)

```json
{
  "error": "Données d'import invalides"
}
```

### Curl Example

```bash
curl -X POST http://localhost:8080/api/games/magenoir/import \
  -H "Authorization: Bearer <your-jwt-token>" \
  -H "Content-Type: application/json" \
  -d '[
    {
      "baseId": "flame",
      "element": "FEU",
      "localizations": {
        "fr": {
          "name": "Flamme",
          "imagePath": "fr/feu/Flamme.png"
        },
        "en": {
          "name": "Flame",
          "imagePath": "en/fire/Flame.png"
        }
      }
    }
  ]'
```

---

## Models

### CardResponseDTO

```typescript
interface CardResponseDTO {
  id: string; // ID unique de la carte (ex: "seed", "flame")
  name: string; // Nom localisé de la carte
  description: string; // Description localisée
  imageUrl: string; // URL/chemin de l'image
  properties: {
    // Propriétés dynamiques de la carte
    element?: string; // Élément (VEGETAL, FEU, EAU, etc.)
    cost?: number; // Coût de la carte
    attack?: number; // Points d'attaque
    defense?: number; // Points de défense
    [key: string]: any; // Autres propriétés spécifiques au jeu
  };
}
```

### Éléments Supportés

Les éléments suivants sont supportés dans MageNoir :

- `VEGETAL` - Végétal
- `FEU` - Feu
- `EAU` - Eau
- `AIR` - Air
- `MINERAL` - Minéral
- `ARCANE` - Arcane

---

## Images Management

Les chemins d'images retournés dans `imageUrl` peuvent être utilisés avec :

### Option 1: Static Resource Handler

```javascript
const imageUrl = `/images/${card.imageUrl}`;
// Résultat: /images/fr/vegetal/Graine.png
```

### Option 2: CDN Direct (si configuré)

```javascript
const imageUrl = `https://magenoir.com/cards/${card.imageUrl}`;
```

---

## JavaScript Integration

### Fetch Cards by Game and Locale

```javascript
const fetchCards = async (gameId, locale = "fr") => {
  const response = await fetch(
    `/api/public/games/${gameId}/cards?locale=${locale}`
  );

  if (!response.ok) {
    throw new Error(`Failed to fetch cards: ${response.status}`);
  }

  return response.json();
};

// Usage
const frenchCards = await fetchCards("magenoir", "fr");
const englishCards = await fetchCards("magenoir", "en");

// Accéder aux propriétés d'une carte
frenchCards.forEach((card) => {
  console.log(`${card.name}: ${card.description}`);
  console.log(`Élément: ${card.properties.element || "N/A"}`);
  console.log(`Coût: ${card.properties.cost || 0}`);
});
```

### Import Cards (Admin)

```javascript
const importCards = async (gameId, cardsData) => {
  const token = localStorage.getItem("jwt_token");

  const response = await fetch(`/api/games/${gameId}/import`, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(cardsData),
  });

  return response.text(); // Retourne message de succès
};
```

---

## Example Integrations

### React Component

```jsx
import React, { useState, useEffect } from "react";

const CardsList = ({ gameId, locale }) => {
  const [cards, setCards] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadCards = async () => {
      try {
        const fetchedCards = await fetchCards(gameId, locale);
        setCards(fetchedCards);
      } catch (error) {
        console.error("Error loading cards:", error);
      } finally {
        setLoading(false);
      }
    };

    loadCards();
  }, [gameId, locale]);

  if (loading) return <div>Chargement...</div>;

  return (
    <div className="cards-grid">
      {cards.map((card) => (
        <div key={card.id} className="card">
          <img src={`/images/${card.imageUrl}`} alt={card.name} />
          <h3>{card.name}</h3>
          <p className="description">{card.description}</p>
          <div className="properties">
            <span className="element">{card.properties.element || "N/A"}</span>
            <span className="cost">Coût: {card.properties.cost || 0}</span>
          </div>
        </div>
      ))}
    </div>
  );
};
```

---

_Retour à [l'index API](README.md)_
