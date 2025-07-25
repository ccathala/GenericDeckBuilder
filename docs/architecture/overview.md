# 🏗️ Architecture Overview - GenericDeckBuilder

## Vue d'Ensemble Système

GenericDeckBuilder est une application full-stack moderne construite avec une architecture séparée frontend/backend.

```
┌─────────────────────────────────────────────────────────────┐
│                    ARCHITECTURE GLOBALE                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────┐    HTTP/REST API    ┌─────────────────┐ │
│  │                 │ ◄─────────────────► │                 │ │
│  │   FRONTEND      │                     │    BACKEND      │ │
│  │   (React)       │     JSON/JWT        │  (Spring Boot)  │ │
│  │                 │ ◄─────────────────► │                 │ │
│  └─────────────────┘                     └─────────────────┘ │
│           │                                       │          │
│           │ Static Assets                         │          │
│           │ (Vite Build)                         │          │
│           │                                       │          │
│           ▼                                       ▼          │
│  ┌─────────────────┐                     ┌─────────────────┐ │
│  │   CDN/Images    │                     │   PostgreSQL    │ │
│  │  (MageNoir.com) │                     │   Database      │ │
│  └─────────────────┘                     └─────────────────┘ │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## 🎯 Composants Principaux

### Frontend (React + Vite)

- **Framework :** React 18 avec hooks
- **Build Tool :** Vite pour développement rapide
- **Routing :** React Router pour SPA
- **State Management :** Context API + useState
- **Styling :** CSS Modules + Composants custom
- **Internationalisation :** Support FR/EN intégré

### Backend (Spring Boot 3)

- **Framework :** Spring Boot 3.5.3 avec Java 17
- **Security :** Spring Security + JWT
- **Database :** Spring Data JPA + PostgreSQL
- **API :** REST avec validation automatique
- **Documentation :** OpenAPI 3.0 (Swagger)

### Base de Données

- **SGBD :** PostgreSQL 16+
- **ORM :** Hibernate via Spring Data JPA
- **Migrations :** Liquibase (si nécessaire)
- **Indexation :** Index sur critères de recherche

### Images & Assets

- **CDN :** Direct depuis MageNoir.com
- **Fallback :** Volume Railway persistant
- **Format :** PNG optimisé
- **Résolution :** Multi-résolution support

## 🔄 Flux de Données

### 1. Authentification

```
User Input → React Form → API /auth/login → JWT Token → LocalStorage
```

### 2. Gestion des Cartes

```
Game Selection → API /api/public/games/{gameId}/cards → PostgreSQL → JSON Response → React Components
```

### 3. Construction de Deck

```
Card Selection → React State → API /decks → Database → Persistence
```

### 4. Images

```
Image Request → CDN Service → MageNoir.com → Cached Response
```

## 🏛️ Patterns Architecturaux

### Backend - Layered Architecture

```
┌─────────────────────┐
│    Controllers      │  ← REST endpoints, validation
├─────────────────────┤
│     Services        │  ← Business logic, transactions
├─────────────────────┤
│   Repositories      │  ← Data access layer
├─────────────────────┤
│     Entities        │  ← JPA models, database mapping
└─────────────────────┘
```

### Frontend - Component-Based Architecture

```
┌─────────────────────┐
│      Pages          │  ← Route components, layouts
├─────────────────────┤
│   Smart Components  │  ← State management, API calls
├─────────────────────┤
│   Dumb Components   │  ← UI only, props-driven
├─────────────────────┤
│     Services        │  ← API clients, utilities
└─────────────────────┘
```

## 🚀 Déploiement Railway

### Production Stack

- **Platform :** Railway.app
- **Container :** Spring Boot JAR + embedded Tomcat
- **Database :** Railway PostgreSQL
- **Static Files :** Servies par Spring Boot
- **Domain :** Custom domain avec SSL/TLS

### CI/CD Pipeline

```
GitHub Push → Railway Webhook → Docker Build → Deploy → Health Check
```

## 📊 Performance & Scalabilité

### Optimisations Actuelles

- **CDN Images :** Réduction bande passante
- **JPA Lazy Loading :** Requêtes optimisées
- **Frontend Code Splitting :** Chunks Vite
- **Database Indexing :** Index sur colonnes recherchées

### Métriques Clés

- **Time to First Byte :** < 200ms
- **Image Loading :** CDN cached responses
- **API Response Time :** < 100ms (queries simples)
- **Database Connections :** Pool HikariCP

## 🔐 Sécurité

### Authentification & Autorisation

- **JWT Tokens :** Stateless authentication
- **CORS Configuration :** Origines contrôlées
- **CSRF Protection :** Token-based
- **Role-Based Access :** Admin/User roles

### Données Sensibles

- **Password Hashing :** BCrypt
- **Database Credentials :** Variables d'environnement
- **API Keys :** Railway secrets management

## 📈 Monitoring & Observabilité

### Logs

- **Application Logs :** SLF4J + Logback
- **Access Logs :** Spring Boot actuator
- **Error Tracking :** Console + Railway logs

### Health Checks

- **Spring Actuator :** `/actuator/health`
- **Database Health :** Connection pool monitoring
- **Custom Endpoints :** Business logic validation

---

_Voir les documents détaillés pour chaque composant dans leurs sections respectives._
