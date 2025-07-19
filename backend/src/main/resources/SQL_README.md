# Scripts SQL d'initialisation - Mage Noir

Ce dossier contient les scripts SQL pour initialiser le jeu "Mage Noir" dans la base de données.

## Ordre d'exécution recommandé :

1. **mage_noir_game_init.sql** - Initialise le jeu "Mage Noir" dans la table `game`
2. **mage_noir_card_init.sql** - Initialise toutes les cartes du jeu avec leurs localisations
3. **mage_noir_rules_init.sql** - Initialise les règles de deck (40 cartes min, 4 copies max par carte)

## Description des fichiers :

### mage_noir_game_init.sql
- Insère l'entrée de base du jeu "Mage Noir" 
- Doit être exécuté en premier car les autres scripts dépendent de cette entrée

### mage_noir_card_init.sql  
- Contient toutes les cartes du jeu avec leurs propriétés
- Inclut les localisations en français et anglais
- Organisé par éléments (Végétal, Feu, Eau, Air, Minéral, Arcane)

### mage_noir_rules_init.sql
- Définit les règles de construction de deck pour le jeu
- Minimum : 40 cartes par deck
- Maximum : 4 exemplaires par carte unique

## Note technique :
Les scripts utilisent `ON CONFLICT` pour permettre une ré-exécution sans erreur.
