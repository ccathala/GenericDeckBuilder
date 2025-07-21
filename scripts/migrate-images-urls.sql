-- Script de migration des URLs d'images vers hébergement propre
-- Convertit les URLs de magenoir.com vers notre CDN/static assets

-- Mise à jour globale des URLs d'images
UPDATE card_localization 
SET image_url = CASE 
    -- Images françaises Végétal
    WHEN image_url LIKE 'https://magenoir.com/cards/FR/Vegetal/%' 
    THEN REPLACE(image_url, 'https://magenoir.com/cards/FR/Vegetal/', '/images/cards/fr/vegetal/')
    
    -- Images anglaises Végétal  
    WHEN image_url LIKE 'https://magenoir.com/cards/EN/vegetal/%'
    THEN REPLACE(image_url, 'https://magenoir.com/cards/EN/vegetal/', '/images/cards/en/vegetal/')
    
    -- Images françaises Feu
    WHEN image_url LIKE 'https://magenoir.com/cards/FR/Feu/%'
    THEN REPLACE(image_url, 'https://magenoir.com/cards/FR/Feu/', '/images/cards/fr/feu/')
    
    -- Images anglaises Feu
    WHEN image_url LIKE 'https://magenoir.com/cards/EN/fire/%'
    THEN REPLACE(image_url, 'https://magenoir.com/cards/EN/fire/', '/images/cards/en/fire/')
    
    -- Autres éléments à ajouter au fur et à mesure
    ELSE image_url
END
WHERE image_url LIKE 'https://magenoir.com/cards/%';

-- Vérification du nombre d'URLs migrées
SELECT 
    'Migrated URLs' as status,
    COUNT(*) as count 
FROM card_localization 
WHERE image_url LIKE '/images/cards/%';

-- Liste des URLs non encore migrées
SELECT DISTINCT 
    substring(image_url from 'https://magenoir\.com/cards/([^/]+/[^/]+)/') as path_pattern,
    COUNT(*) as count
FROM card_localization 
WHERE image_url LIKE 'https://magenoir.com/cards/%' 
GROUP BY substring(image_url from 'https://magenoir\.com/cards/([^/]+/[^/]+)/')
ORDER BY count DESC;
