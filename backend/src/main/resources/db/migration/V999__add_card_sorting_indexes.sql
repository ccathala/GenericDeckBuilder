-- Index de performance pour le tri des cartes par élément, extension et coût mana
-- Ces index améliorent les performances des requêtes JSON sur PostgreSQL

-- Index pour l'élément (premier critère de tri)
CREATE INDEX IF NOT EXISTS idx_card_element 
ON card USING GIN ((properties::json->>'element'));

-- Index pour l'extension (deuxième critère de tri) 
CREATE INDEX IF NOT EXISTS idx_card_extension 
ON card USING GIN ((properties::json->>'extension'));

-- Index pour le coût total de mana (troisième critère de tri)
CREATE INDEX IF NOT EXISTS idx_card_mana_cost 
ON card (((properties::json->'manaCost'->>'total')::INTEGER));

-- Index composite pour optimiser la requête complète de tri
-- Cet index couvre tous les critères de tri en une seule structure
CREATE INDEX IF NOT EXISTS idx_card_sort_composite 
ON card (
    game_id,
    (CASE COALESCE(properties::json->>'element', 'Unknown')
        WHEN 'Végétal' THEN 1
        WHEN 'Feu' THEN 2  
        WHEN 'Air' THEN 3
        WHEN 'Eau' THEN 4
        WHEN 'Minéral' THEN 5
        WHEN 'Arcane' THEN 6
        ELSE 7
    END),
    (CASE COALESCE(properties::json->>'extension', 'Unknown')
        WHEN 'Jeu de base' THEN 1
        ELSE 2  
    END),
    (COALESCE(CAST(properties::json->'manaCost'->>'total' AS INTEGER), 0))
);

-- Commentaires sur les index :
-- 1. idx_card_element : Index GIN pour recherche rapide par élément
-- 2. idx_card_extension : Index GIN pour recherche rapide par extension  
-- 3. idx_card_mana_cost : Index B-tree pour tri numérique du coût mana
-- 4. idx_card_sort_composite : Index composite qui optimise la requête complète
--    en pré-calculant les expressions CASE utilisées dans ORDER BY

-- Pour supprimer les index si nécessaire (développement/test) :
-- DROP INDEX IF EXISTS idx_card_element;
-- DROP INDEX IF EXISTS idx_card_extension;
-- DROP INDEX IF EXISTS idx_card_mana_cost;
-- DROP INDEX IF EXISTS idx_card_sort_composite;
