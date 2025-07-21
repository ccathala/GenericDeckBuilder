# 🚨 Configuration Conflicts Analysis

**Date d'analyse :** 21 juillet 2025  
**Branche :** `dev`  
**Statut :** **CRITIQUE** - Corrections requises avant production

## 📋 Résumé Exécutif

Plusieurs **interférences critiques** ont été identifiées entre les fichiers de configuration Spring Boot. Ces conflits peuvent causer :

- ❌ **Perte de données** (DDL auto-create)
- ❌ **Dysfonctionnements JWT** (clés incohérentes)
- ❌ **URLs cassées** (context-path en prod)
- ❌ **Profils forcés** (dev forcé même en prod)

---

## 🔥 Conflits Identifiés

### 1. **CRITIQUE : Conflit DDL-AUTO**

**Fichier problématique :** `backend/src/main/resources/application.properties` (ligne 11)

```properties
spring.jpa.hibernate.ddl-auto=create  # ⚠️ RECRÉE la DB à chaque démarrage
```

**Conflit avec :** `backend/src/main/resources/application-dev.yml` (ligne 15)

```yaml
ddl-auto: update # ✅ Mise à jour sans perte de données
```

**⚡ IMPACT :** En développement, application.properties écrase le YAML et **SUPPRIME toutes les données** à chaque redémarrage de Spring Boot.

**🔧 SOLUTION :**

```properties
# AVANT (DANGEREUX)
spring.jpa.hibernate.ddl-auto=create

# APRÈS (SÉCURISÉ)
spring.jpa.hibernate.ddl-auto=update
```

---

### 2. **JWT Secret Incohérent**

**Conflit entre 3 sources :**

1. **application.properties** (ligne 25) :

```properties
jwt.secret=myUltraSecureJwtSecretKey!123456
```

2. **application-dev.yml** (ligne 26) :

```yaml
jwt:
  secret: ${JWT_SECRET:devSecretKeyForDevelopmentOnly}
```

3. **application-prod.yml** (ligne 54) :

```yaml
app: # ⚠️ Structure différente !
  jwt:
    secret: ${JWT_SECRET:defaultSecretKeyForDevelopmentOnlyNotForProduction}
```

**⚡ IMPACT :** JWT peut ne pas fonctionner selon l'environnement.

**🔧 SOLUTION :** Standardiser sur structure `jwt.secret` partout.

---

### 3. **Context-Path Production Problématique**

**Fichier :** `application-prod.yml` (ligne 4)

```yaml
server:
  servlet:
    context-path: /api # ⚠️ Change le base path !
```

**⚡ IMPACT :** En production, URLs deviennent `/api/api/public/...` au lieu de `/api/public/...`

**🔧 SOLUTION :** Supprimer le context-path en production.

---

### 4. **Profil Forcé**

**Fichier :** `application.properties` (ligne 24)

```properties
spring.profiles.active=dev  # ⚠️ Force le profil dev PARTOUT
```

**⚡ IMPACT :** Même avec application-prod.yml, le profil dev sera forcé !

**🔧 SOLUTION :** Supprimer cette ligne et laisser Spring Boot décider.

---

## 📊 Priorités de Correction

### 🚨 **URGENT (P0)**

- [ ] **DDL-AUTO** : Changer `create` → `update` dans application.properties
- [ ] **Profil forcé** : Supprimer `spring.profiles.active=dev`

### ⚠️ **IMPORTANT (P1)**

- [ ] **JWT Structure** : Standardiser `jwt.secret` vs `app.jwt.secret`
- [ ] **Context-Path** : Supprimer en production

### 📝 **AMÉLIORATION (P2)**

- [ ] **Nettoyage** : Supprimer propriétés redondantes dans application.properties
- [ ] **Documentation** : Ajouter commentaires explicatifs

---

## 🔧 Plan de Correction

### **Étape 1 : application.properties (CRITIQUE)**

```properties
# SUPPRIMER ces lignes dangereuses :
# spring.jpa.hibernate.ddl-auto=create           ❌
# spring.profiles.active=dev                     ❌
# jwt.secret=myUltraSecureJwtSecretKey!123456    ❌

# REMPLACER par :
spring.jpa.hibernate.ddl-auto=update             ✅
# (pas de profil forcé)                          ✅
# (JWT géré par profils spécifiques)             ✅
```

### **Étape 2 : application-prod.yml**

```yaml
# SUPPRIMER :
# server:
#   servlet:
#     context-path: /api                          ❌

# CORRIGER structure JWT :
jwt:                                              ✅
  secret: ${JWT_SECRET:prod-default-secret}
# au lieu de :
# app:
#   jwt:
#     secret: ...                                 ❌
```

### **Étape 3 : Tests de Validation**

- [ ] Test démarrage dev (port 8080, profil dev actif)
- [ ] Test démarrage prod (variables env, profil prod actif)
- [ ] Test JWT dev/prod (tokens compatibles)
- [ ] Test persistence (pas de perte de données)

---

## 📝 Notes Techniques

### **Ordre de Priorité des Configurations Spring Boot :**

1. **Variables d'environnement** (plus haute)
2. **Arguments JVM** (`-Dspring.profiles.active=prod`)
3. **application-{profile}.yml**
4. **application.properties** (plus basse)

**⚠️ ATTENTION :** application.properties peut écraser les fichiers profile-spécifiques !

### **Recommandation Architecture :**

- **application.properties** → Configuration générale uniquement
- **application-dev.yml** → Spécificités développement
- **application-prod.yml** → Spécificités production

---

## ✅ Checklist Post-Correction

- [ ] DDL-AUTO sécurisé partout (`update` au lieu de `create`)
- [ ] JWT structure cohérente dev/prod
- [ ] URLs identiques dev/prod (pas de context-path)
- [ ] Profils automatiques (pas de profil forcé)
- [ ] Tests de démarrage dev/prod réussis
- [ ] Documentation mise à jour

---

## 🔗 Fichiers Concernés

- `backend/src/main/resources/application.properties`
- `backend/src/main/resources/application-dev.yml`
- `backend/src/main/resources/application-prod.yml`

**Prochaine action :** Planifier une session de correction avec validation complète en dev et prod.

---

_Analyse réalisée le 21/07/2025 - Branch: dev - Status: Pending correction_
