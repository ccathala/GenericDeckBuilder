# 🖼️ Configuration des Images

## Téléchargement des Assets

Les images de cartes ne sont pas trackées dans Git pour éviter d'alourdir le repository.

### 🚀 Installation Automatique

Exécutez le script de téléchargement depuis la racine du projet :

```bash
./scripts/download-card-images.sh
```

Ce script va :

- ✅ Créer la structure `images/cards/{fr,en}/{vegetal,fire}/`
- ✅ Télécharger **68 images** depuis magenoir.com avec retry automatique
- ✅ Générer des logs détaillés dans `image-download.log`
- ✅ Optimiser les images (si ImageMagick disponible)

### 📁 Structure Créée

```
images/
└── cards/
    ├── fr/
    │   ├── vegetal/          # 33 cartes végétal français
    │   └── feu/              # 1 carte feu français
    └── en/
        ├── vegetal/          # 33 cartes vegetal anglais
        └── fire/             # 1 carte fire anglais
```

### ⚙️ Configuration

Le système d'images fonctionne automatiquement en **dev** et **prod** :

- **Development** : `http://localhost:8080/images/cards/...`
- **Production** : `https://your-app.railway.app/images/cards/...`

### 🔧 Développement

Pour les développeurs :

1. Le dossier `images/` est ignoré par Git (voir `.gitignore`)
2. Chaque développeur doit exécuter le script localement
3. En production, utilisez `setup-images-railway.sh` pour Railway

### 🐛 Dépannage

Si les images ne s'affichent pas :

1. Vérifiez que le dossier `images/` existe dans la racine
2. Lancez `./scripts/download-card-images.sh`
3. Redémarrez Spring Boot
4. Consultez `image-download.log` pour les erreurs
