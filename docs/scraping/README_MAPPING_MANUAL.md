# 📋 Guide du Mapping Manuel des Cartes Mage Noir

## 🎯 Vue d'ensemble

Ce système permet de générer automatiquement un fichier SQL bilingue (français/anglais) pour alimenter la base de données des cartes Mage Noir. Il utilise un **mapping manuel** pour associer précisément chaque carte française à son équivalent anglais.

## 📁 Structure des Fichiers

### Fichiers Principaux
- **`card_mapping_fr_en_structure.json`** - Fichier unique de mapping (template + travail)
- **`sql_generator_v2.py`** - Générateur SQL principal
- **`test_limited_generation.py`** - Script de test avec échantillon réduit

### Fichiers de Données
- **`exact_410_card_urls_and_images_fr_en.json`** - URLs des 410 cartes (205 FR + 205 EN)
- **`generate_mapping_structure.py`** - Générateur de structure initiale

## 🔧 Fichier de Mapping : `card_mapping_fr_en_structure.json`

### Structure du Fichier
```json
{
  "description": "Mapping manuel des correspondances entre cartes françaises et anglaises",
  "version": "2.0",
  "instructions": [
    "REMPLACER LES PLACEHOLDERS EN_NAME_FOR_* PAR LES VRAIS NOMS ANGLAIS",
    "Utiliser des noms normalisés (minuscules, espaces au lieu de tirets/underscores)",
    "Exemple: remplacer 'EN_NAME_FOR_ACCELERATION' par 'acceleration'"
  ],
  "stats": {
    "total_french_cards": 205,
    "elements": {
      "air": 34,
      "arcane": 34,
      "fire": 32,
      "mineral": 37,
      "vegetal": 34,
      "water": 34
    }
  },
  "mappings": {
    "air": {
      "acceleration": "acceleration",  ← CORRESPONDANCE COMPLÉTÉE
      "appel de la foudre": "EN_NAME_FOR_APPEL-DE-LA-FOUDRE",  ← PLACEHOLDER À REMPLACER
      "arc de foudre": "EN_NAME_FOR_ARC-DE-FOUDRE"  ← PLACEHOLDER À REMPLACER
    }
  }
}
```

### Types d'Entrées

| Type | Exemple | État |
|------|---------|------|
| **Correspondance complétée** | `"acceleration": "acceleration"` | ✅ Utilisée par le script |
| **Placeholder à compléter** | `"carte": "EN_NAME_FOR_CARTE"` | ⚠️ Ignorée par le script |

## 🛠️ Comment Compléter le Mapping

### Étape 1 : Identifier une Carte à Mapper
1. Ouvrir `card_mapping_fr_en_structure.json`
2. Chercher un placeholder comme `"EN_NAME_FOR_ACCELERATION"`
3. Noter le nom français correspondant

### Étape 2 : Trouver le Nom Anglais
1. Aller sur https://magenoir.com/collection_en.html
2. Chercher la carte équivalente
3. Noter le nom anglais exact

### Étape 3 : Remplacer le Placeholder
```json
// AVANT
"acceleration": "EN_NAME_FOR_ACCELERATION"

// APRÈS  
"acceleration": "acceleration"
```

### Règles de Normalisation
- **Minuscules uniquement** : `"Acceleration"` → `"acceleration"`
- **Espaces au lieu de tirets** : `"Arc-de-foudre"` → `"arc de foudre"`
- **Espaces au lieu d'underscores** : `"Air_blade"` → `"air blade"`

## 🧪 Tests et Validation

### Test Rapide (3 cartes)
```bash
python test_limited_generation.py
```

**Sortie attendue :**
```
✅ Correspondance manuelle trouvée: acceleration ↔ acceleration
⚠️ Aucune correspondance manuelle trouvée pour: appel de la foudre
```

### Génération Complète (205 cartes)
```bash
python sql_generator_v2.py
```

## 📊 Suivi de Progression

### Vérifier l'Avancement
Compter les correspondances complétées vs placeholders :
- **Complétées** : lignes sans `EN_NAME_FOR_`
- **Restantes** : lignes avec `EN_NAME_FOR_`

### Exemple de Progression
```json
"air": {
  "acceleration": "acceleration",                    ← 1/34 complété
  "appel de la foudre": "EN_NAME_FOR_APPEL-DE-LA-FOUDRE",  
  "arc de foudre": "EN_NAME_FOR_ARC-DE-FOUDRE",
  // ... 31 autres à compléter
}
```

## ⚙️ Fonctionnement du Script

### Logique de Correspondance
1. **Lecture du mapping** : Le script charge `card_mapping_fr_en_structure.json`
2. **Filtrage des placeholders** : Ignore les entrées commençant par `EN_NAME_FOR_`
3. **Recherche de correspondance** : Pour chaque carte française, cherche la correspondance dans le mapping
4. **Extraction des données** : Récupère les informations depuis les pages web FR et EN
5. **Génération SQL** : Crée les requêtes INSERT pour les tables `card` et `card_localization`

### Structure de Base de Données Générée
```sql
-- Table principale
INSERT INTO card (id, element, properties, image_url) VALUES 
('acceleration', 'Air', '{"manaAir":2,"manaArcane":2}', 'https://...');

-- Localisation française
INSERT INTO card_localization (card_id, language_code, name, description) VALUES 
('acceleration', 'fr', 'Acceleration', 'Description en français...');

-- Localisation anglaise  
INSERT INTO card_localization (card_id, language_code, name, description) VALUES 
('acceleration', 'en', 'Acceleration', 'English description...');
```

## 🎯 Objectif Final

Une fois les 205 correspondances complétées :
- ✅ **205 cartes uniques** dans la table `card`
- ✅ **410 localisations** dans la table `card_localization` (205 FR + 205 EN)
- ✅ **Base de données bilingue** complète pour l'application

## 🚨 Problèmes Courants

### Erreur "Aucune correspondance manuelle trouvée"
**Cause :** La carte a encore un placeholder `EN_NAME_FOR_`
**Solution :** Remplacer le placeholder par le vrai nom anglais

### Erreur "Carte anglaise sans correspondance française"
**Cause :** Il existe une carte anglaise qui n'a pas d'équivalent français
**Solution :** Vérifier si c'est normal ou ajouter la correspondance manquante

### Erreur de normalisation
**Cause :** Le nom n'est pas au bon format (majuscules, tirets, etc.)
**Solution :** Appliquer les règles de normalisation

## 📈 Conseils d'Efficacité

1. **Travailler par élément** : Compléter un élément à la fois (Air, Fire, etc.)
2. **Tester régulièrement** : Lancer `test_limited_generation.py` après quelques ajouts
3. **Sauvegarder souvent** : Faire des commits Git réguliers
4. **Vérifier les stats** : S'assurer d'avoir le bon nombre de cartes par élément

---

*Généré automatiquement pour le projet GenericDeckBuilder - Système de scraping Mage Noir*
