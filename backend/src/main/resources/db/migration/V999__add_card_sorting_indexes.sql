-- Index de performance pour le tri des cartes par élément, extension et coût mana
-- Version corrigée : utilise B-tree au lieu de GIN pour les extractions JSON text

-- Index B-tree pour l'élément (premier critère de tri)
-- Utilisation de CAST() au lieu de :: pour la syntaxe d'index
CREATE INDEX IF NOT EXISTS idx_card_element 
ON card ((CAST(properties AS jsonb)->>'element'));

-- Index B-tree pour l'extension (deuxième critère de tri)
CREATE INDEX IF NOT EXISTS idx_card_extension 
ON card ((CAST(properties AS jsonb)->>'extension'));

-- Index B-tree pour le coût total de mana (troisième critère de tri)
CREATE INDEX IF NOT EXISTS idx_card_mana_cost 
ON card (CAST(CAST(properties AS jsonb)->'manaCost'->>'total' AS INTEGER));

-- Index composite simplifié pour optimiser la requête de tri
-- Cast explicite vers jsonb pour tous les champs
CREATE INDEX IF NOT EXISTS idx_card_sort_optimized 
ON card (
    game_id,
    (CAST(properties AS jsonb)->>'element'),
    (CAST(properties AS jsonb)->>'extension'),
    (CAST(CAST(properties AS jsonb)->'manaCost'->>'total' AS INTEGER))
);

-- Index GIN sur la colonne JSON complète pour recherches complexes
-- Cast explicite vers jsonb
CREATE INDEX IF NOT EXISTS idx_card_properties_gin 
ON card USING GIN (CAST(properties AS jsonb));

-- Commentaires sur les index :
-- 1. idx_card_element : Index B-tree pour recherche rapide par élément (text)
-- 2. idx_card_extension : Index B-tree pour recherche rapide par extension (text)
-- 3. idx_card_mana_cost : Index B-tree pour tri numérique du coût mana
-- 4. idx_card_sort_optimized : Index composite qui optimise la requête complète
--    sans les expressions CASE complexes (tri fait au niveau applicatif)
-- 5. idx_card_properties_gin : Index GIN sur le JSON complet pour recherches avancées

-- Corrections apportées :
-- ✓ Remplacement des index GIN par B-tree pour les extractions text (->>'element', ->>'extension')
-- ✓ Suppression des expressions CASE complexes qui ne peuvent pas être indexées
-- ✓ Simplification de l'index composite pour de meilleures performances
-- ✓ Conservation d'un index GIN sur le JSON complet pour la flexibilité
-- ✓ Ajout du cast CAST() au lieu de :: pour éviter l'erreur de syntaxe PostgreSQL

-- Pour supprimer les index si nécessaire (développement/test) :
-- DROP INDEX IF EXISTS idx_card_element;
-- DROP INDEX IF EXISTS idx_card_extension;
-- DROP INDEX IF EXISTS idx_card_mana_cost;
-- DROP INDEX IF EXISTS idx_card_sort_optimized;
-- DROP INDEX IF EXISTS idx_card_properties_gin;
