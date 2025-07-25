# Test de Validation du Tri des Cartes

## Objectif
Valider que l'API `/{gameId}/cards` retourne les cartes triées selon les critères :
1. **Élément** : Végétal → Feu → Air → Eau → Minéral → Arcane
2. **Extension** : "Jeu de base" en premier
3. **Total mana** : Ordre croissant

## Requête SQL de Test

Exécuter cette requête pour tester le tri manuellement :

```sql
SELECT 
    id,
    properties::json->>'element' as element,
    properties::json->>'extension' as extension,
    COALESCE(CAST(properties::json->'manaCost'->>'total' AS INTEGER), 0) as mana_cost
FROM card 
WHERE game_id = 'mage_noir'
ORDER BY 
    CASE COALESCE(properties::json->>'element', 'Unknown')
        WHEN 'Végétal' THEN 1
        WHEN 'Feu' THEN 2  
        WHEN 'Air' THEN 3
        WHEN 'Eau' THEN 4
        WHEN 'Minéral' THEN 5
        WHEN 'Arcane' THEN 6
        ELSE 7
    END,
    CASE COALESCE(properties::json->>'extension', 'Unknown')
        WHEN 'Jeu de base' THEN 1
        ELSE 2  
    END,
    COALESCE(CAST(properties::json->'manaCost'->>'total' AS INTEGER), 0) ASC;
```

## Tests d'API

### Test 1 : Tri par élément
**Requête** : `GET /api/public/games/mage_noir/cards?locale=fr`

**Résultat attendu** : Les cartes doivent être groupées par élément dans l'ordre :
1. Toutes les cartes **Végétal**
2. Toutes les cartes **Feu**
3. Toutes les cartes **Air**
4. Toutes les cartes **Eau**
5. Toutes les cartes **Minéral**
6. Toutes les cartes **Arcane**

### Test 2 : Tri par extension
Avec des cartes du même élément mais extensions différentes :

**Données de test** :
- Carte A : Feu, "Jeu de base", 3 mana
- Carte B : Feu, "Extension 1", 1 mana

**Résultat attendu** : Carte A avant Carte B (même si moins de mana)

### Test 3 : Tri par coût mana
Avec des cartes du même élément et extension :

**Données de test** :
- Carte A : Feu, "Jeu de base", 5 mana
- Carte B : Feu, "Jeu de base", 1 mana
- Carte C : Feu, "Jeu de base", 3 mana

**Résultat attendu** : B → C → A (ordre croissant de mana)

## Tests Postman/Curl

```bash
# Test avec locale française
curl -X GET "http://localhost:8080/api/public/games/mage_noir/cards?locale=fr" \
     -H "Content-Type: application/json"

# Test avec locale anglaise
curl -X GET "http://localhost:8080/api/public/games/mage_noir/cards?locale=en" \
     -H "Content-Type: application/json"

# Test avec locale par défaut
curl -X GET "http://localhost:8080/api/public/games/mage_noir/cards" \
     -H "Content-Type: application/json"
```

## Validation des Résultats

### Structure de réponse attendue
```json
[
  {
    "id": "card1",
    "name": "Nom de la carte",
    "description": "Description",
    "imageUrl": "url_image",
    "properties": {
      "element": "Végétal",
      "extension": "Jeu de base",
      "manaCost": {
        "total": 1
      }
    }
  }
]
```

### Points de contrôle
1. ✅ Les cartes sont triées par élément dans l'ordre spécifié
2. ✅ Au sein d'un élément, "Jeu de base" vient avant les autres extensions
3. ✅ Au sein d'un élément/extension, tri croissant par coût mana
4. ✅ Les cartes sans coût mana sont traitées comme coût 0
5. ✅ La structure JSON des propriétés est préservée
6. ✅ La localisation fonctionne correctement

## Performance

### Métriques à surveiller
- Temps de réponse de l'API avec 205 cartes
- Utilisation des index PostgreSQL
- Plan d'exécution de la requête SQL

### Commande d'analyse
```sql
EXPLAIN (ANALYZE, BUFFERS) 
SELECT * FROM card c 
WHERE c.game_id = 'mage_noir'
ORDER BY 
    CASE COALESCE(c.properties::json->>'element', 'Unknown')
        WHEN 'Végétal' THEN 1
        WHEN 'Feu' THEN 2  
        WHEN 'Air' THEN 3
        WHEN 'Eau' THEN 4
        WHEN 'Minéral' THEN 5
        WHEN 'Arcane' THEN 6
        ELSE 7
    END,
    CASE COALESCE(c.properties::json->>'extension', 'Unknown')
        WHEN 'Jeu de base' THEN 1
        ELSE 2  
    END,
    COALESCE(CAST(c.properties::json->'manaCost'->>'total' AS INTEGER), 0) ASC;
```

## Cas de Test Edge

1. **Cartes sans élément** : Doivent apparaître à la fin
2. **Cartes sans extension** : Traitées comme extension générique
3. **Cartes sans manaCost** : Traitées comme coût 0
4. **JSON malformé** : Gestion gracieuse des erreurs
5. **Éléments avec casse différente** : Vérifier la sensibilité à la casse
