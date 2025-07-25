# 🔐 Authentication API

Documentation des endpoints d'authentification.

## Base URLs

- **Development:** `http://localhost:8080`
- **Production:** `https://your-app.railway.app`

---

## POST /auth/register

Inscription d'un nouvel utilisateur.

### Request

```http
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "name": "John Doe"
}
```

### Parameters

| Field    | Type   | Required | Description               |
| -------- | ------ | -------- | ------------------------- |
| email    | string | ✅       | Email unique utilisateur  |
| password | string | ✅       | Mot de passe (min 6 char) |
| name     | string | ❌       | Nom d'affichage           |

### Response Success (200)

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": 1,
    "email": "user@example.com",
    "name": "John Doe"
  }
}
```

### Response Error (400)

```json
{
  "error": "Email déjà utilisé"
}
```

### Curl Example

```bash
curl -X POST http://localhost:8080/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "newuser@example.com",
    "password": "mypassword123",
    "name": "New User"
  }'
```

---

## POST /auth/login

Connexion d'un utilisateur existant.

### Request

```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

### Parameters

| Field    | Type   | Required | Description       |
| -------- | ------ | -------- | ----------------- |
| email    | string | ✅       | Email utilisateur |
| password | string | ✅       | Mot de passe      |

### Response Success (200)

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": 1,
    "email": "user@example.com",
    "name": "John Doe"
  }
}
```

### Response Error (401)

```json
{
  "error": "Identifiants incorrects"
}
```

### Response Error (400)

```json
{
  "error": "Utilisateur non trouvé"
}
```

### Curl Example

```bash
curl -X POST http://localhost:8080/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "password123"
  }'
```

---

## JWT Token Usage

Une fois connecté, utilisez le token JWT pour accéder aux endpoints protégés :

### Header Format

```http
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### JavaScript Example

```javascript
// Stocker le token après login
const loginResponse = await fetch("/auth/login", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ email, password }),
});
const { token } = await loginResponse.json();
localStorage.setItem("jwt_token", token);

// Utiliser le token pour les requêtes protégées
const protectedResponse = await fetch("/api/decks", {
  headers: {
    Authorization: `Bearer ${localStorage.getItem("jwt_token")}`,
  },
});
```

---

## Error Handling

### Common Error Codes

| Status | Code           | Description                  |
| ------ | -------------- | ---------------------------- |
| 400    | Bad Request    | Données manquantes/invalides |
| 401    | Unauthorized   | Token manquant/invalide      |
| 409    | Conflict       | Email déjà utilisé           |
| 500    | Internal Error | Erreur serveur               |

### Error Response Format

```json
{
  "error": "Description de l'erreur"
}
```

---

## Security Notes

- **Passwords** : Encodés avec BCrypt côté serveur
- **JWT Tokens** : Signés avec clé secrète, contiennent ID utilisateur
- **Token Expiry** : Configuré côté serveur (vérifier `JwtService`)
- **HTTPS** : Recommandé en production pour protéger les tokens

---

_Retour à [l'index API](README.md)_
