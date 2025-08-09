-- Migration: Create deck visualization tables
-- Date: 2025-08-09
-- Description: Création des tables pour la fonctionnalité de visualisation des decks avec colonnes personnalisables

-- Table pour les groupes de colonnes
CREATE TABLE deck_column_group (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    deck_id UUID NOT NULL REFERENCES deck(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    display_order INTEGER NOT NULL DEFAULT 0,
    color_hex VARCHAR(7) NOT NULL DEFAULT '#6B7280',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT unique_deck_column_name UNIQUE(deck_id, name),
    CONSTRAINT unique_deck_column_order UNIQUE(deck_id, display_order),
    CONSTRAINT valid_color_hex CHECK (color_hex ~ '^#[0-9A-Fa-f]{6}$')
);

-- Index pour optimiser les requêtes
CREATE INDEX idx_deck_column_group_deck_id ON deck_column_group(deck_id);
CREATE INDEX idx_deck_column_group_order ON deck_column_group(deck_id, display_order);

-- Ajout des colonnes à la table deck_card existante
ALTER TABLE deck_card 
ADD COLUMN column_group_id UUID REFERENCES deck_column_group(id) ON DELETE SET NULL,
ADD COLUMN position_in_column INTEGER;

-- Index pour optimiser les requêtes de visualisation
CREATE INDEX idx_deck_card_column_group ON deck_card(column_group_id, position_in_column);

-- Commentaires pour documentation
COMMENT ON TABLE deck_column_group IS 'Groupes de colonnes personnalisables pour la visualisation des decks';
COMMENT ON COLUMN deck_column_group.name IS 'Nom de la colonne (ex: Créatures, Sorts)';
COMMENT ON COLUMN deck_column_group.display_order IS 'Ordre d''affichage des colonnes (0, 1, 2...)';
COMMENT ON COLUMN deck_column_group.color_hex IS 'Couleur de la colonne en format hexadécimal (#RRGGBB)';
COMMENT ON COLUMN deck_card.column_group_id IS 'Référence vers le groupe de colonne pour la visualisation';
COMMENT ON COLUMN deck_card.position_in_column IS 'Position de la carte dans la pile (0 = bas de pile/position haute)';
