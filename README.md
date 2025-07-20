# Generic Deck Builder

[![CI/CD Pipeline](https://github.com/ccathala/GenericDeckBuilder/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/ccathala/GenericDeckBuilder/actions/workflows/ci-cd.yml)
[![codecov](https://codecov.io/gh/ccathala/GenericDeckBuilder/branch/main/graph/badge.svg)](https://codecov.io/gh/ccathala/GenericDeckBuilder)
[![Coverage](https://img.shields.io/codecov/c/github/ccathala/GenericDeckBuilder?logo=codecov)](https://codecov.io/gh/ccathala/GenericDeckBuilder)
[![Java](https://img.shields.io/badge/Java-17+-orange?logo=openjdk)](https://openjdk.org/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.3-brightgreen?logo=springboot)](https://spring.io/projects/spring-boot)
[![License](https://img.shields.io/github/license/ccathala/GenericDeckBuilder)](LICENSE)

Un constructeur de deck générique et extensible pour jeux de cartes, développé avec Spring Boot et React.

## � Application en Production

**URL principale :** https://mage-noir-deckbuilder.up.railway.app

### 🔍 Endpoints de Monitoring

- **Health Check :** https://mage-noir-deckbuilder.up.railway.app/actuator/health
- **Métriques :** https://mage-noir-deckbuilder.up.railway.app/actuator/metrics
- **Info Application :** https://mage-noir-deckbuilder.up.railway.app/actuator/info

### 📡 API Endpoints

- **Authentification :** `/auth/register`, `/auth/login`
- **Cartes :** `/api/public/{gameId}/cards`
- **API Privées :** `/api/**` (nécessite JWT)

### 🏗️ Architecture

- **Frontend :** React + Vite (SPA)
- **Backend :** Spring Boot 3.5.3 + PostgreSQL
- **Déploiement :** Railway (Docker multi-stage)
- **Base de données :** PostgreSQL (Railway)

## �📊 Métriques de qualité

- **Couverture de code** : Baseline 48% (Objectif: 80% progressif)
- **Tests unitaires** : 67 tests avec 100% de réussite  
- **Analyse statique** : Configuration JaCoCo avec seuils de qualité évolutifs
