# 🔄 Persistance des Filtres de Carte

## 📋 Fonctionnalité

La persistance des filtres de carte permet aux utilisateurs de retrouver leurs filtres appliqués (recherche, éléments, composants, type, zoom, aperçu d'image) lorsqu'ils reviennent sur la page de collection ou dans le deck builder.

## 🎯 Objectif

Améliorer l'expérience utilisateur en conservant l'état des filtres entre les sessions de navigation.

## 🛠️ Implémentation

### Localisation
- **Fichier:** `frontend/src/components/CardBrowser.jsx`
- **Clé localStorage:** `cardFilters`

### Données persistées

Les filtres suivants sont sauvegardés :
- `searchTerm` : Terme de recherche
- `selectedElements` : Éléments sélectionnés
- `selectedComponents` : Composants sélectionnés  
- `selectedType` : Type de carte sélectionné
- `columnsCount` : Nombre de colonnes (zoom)
- `showImagePreview` : État de l'aperçu d'image
- `showFanMade` : État du filtre fan made

### Mécanisme

1. **Chargement initial** : Les filtres sont chargés depuis le localStorage au montage du composant
2. **Sauvegarde automatique** : Un effet React sauvegarde les filtres à chaque modification
3. **Réinitialisation** : Le bouton "Reset" efface aussi les données du localStorage

### Code clé

```javascript
// Sauvegarde
const saveFiltersToStorage = (filters) => {
  localStorage.setItem(FILTERS_STORAGE_KEY, JSON.stringify(filters));
};

// Chargement  
const loadFiltersFromStorage = () => {
  const stored = localStorage.getItem(FILTERS_STORAGE_KEY);
  return stored ? JSON.parse(stored) : null;
};

// Effet de sauvegarde
useEffect(() => {
  const filters = {
    searchTerm,
    selectedElements,
    selectedComponents,
    selectedType,
    columnsCount,
    showImagePreview,
    showFanMade
  };
  saveFiltersToStorage(filters);
}, [searchTerm, selectedElements, selectedComponents, selectedType, columnsCount, showImagePreview, showFanMade]);
```

## 🎨 Expérience utilisateur

- **Transparent** : L'utilisateur ne remarque pas la persistance, ça "juste marche"
- **Consistent** : Mêmes filtres sur toutes les pages utilisant CardBrowser
- **Réinitialisable** : Le bouton reset efface complètement l'état persisté

## 🔧 Compatibilité

- ✅ Tous les navigateurs modernes supportant localStorage
- ✅ Mode développement et production
- ✅ Multi-onglets (les filtres sont partagés entre les onglets)

## 🚀 Avantages

1. **Productivité** : Les utilisateurs retrouvent leurs filtres préférés
2. **UX améliorée** : Moins de clics pour reconfigurer les filtres
3. **Consistance** : Expérience cohérente entre les pages

## 📝 Notes techniques

- Les filtres sont sauvegardés immédiatement à chaque changement
- Le format JSON est utilisé pour la sérialisation
- La clé `cardFilters` est unique à l'application
- Gestion d'erreur robuste avec try/catch

## 🔄 Évolution future

- Ajouter une expiration automatique des filtres
- Support des préférences utilisateur par profil
- Synchronisation entre appareils
