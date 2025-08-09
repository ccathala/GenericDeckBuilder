-- Script de correction : Assigner les cartes orphelines aux colonnes par défaut
-- Date: 2025-08-09
-- Objectif: Remplir column_group_id et position_in_column pour les cartes sans colonne

-- Assigner toutes les cartes orphelines à leur colonne "Deck" respective
WITH card_assignments AS (
    SELECT 
        dc.deck_id,
        dc.card_id,
        dcg.id as target_column_id,
        ROW_NUMBER() OVER (
            PARTITION BY dc.deck_id 
            ORDER BY dc.card_id
        ) - 1 as calculated_position
    FROM deck_card dc
    INNER JOIN deck_column_group dcg ON dcg.deck_id = dc.deck_id
    WHERE dc.column_group_id IS NULL  -- Cartes orphelines
    AND dcg.name IN ('Deck', '1')     -- Colonnes par défaut possibles
)
UPDATE deck_card 
SET 
    column_group_id = ca.target_column_id,
    position_in_column = ca.calculated_position
FROM card_assignments ca
WHERE deck_card.deck_id = ca.deck_id 
AND deck_card.card_id = ca.card_id;

-- Statistiques après assignation
SELECT 
    'Cartes assignées' as action,
    COUNT(*) as count
FROM deck_card 
WHERE column_group_id IS NOT NULL;

SELECT 
    'Cartes orphelines restantes' as action,
    COUNT(*) as count
FROM deck_card 
WHERE column_group_id IS NULL;
