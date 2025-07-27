-- Script de prévisualisation des composants à extraire
-- Permet de voir les données avant insertion dans component_translations
-- N'effectue AUCUNE modification, uniquement des SELECT
-- Compatible PostgreSQL avec JSONB

-- ========================================
-- ÉTAPE 1: Vue d'ensemble des données
-- ========================================
SELECT '=== VUE D''ENSEMBLE DES CARTES ET COMPOSANTS ===' as section;

SELECT 
    c.game_id,
    COUNT(*) as total_cartes,
    COUNT(CASE WHEN c.properties::jsonb->'componentCost' IS NOT NULL THEN 1 END) as cartes_avec_componentCost,
    COUNT(CASE WHEN jsonb_typeof(c.properties::jsonb->'componentCost') = 'array' THEN 1 END) as componentCost_valide_array,
    COUNT(CASE WHEN c.properties::jsonb->'componentCost' IS NOT NULL 
                AND jsonb_typeof(c.properties::jsonb->'componentCost') = 'array' 
                AND jsonb_array_length(c.properties::jsonb->'componentCost') > 0 THEN 1 END) as componentCost_non_vide
FROM card c
GROUP BY c.game_id
ORDER BY c.game_id;

-- ========================================
-- ÉTAPE 2: Aperçu des composants extraits
-- ========================================
SELECT '=== COMPOSANTS QUI SERONT EXTRAITS ===' as section;

SELECT 
    component_elem->>'componentName' AS component_name_fr,
    c.game_id,
    COUNT(*) AS nb_cartes_utilisant_ce_composant,
    ROUND(AVG(CASE 
        WHEN component_elem->>'quantity' ~ '^[0-9]+(\.[0-9]+)?$' 
        THEN (component_elem->>'quantity')::numeric 
        ELSE NULL 
    END), 2) as quantite_moyenne,
    MIN(CASE 
        WHEN component_elem->>'quantity' ~ '^[0-9]+(\.[0-9]+)?$' 
        THEN (component_elem->>'quantity')::numeric 
        ELSE NULL 
    END) as quantite_min,
    MAX(CASE 
        WHEN component_elem->>'quantity' ~ '^[0-9]+(\.[0-9]+)?$' 
        THEN (component_elem->>'quantity')::numeric 
        ELSE NULL 
    END) as quantite_max,
    STRING_AGG(DISTINCT SUBSTRING(c.id, 1, 30), ', ' ORDER BY SUBSTRING(c.id, 1, 30)) AS exemples_cartes
FROM card c,
     LATERAL jsonb_array_elements(c.properties::jsonb->'componentCost') AS component_elem
WHERE c.properties::jsonb->'componentCost' IS NOT NULL
  AND jsonb_typeof(c.properties::jsonb->'componentCost') = 'array'
  AND component_elem->>'componentName' IS NOT NULL
  AND component_elem->>'componentName' != ''
GROUP BY 
    component_elem->>'componentName',
    c.game_id
ORDER BY 
    c.game_id,
    COUNT(*) DESC,
    component_elem->>'componentName';

-- ========================================
-- ÉTAPE 3: Statistiques par jeu
-- ========================================
SELECT '=== STATISTIQUES PAR JEU ===' as section;

SELECT 
    game_id,
    COUNT(DISTINCT component_name_fr) as composants_uniques_a_creer,
    COUNT(*) as total_occurrences_composants,
    ROUND(COUNT(*)::numeric / COUNT(DISTINCT component_name_fr), 2) as moyenne_utilisation_par_composant
FROM (
    SELECT 
        component_elem->>'componentName' AS component_name_fr,
        c.game_id
    FROM card c,
         LATERAL jsonb_array_elements(c.properties::jsonb->'componentCost') AS component_elem
    WHERE c.properties::jsonb->'componentCost' IS NOT NULL
      AND jsonb_typeof(c.properties::jsonb->'componentCost') = 'array'
      AND component_elem->>'componentName' IS NOT NULL
      AND component_elem->>'componentName' != ''
) AS extracted_components
GROUP BY game_id
ORDER BY game_id;

-- ========================================
-- ÉTAPE 4: Vérification des conflits
-- ========================================
SELECT '=== VÉRIFICATION DES CONFLITS AVEC component_translations ===' as section;

-- Composants qui existent déjà dans component_translations
SELECT 
    ct.component_name_fr,
    ct.game_id,
    ct.component_name_en,
    CASE 
        WHEN ct.component_name_en IS NULL THEN 'EXISTE (EN=NULL)'
        ELSE 'EXISTE (TRADUIT)'
    END AS statut_actuel
FROM component_translations ct
WHERE EXISTS (
    SELECT 1
    FROM card c,
         LATERAL jsonb_array_elements(c.properties::jsonb->'componentCost') AS component_elem
    WHERE component_elem->>'componentName' = ct.component_name_fr
      AND c.game_id = ct.game_id
)
ORDER BY ct.game_id, ct.component_name_fr;

-- ========================================
-- ÉTAPE 5: Nouveaux composants à créer
-- ========================================
SELECT '=== NOUVEAUX COMPOSANTS QUI SERONT CRÉÉS ===' as section;

-- Composants qui seront créés (n'existent pas encore)
SELECT 
    extracted.component_name_fr,
    extracted.game_id,
    'NOUVEAU (sera créé avec EN=NULL)' as statut
FROM (
    SELECT DISTINCT 
        component_elem->>'componentName' AS component_name_fr,
        c.game_id
    FROM card c,
         LATERAL jsonb_array_elements(c.properties::jsonb->'componentCost') AS component_elem
    WHERE c.properties::jsonb->'componentCost' IS NOT NULL
      AND jsonb_typeof(c.properties::jsonb->'componentCost') = 'array'
      AND component_elem->>'componentName' IS NOT NULL
      AND component_elem->>'componentName' != ''
) AS extracted
LEFT JOIN component_translations ct 
    ON ct.component_name_fr = extracted.component_name_fr 
    AND ct.game_id = extracted.game_id
WHERE ct.id IS NULL
ORDER BY extracted.game_id, extracted.component_name_fr;

-- ========================================
-- ÉTAPE 6: Résumé final
-- ========================================
SELECT '=== RÉSUMÉ FINAL ===' as section;

WITH extraction_summary AS (
    SELECT 
        COUNT(DISTINCT component_elem->>'componentName' || '|' || c.game_id) as total_unique_combinations,
        COUNT(DISTINCT component_elem->>'componentName') as total_unique_names,
        COUNT(DISTINCT c.game_id) as total_games
    FROM card c,
         LATERAL jsonb_array_elements(c.properties::jsonb->'componentCost') AS component_elem
    WHERE c.properties::jsonb->'componentCost' IS NOT NULL
      AND jsonb_typeof(c.properties::jsonb->'componentCost') = 'array'
      AND component_elem->>'componentName' IS NOT NULL
      AND component_elem->>'componentName' != ''
),
existing_summary AS (
    SELECT COUNT(*) as existing_translations
    FROM component_translations
),
conflicts_summary AS (
    SELECT COUNT(*) as conflicting_translations
    FROM component_translations ct
    WHERE EXISTS (
        SELECT 1
        FROM card c,
             LATERAL jsonb_array_elements(c.properties::jsonb->'componentCost') AS component_elem
        WHERE component_elem->>'componentName' = ct.component_name_fr
          AND c.game_id = ct.game_id
    )
)
SELECT 
    es.total_unique_combinations as "Combinaisons (nom,jeu) à traiter",
    es.total_unique_names as "Noms de composants uniques",
    es.total_games as "Jeux concernés",
    ex.existing_translations as "Traductions existantes (total)",
    cs.conflicting_translations as "Traductions existantes (pour ces composants)",
    es.total_unique_combinations - COALESCE(cs.conflicting_translations, 0) as "Nouvelles lignes qui seront créées"
FROM extraction_summary es
CROSS JOIN existing_summary ex
CROSS JOIN conflicts_summary cs;

-- ========================================
-- ÉTAPE 7: Validation de la structure JSONB
-- ========================================
SELECT '=== VALIDATION DE LA STRUCTURE JSONB ===' as section;

SELECT 
    c.game_id,
    COUNT(*) as total_cartes,
    COUNT(CASE WHEN c.properties IS NULL THEN 1 END) as properties_null,
    COUNT(CASE WHEN c.properties::jsonb->'componentCost' IS NULL THEN 1 END) as componentCost_null,
    COUNT(CASE WHEN c.properties::jsonb->'componentCost' IS NOT NULL 
                AND jsonb_typeof(c.properties::jsonb->'componentCost') != 'array' THEN 1 END) as componentCost_non_array,
    COUNT(CASE WHEN jsonb_typeof(c.properties::jsonb->'componentCost') = 'array' 
                AND jsonb_array_length(c.properties::jsonb->'componentCost') = 0 THEN 1 END) as componentCost_array_vide,
    COUNT(CASE WHEN jsonb_typeof(c.properties::jsonb->'componentCost') = 'array' 
                AND jsonb_array_length(c.properties::jsonb->'componentCost') > 0 THEN 1 END) as componentCost_array_avec_donnees
FROM card c
GROUP BY c.game_id
ORDER BY c.game_id;

-- ========================================
-- INSTRUCTIONS POUR LA SUITE
-- ========================================
SELECT '=== INSTRUCTIONS ===' as section;
SELECT 'Si les résultats ci-dessus sont corrects, exécutez le script extract_components_with_logging.sql pour effectuer l''insertion' as instruction;
