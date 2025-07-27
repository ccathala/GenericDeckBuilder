-- Script d'extraction et insertion des composants dans component_translations
-- Avec logging détaillé et gestion d'erreurs pour PostgreSQL
-- ATTENTION: Ce script MODIFIE la base de données

-- Note: Si vous utilisez psql, décommentez la ligne suivante
-- \set ON_ERROR_STOP on

DO $$
DECLARE 
    rec RECORD;
    v_inserted_count INTEGER := 0;
    v_skipped_count INTEGER := 0;
    v_error_count INTEGER := 0;
    v_start_time TIMESTAMP := clock_timestamp();
    v_end_time TIMESTAMP;
    v_processing_start TIMESTAMP;
    v_component_name TEXT;
    v_game_id TEXT;
    v_error_message TEXT;
BEGIN
    -- ========================================
    -- PHASE 1: Initialisation et logging
    -- ========================================
    RAISE INFO '=== DÉBUT DU SCRIPT D''EXTRACTION DES COMPOSANTS ===';
    RAISE INFO 'Heure de début: %', v_start_time;
    RAISE INFO '';
    
    -- Création d'une table temporaire pour le logging
    DROP TABLE IF EXISTS temp_extraction_log;
    CREATE TEMP TABLE temp_extraction_log (
        log_time TIMESTAMP DEFAULT clock_timestamp(),
        log_level TEXT,
        log_message TEXT,
        component_name TEXT,
        game_id TEXT,
        details TEXT
    );
    
    INSERT INTO temp_extraction_log (log_level, log_message) 
    VALUES ('INFO', 'Table de logging temporaire créée');
    
    -- ========================================
    -- PHASE 2: Validation préliminaire
    -- ========================================
    RAISE INFO '=== PHASE 2: VALIDATION PRÉLIMINAIRE ===';
    
    -- Vérifier l'existence de la table component_translations
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'component_translations') THEN
        RAISE EXCEPTION 'Table component_translations introuvable. Veuillez d''abord créer la structure.';
    END IF;
    RAISE INFO 'Table component_translations trouvée';
    
    -- Vérifier l'existence de la table card
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'card') THEN
        RAISE EXCEPTION 'Table card introuvable.';
    END IF;
    RAISE INFO 'Table card trouvée';
    
    -- Compter les cartes avec componentCost
    SELECT COUNT(*) INTO v_inserted_count
    FROM card c
    WHERE c.properties::jsonb->'componentCost' IS NOT NULL
      AND jsonb_typeof(c.properties::jsonb->'componentCost') = 'array'
      AND jsonb_array_length(c.properties::jsonb->'componentCost') > 0;
    
    RAISE INFO 'Cartes avec componentCost valide: %', v_inserted_count;
    
    INSERT INTO temp_extraction_log (log_level, log_message, details) 
    VALUES ('INFO', 'Validation terminée', format('Cartes avec componentCost: %s', v_inserted_count));
    
    -- Reset du compteur
    v_inserted_count := 0;
    
    -- ========================================
    -- PHASE 3: Extraction et insertion
    -- ========================================
    RAISE INFO '';
    RAISE INFO '=== PHASE 3: EXTRACTION ET INSERTION ===';
    v_processing_start := clock_timestamp();
    
    -- Boucle sur chaque combinaison unique (component_name, game_id)
    FOR rec IN (
        SELECT DISTINCT 
            component_elem->>'componentName' AS component_name,
            c.game_id
        FROM card c,
             LATERAL jsonb_array_elements(c.properties::jsonb->'componentCost') AS component_elem
        WHERE c.properties::jsonb->'componentCost' IS NOT NULL
          AND jsonb_typeof(c.properties::jsonb->'componentCost') = 'array'
          AND component_elem->>'componentName' IS NOT NULL
          AND component_elem->>'componentName' != ''
        ORDER BY c.game_id, component_elem->>'componentName'
    ) LOOP
        BEGIN
            v_component_name := rec.component_name;
            v_game_id := rec.game_id;
            
            -- Vérifier si la combinaison existe déjà
            IF EXISTS (
                SELECT 1 FROM component_translations 
                WHERE component_name_fr = v_component_name 
                  AND game_id = v_game_id
            ) THEN
                v_skipped_count := v_skipped_count + 1;
                
                INSERT INTO temp_extraction_log (log_level, log_message, component_name, game_id, details) 
                VALUES ('SKIP', 'Composant déjà existant', v_component_name, v_game_id, 'Ignoré car existe déjà');
                
                -- Log tous les 10 éléments ignorés
                IF v_skipped_count % 10 = 0 THEN
                    RAISE INFO 'Éléments ignorés: %', v_skipped_count;
                END IF;
            ELSE
                -- Insérer le nouveau composant
                INSERT INTO component_translations (
                    component_name_fr,
                    component_name_en,
                    game_id,
                    created_at,
                    updated_at
                ) VALUES (
                    v_component_name,
                    NULL, -- En attente de traduction
                    v_game_id,
                    clock_timestamp(),
                    clock_timestamp()
                );
                
                v_inserted_count := v_inserted_count + 1;
                
                INSERT INTO temp_extraction_log (log_level, log_message, component_name, game_id, details) 
                VALUES ('SUCCESS', 'Composant inséré avec succès', v_component_name, v_game_id, 'Nouveau composant créé');
                
                -- Log tous les 10 éléments insérés
                IF v_inserted_count % 10 = 0 THEN
                    RAISE INFO 'Éléments insérés: %', v_inserted_count;
                END IF;
            END IF;
            
        EXCEPTION WHEN OTHERS THEN
            v_error_count := v_error_count + 1;
            v_error_message := SQLERRM;
            
            INSERT INTO temp_extraction_log (log_level, log_message, component_name, game_id, details) 
            VALUES ('ERROR', format('Erreur lors du traitement: %s', v_error_message), v_component_name, v_game_id, SQLSTATE);
            
            RAISE WARNING 'Erreur lors du traitement de [%] pour le jeu [%]: %', v_component_name, v_game_id, v_error_message;
        END;
    END LOOP;
    
    -- ========================================
    -- PHASE 4: Finalisation et reporting
    -- ========================================
    v_end_time := clock_timestamp();
    
    RAISE INFO '';
    RAISE INFO '=== PHASE 4: RÉSULTATS FINAUX ===';
    RAISE INFO 'Composants insérés: %', v_inserted_count;
    RAISE INFO 'Composants ignorés (déjà existants): %', v_skipped_count;
    RAISE INFO 'Erreurs rencontrées: %', v_error_count;
    RAISE INFO 'Temps de traitement: %', v_end_time - v_processing_start;
    RAISE INFO 'Temps total: %', v_end_time - v_start_time;
    
    INSERT INTO temp_extraction_log (log_level, log_message, details) 
    VALUES ('SUMMARY', 'Traitement terminé', 
            format('Insérés: %s, Ignorés: %s, Erreurs: %s, Durée: %s', 
                   v_inserted_count, v_skipped_count, v_error_count, v_end_time - v_start_time));
    
    -- ========================================
    -- PHASE 5: Affichage du log complet
    -- ========================================
    RAISE INFO '';
    RAISE INFO '=== PHASE 5: LOG DÉTAILLÉ ===';
    
    -- Afficher un résumé par niveau de log
    FOR rec IN (
        SELECT 
            log_level,
            COUNT(*) as count,
            MIN(log_time) as first_occurrence,
            MAX(log_time) as last_occurrence
        FROM temp_extraction_log
        GROUP BY log_level
        ORDER BY 
            CASE log_level
                WHEN 'ERROR' THEN 1
                WHEN 'SKIP' THEN 2
                WHEN 'SUCCESS' THEN 3
                WHEN 'INFO' THEN 4
                WHEN 'SUMMARY' THEN 5
                ELSE 6
            END
    ) LOOP
        RAISE INFO '[%] : % occurrences (% à %)', rec.log_level, rec.count, rec.first_occurrence, rec.last_occurrence;
    END LOOP;
    
    -- Afficher les erreurs s'il y en a
    IF v_error_count > 0 THEN
        RAISE INFO '';
        RAISE INFO '=== DÉTAIL DES ERREURS ===';
        FOR rec IN (
            SELECT log_time, component_name, game_id, log_message, details
            FROM temp_extraction_log
            WHERE log_level = 'ERROR'
            ORDER BY log_time
        ) LOOP
            RAISE INFO '[%] Composant [%] Jeu [%]: % (Code: %)', 
                      rec.log_time, rec.component_name, rec.game_id, rec.log_message, rec.details;
        END LOOP;
    END IF;
    
    -- ========================================
    -- PHASE 6: Vérification finale
    -- ========================================
    RAISE INFO '';
    RAISE INFO '=== PHASE 6: VÉRIFICATION FINALE ===';
    
    -- Compter les traductions par jeu
    FOR rec IN (
        SELECT 
            game_id,
            COUNT(*) as total,
            COUNT(CASE WHEN component_name_en IS NULL THEN 1 END) as en_attente_traduction,
            COUNT(CASE WHEN component_name_en IS NOT NULL THEN 1 END) as traduit
        FROM component_translations
        GROUP BY game_id
        ORDER BY game_id
    ) LOOP
        RAISE INFO 'Jeu % : % composants total (% en attente de traduction, % traduits)', 
                  rec.game_id, rec.total, rec.en_attente_traduction, rec.traduit;
    END LOOP;
    
    RAISE INFO '';
    RAISE INFO '=== SCRIPT TERMINÉ AVEC SUCCÈS ===';
    RAISE INFO 'Prochaine étape recommandée: Remplir les traductions EN pour les component_name_en = NULL';
    
    -- Nettoyage
    DROP TABLE temp_extraction_log;
    
END $$;
