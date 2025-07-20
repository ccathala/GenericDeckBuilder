# 🚀 Guide de Déploiement Railway - GenericDeckBuilder

## 🎯 **Étape 1 : Créer un compte Railway**

1. **Aller sur** [Railway.app](https://railway.app)
2. **Se connecter avec GitHub** (recommandé pour l'intégration)
3. **Autoriser Railway** à accéder à vos repositories
4. **Vérifier l'email** si nécessaire

## 📁 **Étape 2 : Connecter le Repository**

1. **Dans Railway Dashboard** :
   - Click "**New Project**"
   - Sélectionner "**Deploy from GitHub repo**"
   - Choisir le repository "**ccathala/GenericDeckBuilder**"
   - Sélectionner la branche "**main**"

2. **Railway va détecter** :
   - ✅ **Dockerfile** (déploiement automatique)
   - ✅ **Structure du projet** (Spring Boot + React)

## 🗄️ **Étape 3 : Ajouter PostgreSQL**

1. **Dans le même projet** :
   - Click "**+ New**"
   - Sélectionner "**Database**"
   - Choisir "**PostgreSQL**"

2. **Railway va créer** :
   - ✅ **Base PostgreSQL** prête à l'emploi
   - ✅ **Variables d'environnement** automatiques
   - ✅ **URL de connexion** générée

## ⚙️ **Étape 4 : Configurer les Variables d'Environnement**

### Dans le service **GenericDeckBuilder** (pas la DB) :

1. **Onglet "Variables"** :
   - Click "**+ New Variable**"

2. **Ajouter ces variables** :

```env
# Base de données (Railway la génère automatiquement)
DATABASE_URL=${{Postgres.DATABASE_URL}}

# JWT Secret (IMPORTANT : Générez une clé sécurisée)
JWT_SECRET=super-secure-jwt-secret-key-for-production-at-least-256-bits-long

# Profil Spring Boot
SPRING_PROFILES_ACTIVE=prod

# Port (Railway détecte automatiquement le port 8080)
# PORT=8080  # <- OPTIONNEL : Railway détecte automatiquement
```

### 🔐 **Génération JWT_SECRET Sécurisé** :
```bash
# Dans un terminal, générez une clé sécurisée :
openssl rand -base64 64

# Ou utilisez cette clé temporaire :
JWT_SECRET=YourSuperSecureJWTSecretKeyForProductionShouldBeAtLeast256BitsLongAndRandomlyGenerated2024
```

## 🚀 **Étape 5 : Déploiement**

1. **Après configuration des variables** :
   - Railway déclenchera automatiquement un **nouveau déploiement**
   - Suivez les logs dans l'onglet "**Deployments**"

2. **Processus de déploiement** :
   ```bash
   ✅ Building frontend (React + Vite)
   ✅ Building backend (Spring Boot + Maven)
   ✅ Creating Docker image
   ✅ Deploying to Railway
   ✅ Health checks passed
   ```

3. **Temps estimé** : 5-8 minutes

## 🌐 **Étape 6 : Accéder à l'Application**

1. **Dans Railway Dashboard** :
   - Service "**GenericDeckBuilder**"
   - Onglet "**Settings**"
   - Section "**Domains**"
   - Click "**Generate Domain**"

2. **Vous obtiendrez** :
   - 🌐 **URL publique** : `https://your-app-name.railway.app`
   - 🔒 **HTTPS automatique** (SSL inclus)

3. **Endpoints disponibles** :
   ```
   Frontend:     https://your-app-name.railway.app/
   API Backend:  https://your-app-name.railway.app/api/
   Health:       https://your-app-name.railway.app/api/actuator/health
   ```

## ✅ **Étape 7 : Vérification**

### **Tests de Fonctionnement** :

1. **Health Check** :
   ```bash
   curl https://your-app-name.railway.app/api/actuator/health
   
   # Réponse attendue :
   {"status":"UP"}
   ```

2. **Test Frontend** :
   - Ouvrez `https://your-app-name.railway.app/`
   - Vérifiez que l'interface React se charge

3. **Test API** :
   ```bash
   curl https://your-app-name.railway.app/api/actuator/info
   ```

### **Tests de Base de Données** :
1. **Dans Railway Dashboard** :
   - Service **PostgreSQL**
   - Onglet "**Data**"
   - Vérifiez que les tables sont créées (Flyway)

## 📊 **Étape 8 : Monitoring**

### **Dashboard Railway** :
1. **Métriques** : CPU, RAM, Requêtes/sec
2. **Logs** : Logs applicatifs en temps réel
3. **Usage** : Consommation du crédit $5

### **URLs de Monitoring** :
```
Health:    /api/actuator/health
Metrics:   /api/actuator/metrics  
Info:      /api/actuator/info
```

## 💡 **Optimisations Post-Déploiement**

### **1. Configuration Frontend** :
```env
# Mettre à jour frontend/.env.production avec la vraie URL
VITE_API_BASE_URL=https://your-app-name.railway.app/api
```

### **2. CORS Configuration** :
```env
# Dans Railway, ajouter :
CORS_ALLOWED_ORIGINS=https://your-app-name.railway.app
```

### **3. Redéployment** :
- Chaque push vers `main` déclenche un redéployment automatique
- Ou redéployer manuellement dans Railway

## 🆘 **Dépannage**

### **Problèmes courants** :

1. **Application ne démarre pas** :
   - Vérifiez les logs Railway
   - Contrôlez `DATABASE_URL` et `JWT_SECRET`

2. **Base de données inaccessible** :
   - Vérifiez que PostgreSQL est "UP"
   - Contrôlez la variable `${{Postgres.DATABASE_URL}}`

3. **Frontend ne charge pas** :
   - Vérifiez que le build Vite a réussi
   - Contrôlez les ressources statiques

### **Commandes de debug** :
```bash
# Logs en temps réel
railway logs

# Restart service
railway up --detach
```

## 🎉 **Félicitations !**

**GenericDeckBuilder est maintenant déployé en production sur Railway !** 

### **Ce que vous avez maintenant** :
- ✅ **Application Full-Stack** en production
- ✅ **Base PostgreSQL** managée
- ✅ **SSL/HTTPS** automatique
- ✅ **CI/CD** depuis GitHub
- ✅ **Monitoring** intégré
- ✅ **Domaine public** accessible

### **Prochaines étapes** :
1. **Tester** toutes les fonctionnalités
2. **Partager l'URL** avec les utilisateurs
3. **Monitor** l'usage du crédit $5
4. **Optimiser** les performances si nécessaire

---

## 📞 **Support**

Si vous rencontrez des problèmes :
1. **Logs Railway** : Dashboard > Service > Logs
2. **Documentation** : [docs.railway.app](https://docs.railway.app)
3. **Community** : [Railway Discord](https://discord.gg/railway)
