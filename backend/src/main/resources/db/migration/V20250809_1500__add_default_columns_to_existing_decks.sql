-- Script de rattrapage : Ajouter une colonne par défaut "Deck" 
-- SEULEMENT aux decks existants qui n'ont AUCUNE colonne
-- Date: 2025-08-09
-- Auteur: Migration automatique pour colonnes de visualisation par défaut

-- Étape 1: Insérer une colonne par défaut UNIQUEMENT pour les decks sans aucune colonne
INSERT INTO deck_column_group (id, deck_id, name, display_order, created_at, updated_at)
SELECT 
    gen_random_uuid() as id,
    d.id as deck_id,
    'Deck' as name,
    0 as display_order,
    NOW() as created_at,
    NOW() as updated_at
FROM deck d
WHERE NOT EXISTS (
    SELECT 1 
    FROM deck_column_group dcg 
    WHERE dcg.deck_id = d.id
);

-- Étape 2: Assigner toutes les cartes orphelines à leur nouvelle colonne par défaut
-- (Seulement les cartes qui n'ont pas encore de column_group_id)
-- Utilisation d'une CTE pour calculer les positions avec ROW_NUMBER()
WITH card_positions AS (
    SELECT 
        dc.deck_id,
        dc.card_id,
        dcg.id as new_column_id,
        ROW_NUMBER() OVER (
            PARTITION BY dc.deck_id 
            ORDER BY dc.card_id
        ) - 1 as new_position
    FROM deck_card dc
    JOIN deck_column_group dcg ON dcg.deck_id = dc.deck_id
    WHERE dc.column_group_id IS NULL
    AND dcg.name = 'Deck'
)
UPDATE deck_card 
SET 
    column_group_id = cp.new_column_id,
    position_in_column = cp.new_position
FROM card_positions cp
WHERE deck_card.deck_id = cp.deck_id 
AND deck_card.card_id = cp.card_id;

-- Étape 3: Vérification de cohérence (optionnel - pour debug)
-- Cette requête peut être commentée en production
/*
SELECT 
    'Decks sans colonnes après migration' as verification,
    COUNT(*) as count
FROM deck d
WHERE NOT EXISTS (
    SELECT 1 FROM deck_column_group dcg WHERE dcg.deck_id = d.id
);
*/

-- Ajouter un commentaire pour traçabilité
COMMENT ON TABLE deck_column_group IS 'Colonnes de visualisation des decks. Chaque deck doit avoir au moins une colonne par défaut.';
