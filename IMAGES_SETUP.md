# 🎯 Guide d'Installation - Système d'Images Unifié

Ce guide explique comment configurer le système d'images pour fonctionner en développement et en production.

## 📋 Architecture

- **Développement** : Images dans le dossier local `images/` servi par Spring Boot
- **Production** : Images dans le volume Railway `/app/images/` servi par Spring Boot
- **URLs** : Directement stockées en base de données, pas de service de génération d'URL

## 🚀 Installation Rapide

### 1. Développement Local

```bash
# 1. Télécharger les images pour le développement
./scripts/download-card-images.sh

# 2. Exécuter la migration SQL pour mettre à jour les URLs
# Via DBeaver ou psql avec scripts/migrate-images-urls.sql

# 3. Lancer avec le profil dev
cd backend
mvn spring-boot:run -Dspring.profiles.active=dev
```

### 2. Production Railway

```bash
# 1. Déploiement avec volume
railway up

# 2. Configuration du volume d'images (une seule fois)
./scripts/setup-images-railway.sh
```

## 📁 Structure des Images

```
images/
├── cards/
│   ├── fr/                    # Images des cartes en français
│   │   ├── feu/              # Cartes d'élément Feu
│   │   ├── eau/              # Cartes d'élément Eau
│   │   ├── air/              # Cartes d'élément Air
│   │   ├── vegetal/          # Cartes d'élément Végétal
│   │   ├── arcane/           # Cartes d'élément Arcane
│   │   ├── mineral/          # Cartes d'élément Minéral
│   │   └── unknown/          # Cartes d'élément inconnu
│   └── en/                    # Images des cartes en anglais
│       ├── fire/             # Cartes d'élément Fire
│       ├── water/            # Cartes d'élément Water
│       ├── air/              # Cartes d'élément Air
│       ├── vegetal/          # Cartes d'élément Vegetal
│       ├── arcane/           # Cartes d'élément Arcane
│       ├── mineral/          # Cartes d'élément Mineral
│       └── unknown/          # Cartes d'élément inconnu
├── avatars/
│   └── default.png
├── elements/
│   ├── feu.png
│   ├── eau.png
│   └── ...
└── placeholder.png            # Image par défaut
```

## 🔧 Configuration

### Variables d'Environnement

#### Développement (`application-dev.yml`)

```yaml
spring:
  web:
    resources:
      static-locations:
        - "classpath:/static/"
        - "file:images/" # Images locales
```

#### Production (`application-prod.yml`)

```yaml
spring:
  web:
    resources:
      static-locations:
        - "classpath:/static/"
        - "file:/app/images/" # Volume Railway
```

### Railway (`railway.toml`)

```toml
[[deploy.volumes]]
  mountPath = "/app/images"
  name = "images-volume"
```

## 💻 Utilisation dans le Code

**✅ URLs directes - Simplicité maximale !**

```java
// Backend - URLs directes stockées en BDD après migration
@Entity
@Table(name = "card_localization")
public class CardLocalization {
    @Column(name = "image_url")
    private String imageUrl; // Ex: "/images/cards/fr/feu/dragon-rouge.png"

    // Les URLs sont mises à jour par scripts/migrate-images-urls.sql
}

// Si construction manuelle nécessaire (rare)
String imageUrl = String.format("/images/cards/%s/%s/%s.png", locale, element, cardId);
```

## 🎴 Frontend (React)

```jsx
// Dans votre composant React - URL directe depuis la BDD
const CardImage = ({ cardLocalization }) => {
  return (
    <img
      src={cardLocalization.imageUrl} // URL complète depuis la BDD
      alt={cardLocalization.name}
      onError={(e) => (e.target.src = "/images/placeholder.png")}
      loading="lazy"
    />
  );
};

// Alternative - Construction manuelle si nécessaire
const CardImageManual = ({ cardId, locale, element, name }) => {
  const imageUrl = `/images/cards/${locale}/${element}/${cardId}.png`;

  return (
    <img
      src={imageUrl}
      alt={name}
      onError={(e) => (e.target.src = "/images/placeholder.png")}
      loading="lazy"
    />
  );
};
```

## 🚀 Déploiement

### Première fois

1. **Configurez le volume Railway** : `railway volume create images-volume`
2. **Déployez l'application** : `railway up`
3. **Exécutez la migration SQL** : `scripts/migrate-images-urls.sql`
4. **Synchronisez les images** : Exécutez le script de setup

### Mises à jour

- Les images sont persistées dans le volume
- Pas besoin de retransférer à chaque déploiement
- Ajout de nouvelles images via script ou interface

## 🔍 Debugging

### Vérification des chemins

```bash
# En développement
curl http://localhost:8080/images/cards/fr/feu/dragon-rouge.png
curl http://localhost:8080/images/cards/en/fire/red-dragon.png
curl http://localhost:8080/images/placeholder.png

# En production
curl https://votre-app.railway.app/images/cards/fr/feu/dragon-rouge.png
```

### Logs Spring Boot

```yaml
logging:
  level:
    "[org.springframework.web.servlet.resource]": DEBUG
```

## ❓ FAQ

**Q: Pourquoi pas de service pour générer les URLs ?**
A: Les URLs sont identiques en dev/prod, donc inutile. Elles sont stockées directement en BDD.

**Q: Comment ajouter de nouvelles images ?**
A:

- **Dev** : Copiez dans le dossier `images/` avec la structure `cards/{locale}/{element}/{cardId}.png`
- **Prod** : Ajoutez au volume Railway ou synchronisez via script

**Q: Comment utiliser les scripts ?**
A:

- **Images** : `./scripts/download-card-images.sh` (Linux/macOS/WSL) ou Git Bash sur Windows
- **Migration** : `scripts/migrate-images-urls.sql` via DBeaver ou psql

**Q: Les images sont-elles mises en cache ?**
A: Oui, configuration automatique via `spring.web.resources.cache.cachecontrol.max-age`

**Q: Mapping des éléments FR/EN ?**
A:

- FR: `feu, eau, air, vegetal, arcane, mineral`
- EN: `fire, water, air, vegetal, arcane, mineral`

## 🎯 Prochaines Étapes

1. **Migration des URLs** : Exécuter `scripts/migrate-images-urls.sql` via DBeaver/psql
2. **Téléchargement des images** : Utiliser le script Bash pour remplir le dossier local
3. **Test local** : Vérifier l'accès aux images via Spring Boot
4. **Interface d'upload** : Créer une page admin pour gérer les images
5. **Optimisation** : Compression et formats WebP pour de meilleures performances
