# 🚀 Guide de Déploiement - GenericDeckBuilder

## 📋 Prérequis

- ✅ **Java 17+** installé
- ✅ **Node.js 18+** installé  
- ✅ **Docker** installé (optionnel)
- ✅ **Git** configuré
- ✅ **Compte** sur la plateforme de déploiement (Railway/Heroku)

## 🔧 Configuration des Variables d'Environnement

### Variables obligatoires :

```env
# Base de données
DATABASE_URL=postgresql://user:password@host:port/database

# Sécurité JWT
JWT_SECRET=your-super-secure-secret-key-at-least-256-bits

# Profil Spring
SPRING_PROFILES_ACTIVE=prod

# Port (défini automatiquement par la plateforme)
PORT=8080
```

### Variables optionnelles :

```env
# CORS
CORS_ALLOWED_ORIGINS=https://your-domain.com

# Logging
LOGGING_LEVEL_ROOT=INFO
```

## 🚀 Déploiement sur Railway

### 1. Préparation

```bash
# Cloner et accéder au projet
git clone https://github.com/ccathala/GenericDeckBuilder.git
cd GenericDeckBuilder

# S'assurer d'être sur main pour la production
git checkout main
```

### 2. Configuration Railway

1. **Créer un compte** sur [Railway.app](https://railway.app)
2. **Connecter le repository** GitHub
3. **Créer un service PostgreSQL** :
   - Add Service → Database → PostgreSQL
   - Noter l'URL de connexion générée

4. **Déployer l'application** :
   - Add Service → GitHub Repo → GenericDeckBuilder
   - Railway détectera automatiquement le Dockerfile

### 3. Variables d'environnement Railway

Dans l'interface Railway, ajouter :

```env
DATABASE_URL=${{Postgres.DATABASE_URL}}
JWT_SECRET=your-generated-secure-key-here
SPRING_PROFILES_ACTIVE=prod
```

### 4. Domaine personnalisé (optionnel)

- Settings → Domains → Generate Domain
- Ou connecter votre propre domaine

### 4. URLs de Production Railway

Une fois déployé, votre application sera accessible via :

**URL principale :** https://mage-noir-deckbuilder.up.railway.app

**Endpoints de monitoring :**
- **Health Check :** https://mage-noir-deckbuilder.up.railway.app/actuator/health
- **Métriques :** https://mage-noir-deckbuilder.up.railway.app/actuator/metrics
- **Info Application :** https://mage-noir-deckbuilder.up.railway.app/actuator/info

**API Endpoints :**
- **Authentification :** `/auth/register`, `/auth/login`
- **Cartes publiques :** `/api/public/{gameId}/cards`
- **APIs privées :** `/api/**` (JWT requis)

## 📦 Déploiement sur Heroku

### 1. Installation Heroku CLI

```bash
# Installation (selon votre OS)
# Windows: choco install heroku-cli
# macOS: brew install heroku/brew/heroku
# Linux: curl https://cli-assets.heroku.com/install.sh | sh
```

### 2. Déploiement

```bash
# Login Heroku
heroku login

# Créer l'application
heroku create your-app-name

# Ajouter PostgreSQL
heroku addons:create heroku-postgresql:mini

# Configurer les variables
heroku config:set SPRING_PROFILES_ACTIVE=prod
heroku config:set JWT_SECRET="your-secure-key-here"

# Déployer
git push heroku main
```

## 🐳 Test Local avec Docker

### 1. Test de production localement

```bash
# Build et lancement
docker-compose -f docker-compose.prod.yml up --build

# Vérification
curl http://localhost:8080/actuator/health
```

### 2. Accès à l'application

- **API** : http://localhost:8080/api
- **Frontend** : http://localhost:8080/
- **Health Check** : http://localhost:8080/actuator/health
- **Métriques** : http://localhost:8080/actuator/metrics

## 🧪 Tests Avant Déploiement

### Script automatisé

```bash
# Utiliser le script fourni
./deploy.sh production
```

### Tests manuels

```bash
# Backend
cd backend && mvn clean test

# Frontend  
cd frontend && npm run lint && npm run build

# Docker
docker build -t deckbuilder-test .
```

## 📊 Monitoring Post-Déploiement

### Endpoints de surveillance

- **Health** : `/actuator/health`
- **Métriques** : `/actuator/metrics` 
- **Info** : `/actuator/info`

### Logs

```bash
# Railway
railway logs

# Heroku
heroku logs --tail

# Docker local
docker logs deckbuilder-app
```

## 🔧 Maintenance

### Mise à jour de l'application

1. **Développement** sur branche `dev`
2. **Tests** avec le CI/CD
3. **Merge** vers `main`
4. **Déploiement automatique** via CI/CD

### Sauvegarde base de données

```bash
# Heroku
heroku pg:backups:capture
heroku pg:backups:download

# Railway (via interface web)
```

## 🆘 Dépannage

### Problèmes courants

1. **Port déjà utilisé** : Vérifier la variable PORT
2. **Base de données inaccessible** : Vérifier DATABASE_URL
3. **JWT invalide** : Vérifier JWT_SECRET (256+ bits)
4. **CORS errors** : Configurer CORS_ALLOWED_ORIGINS

### Logs d'erreur

```bash
# Vérifier les logs de l'application
tail -f logs/application.log

# Ou via la plateforme
railway logs
heroku logs --tail
```

## 📞 Support

- **Issues GitHub** : [Issues](https://github.com/ccathala/GenericDeckBuilder/issues)
- **Documentation** : [Wiki](https://github.com/ccathala/GenericDeckBuilder/wiki)
- **CI/CD Status** : [Actions](https://github.com/ccathala/GenericDeckBuilder/actions)

---

## ✅ Checklist de Déploiement

- [ ] Tests backend passent
- [ ] Build frontend réussi  
- [ ] Variables d'environnement configurées
- [ ] Base de données provisionnée
- [ ] Domaine configuré (optionnel)
- [ ] Monitoring configuré
- [ ] Sauvegarde planifiée

**🎉 Votre application est prête pour la production !**
