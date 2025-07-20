-- Insérer des règles par défaut pour le jeu "mage_noir"
-- Ces règles seront utilisées pour valider les decks

-- La colonne game_id fait référence à la clé primaire de la table game
INSERT INTO deck_ruleset (min_cards, max_copies_per_card, game_id) 
VALUES (40, 4, 'mage_noir')
ON CONFLICT (game_id) DO UPDATE SET 
  min_cards = 40, 
  max_copies_per_card = 4;

-- Si vous avez d'autres jeux, vous pouvez ajouter leurs règles ici
-- Par exemple pour un jeu hypothétique "other_game":
-- INSERT INTO deckruleset (min_cards, max_copies_per_card, game_id) 
-- VALUES (30, 3, 'other_game')
-- ON CONFLICT (game_id) DO UPDATE SET 
--   min_cards = 30, 
--   max_copies_per_card = 3;
