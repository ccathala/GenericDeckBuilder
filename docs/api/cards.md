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
    "id": 1,
    "name": "Graine",
    "element": "VEGETAL",
    "language": "FRENCH",
    "imagePath": "fr/vegetal/Graine.png"
  },
  {
    "id": 2,
    "name": "Flamme",
    "element": "FEU",
    "language": "FRENCH",
    "imagePath": "fr/feu/Flamme.png"
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
  id: number; // ID unique de la carte
  name: string; // Nom localisé
  element: string; // Élément (VEGETAL, FEU, EAU, etc.)
  language: string; // Langue (FRENCH, ENGLISH)
  imagePath: string; // Chemin relatif de l'image
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

Les chemins d'images retournés sont relatifs et peuvent être utilisés avec :

### Option 1: Static Resource Handler

```javascript
const imageUrl = `/images/${card.imagePath}`;
// Résultat: /images/fr/vegetal/Graine.png
```

### Option 2: CDN Direct (si configuré)

```javascript
const imageUrl = `https://magenoir.com/cards/FR/Vegetal/${card.name}.png`;
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
          <img src={`/images/${card.imagePath}`} alt={card.name} />
          <h3>{card.name}</h3>
          <span className="element">{card.element}</span>
        </div>
      ))}
    </div>
  );
};
```

---

_Retour à [l'index API](README.md)_
