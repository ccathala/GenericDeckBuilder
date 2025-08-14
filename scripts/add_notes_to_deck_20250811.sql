-- Migration pour ajouter le champ notes à la table deck
-- Date: 11 Août 2025
-- Description: Ajout d'un champ notes de type TEXT pour permettre aux utilisateurs
--              de consigner leurs réflexions sur leurs decks

ALTER TABLE deck 
ADD COLUMN notes TEXT;
