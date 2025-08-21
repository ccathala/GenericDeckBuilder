-- Fichier SQL généré automatiquement pour les cartes Mage Noir
-- Généré le : 2025-08-06 20:16:50
-- Nombre de cartes : 205
-- Cartes avec correspondance FR/EN : 205

-- Modification pour utiliser properties->>'extension' au lieu de extension
DELETE FROM card_localization
WHERE card_id IN (
  SELECT id FROM card 
  WHERE game_id = 'mage_noir' 
  AND (properties::jsonb)->>'extension' = 'Nexus Noir'
);

-- Delete Card avec la syntaxe JSONB valide
DELETE FROM card 
WHERE game_id = 'mage_noir' 
AND (properties::jsonb)->>'extension' = 'Nexus Noir';

--========================================================================================================================
-- Tornade de Feu
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tornade de feu', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 2,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Vent", "quantity": 1},
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Tornade de Feu
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('tornade de feu', E'Inflige 2 dégâts à n''importe quelle cible.\n\nMettez en jeu jusqu''à 2 sorts Flamme de votre défausse, canalisés comme composants.\n\nActivez 1 composant Vent ou Flamme que vous contrôlez et renvoyez le dans votre main au lieu de le défausser.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Tornade%20de%20Feu.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/tornade-de-feu.html', 'fr', 'Tornade de Feu');


--========================================================================================================================
-- Paradoxe Aérien
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('paradoxe aerien', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 0,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Souffle", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Paradoxe Aérien
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('paradoxe aerien', E'Regardez la première carte d''un deck et mettez-là en dessous de celui-ci.\n\nSi vous êtes Mage Noir, vous pouvez préparer cette carte depuis votre défausse une fois par tour.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Paradoxe%20A%C3%A9rien.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/paradoxe-aerien.html', 'fr', 'Paradoxe Aérien');


--========================================================================================================================
-- Sandales des Courants d'Air
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sandales des courants d air', 'mage_noir', '{
  "type": "Équipement : Pieds",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Souffle", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Sandales des Courants d'Air
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sandales des courants d air', E'Lorsqu''un sort quitte le plateau sans aller à la défausse, gagnez 1 PV.\n\nS''il s''agit d''un sort Vent, piochez également 1 carte.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Sandales%20des%20Courants%20d''Air.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/sandales-des-courants-d-air.html', 'fr', 'Sandales des Courants d''Air');


--========================================================================================================================
-- Anneau d'Ether
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('anneau d ether', 'mage_noir', '{
  "type": "Équipement : Anneau",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Anneau d'Ether
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('anneau d ether', E'Une fois par tour, durant votre Phase Principale, vous pouvez échanger 1 Mana de votre réserve avec 1 Mana Air de la plus grosse pile de l''Éther Disponible.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Anneau%20d''Ether.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/anneau-d-ether.html', 'fr', 'Anneau d''Ether');


--========================================================================================================================
-- Arbre Tonnerre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre tonnerre', 'mage_noir', '{
  "type": "Permanent",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Étincelle", "quantity": 2}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Arbre Tonnerre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('arbre tonnerre', E'Lorsqu''il arrive en jeu, défausse 1 Étincelle utilisée comme composant.\n\nAu début de votre tour, vous pouvez mettre 1 Étincelle en préparation depuis votre défausse. Elle gagne : "Rapide".', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Arbre%20Tonnerre.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/arbre-tonnerre.html', 'fr', 'Arbre Tonnerre');


--========================================================================================================================
-- Graine Etincelle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine etincelle', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Graine Etincelle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('graine etincelle', E'Allez chercher 1 carte Foudre dans votre deck, montrez-là à votre adversaire, mettez-là dans votre main, puis mélangez votre deck.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Graine%20Etincelle.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/graine-etincelle.html', 'fr', 'Graine Etincelle');


--========================================================================================================================
-- Récolteur d'Eclairs
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('recolteur d eclairs', 'mage_noir', '{
  "type": "Équipement : Dos",
  "element": "Air",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 3,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Récolteur d'Eclairs
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('recolteur d eclairs', E'Lorsqu''un sort Étincelle, Foudre, Tonnerre, Éclair ou Raijin entre dans votre défausse à la suite de son activation, vous pouvez le mélanger dans votre deck.\n\nLorsqu''un tel sort entre dans votre défausse autrement, vous pouvez l''exiler pour prendre 1 Mana Air dans l''Éther Disponible.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/R%C3%A9colteur%20d''Eclairs.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/recolteur-d-eclairs.html', 'fr', 'Récolteur d''Eclairs');


--========================================================================================================================
-- Electrocution
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('electrocution', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Electrocution
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('electrocution', E'Rapide\n\nLes Équipements adverses perdent leurs effets jusqu''au début de votre prochain tour.\n\nSi vous êtes Mage Noir, inflige 1 dégât à l''adversaire par Équipement qu''il contrôle.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Electrocution.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/electrocution.html', 'fr', 'Electrocution');


--========================================================================================================================
-- Mur d'Ecorce
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('mur d ecorce', 'mage_noir', '{
  "type": "Permanent",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Mur d'Ecorce
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('mur d ecorce', E'Lorsqu''un Permanent Végétal que vous contrôlez devrait être détruit lors du tour adverse, détruisez ce Permanent à la place.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Mur%20d''Ecorce.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/mur-d-ecorce.html', 'fr', 'Mur d''Ecorce');


--========================================================================================================================
-- Rituel d'Abondance
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel d abondance', 'mage_noir', '{
  "type": "Rituel",
  "element": "Minéral",
  "manaCost": {
    "total": 5,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Rituel d'Abondance
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel d abondance', E'Vous passez Mage Noir.\n\nLorsque vous préparez un sort verrouillant 4 Mana ou plus, piochez 1 carte et gagnez 1 PV.\n\nVos sorts Roche ont "Transmutable : Minerai" et "Forge".\n\nVous ne pouvez pas préparer de sorts coûtant 1 Mana ou moins.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Rituel%20d''Abondance.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/rituel-d-abondance.html', 'fr', 'Rituel d''Abondance');


--========================================================================================================================
-- Ailes de Cire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ailes de cire', 'mage_noir', '{
  "type": "Équipement : Dos",
  "element": "Minéral",
  "manaCost": {
    "total": 0,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Vent", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Ailes de Cire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ailes de cire', E'Vous pouvez défausser 1 carte Air de votre main pour préparer ce sort sans le composant Vent requis.\n\nUne fois par tour, durant votre phase principale, libérez 1 Mana verrouillée par ce sort pour récupérer jusqu''à 2 Mana verrouillées par des sorts Soleil.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Ailes%20de%20Cire.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/ailes-de-cire.html', 'fr', 'Ailes de Cire');


--========================================================================================================================
-- Roche Magmatique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('roche magmatique', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Roche Magmatique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('roche magmatique', E'Si ce sort est canalisé, vous pouvez libérer de sa Mana Feu pour qu''il soit considéré par un autre sort comme autant de composants Flamme que de Mana libérée.\n\nCe sort n''est pas une Roche s''il verrouille de la Mana Feu.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Roche%20Magmatique.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/roche-magmatique.html', 'fr', 'Roche Magmatique');


--========================================================================================================================
-- Marteau de Pompéi
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('marteau de pompei', 'mage_noir', '{
  "type": "Équipement : Arme",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 2,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Roche", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Marteau de Pompéi
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('marteau de pompei', E'Au début de votre tour, inflige 1 dégât à tous les joueurs et Permanents. Puis recommencez si vous contrôlez un composant Séisme.\n\nDurant votre phase principale, si vous êtes Mage Noir, vous pouvez défausser un sort Marteau de votre main; l''adversaire doit alors choisir et détruire 1 de ses Permanents.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Marteau%20de%20Pomp%C3%A9i.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/marteau-de-pompei.html', 'fr', 'Marteau de Pompéi');


--========================================================================================================================
-- Coulée de Lave
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('coulee de lave', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 0,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Roche", "quantity": 1},
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Coulée de Lave
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('coulee de lave', E'Transmutable : Magma, Vague\n\nInflige 2*X dégâts à n''importe quelle cible. Ils ne peuvent pas être ignorés ni réduits.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Coul%C3%A9e%20de%20Lave.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/coulee-de-lave.html', 'fr', 'Coulée de Lave');


--========================================================================================================================
-- Pétrification
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('petrification', 'mage_noir', '{
  "type": "Permanent",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 3,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Roche", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Pétrification
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('petrification', E'L''adversaire ne peut pas préparer de sorts, et ses Équipements n''ont pas d''effets.\n\nÉxilez ce sort au début de votre tour, ou si l''adversaire subit des dégâts (en remplacement de ces dégats).', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/P%C3%A9trification.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/petrification.html', 'fr', 'Pétrification');


--========================================================================================================================
-- Sabotage
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sabotage', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Sabotage
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sabotage', E'Transmutable : Infiltration\n\nFaites perdre ses effets à un Équipement coûtant 3 Mana ou moins et ne nécessitant pas de composants.\n\nSi vous êtes Mage Noir, vous pouvez préparer ce sort avec 3 Mana Arcane de plus pour qu''il puisse cibler n''importe quel Équipement.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Sabotage.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/sabotage.html', 'fr', 'Sabotage');


--========================================================================================================================
-- Volcan Actif
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('volcan actif', 'mage_noir', '{
  "type": "Permanent",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 3,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Roche", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Volcan Actif
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('volcan actif', E'Au début de votre tour, vous pouvez défausser 1 composant Flamme que vous contrôlez pour mettre 1 Mana Feu de l''Éther Infini sous ce sort.\nPuis, s''il verrouille au moins autant de Mana Feu que de Mana Minérale, il inflige 9 dégâts à l''adversaire, puis est détruit.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Volcan%20Actif.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/volcan-actif.html', 'fr', 'Volcan Actif');


--========================================================================================================================
-- Peau de Pierre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('peau de pierre', 'mage_noir', '{
  "type": "Équipement : Torse",
  "element": "Minéral",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Roche", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Peau de Pierre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('peau de pierre', E'Durant votre tour, réduisez de 1 les dégâts que vous subissez qui ne sont pas déjà réduits par un autre effet.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Peau%20de%20Pierre.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/peau-de-pierre.html', 'fr', 'Peau de Pierre');


--========================================================================================================================
-- Paradoxe Prodigieux
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('paradoxe prodigieux', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 1,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Graine", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Paradoxe Prodigieux
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('paradoxe prodigieux', E'Lent\n\nLe Permanent de votre choix gagne 1 PV.\n\nSi vous êtes Mage Noir, vous pouvez préparer cette carte depuis votre défausse une fois par tour.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Paradoxe%20Prodigieux.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/paradoxe-prodigieux.html', 'fr', 'Paradoxe Prodigieux');


--========================================================================================================================
-- Echarde Mentale
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('echarde mentale', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Echarde Mentale
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('echarde mentale', E'L''adversaire défausse 1 carte de sa main.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Echarde%20Mentale.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/echarde-mentale.html', 'fr', 'Echarde Mentale');


--========================================================================================================================
-- Dévorer
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('devorer', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Dévorer
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('devorer', E'Lent\n\nDétruisez 1 Permanent dont le coût en Mana est inférieur ou égal à celui d''un Permanent que vous contrôlez pour récupérer la Mana qu''il verrouillait.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/D%C3%A9vorer.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/devorer.html', 'fr', 'Dévorer');


--========================================================================================================================
-- Ronces Mentales
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ronces mentales', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [
    {"componentName": "Mental", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Ronces Mentales
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ronces mentales', E'La taille de main maximale de l''adversaire est réduite de 1 (ou 2 si vous êtes Mage Noir).', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Ronces%20Mentales.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/ronces-mentales.html', 'fr', 'Ronces Mentales');


--========================================================================================================================
-- Inspiration Sylvestre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('inspiration sylvestre', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Inspiration Sylvestre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('inspiration sylvestre', E'Piochez 1 carte.\n\nMettez en jeu 1 Graine de votre défausse, canalisée comme composant, pour faire gagner Protecteur à un Permanent avec PV jusqu''au début de votre prochain tour.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Inspiration%20Sylvestre.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/inspiration-sylvestre.html', 'fr', 'Inspiration Sylvestre');


--========================================================================================================================
-- Champ de Myosotis
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('champ de myosotis', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 1,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Champ de Myosotis
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('champ de myosotis', E'Transmutable : Fleur\n\nAu début de votre tour, mettez 1 Mana Végétal (Arcane si vous êtes Mage Noir) de votre réserve sous ce sort pour exiler la première carte de la défausse adverse.\n\nGagnez 1 PV lorsque ce Permanent exile une carte.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Champ%20de%20Myosotis.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/champ-de-myosotis.html', 'fr', 'Champ de Myosotis');


--========================================================================================================================
-- Rituel de Régénération
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel de regeneration', 'mage_noir', '{
  "type": "Rituel",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Rituel de Régénération
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel de regeneration', E'Vous passez Mage Noir.\n\nGagnez 1 PV quand vous piochez 1 carte.\n\nVous piochez depuis le dessus de votre défausse. Vous défaussez vers le dessus de votre deck (sauf défausse depuis le deck).\n\nSi votre défausse est vide, exilez ce rituel.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Rituel%20de%20R%C3%A9g%C3%A9n%C3%A9ration.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/rituel-de-regeneration.html', 'fr', 'Rituel de Régénération');


--========================================================================================================================
-- Evaporation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('evaporation', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Evaporation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('evaporation', E'Remettez jusqu''à 3 Mana Eau de votre réserve dans l''Éther Infini. Récupérez autant de Mana Air ou Minéral de l''Éther Infini (dans n''importe quelle combinaison).', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Evaporation.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/evaporation.html', 'fr', 'Evaporation');


--========================================================================================================================
-- Flamme Pourpre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('flamme pourpre', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 3,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Flamme Pourpre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('flamme pourpre', E'Défaussez ce sort lorsqu''il est utilisé comme composant plus d''1 fois par tour.\n\nSi vous êtes Mage Noir, tout sort utilisant ce composant gagne l''effet :\n\n"Lorsque ce sort inflige des dégâts, il en inflige 1 de plus, puis vous inflige 1 dégât."', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Flamme%20Pourpre.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/flamme-pourpre.html', 'fr', 'Flamme Pourpre');


--========================================================================================================================
-- Soleil de Plomb
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('soleil de plomb', 'mage_noir', '{
  "type": "Permanent",
  "element": "Feu",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 4,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Soleil de Plomb
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('soleil de plomb', E'Unique\n\nZénith : Au début de votre tour, chaque Équipement adverse libère 1 Mana (choisi par l''adversaire).\nPuis TOUT Équipement ne verrouillant pas de Mana est détruit.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Soleil%20de%20Plomb.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/soleil-de-plomb.html', 'fr', 'Soleil de Plomb');


--========================================================================================================================
-- Lance Solaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lance solaire', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 0,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Lance Solaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lance solaire', E'Inflige autant de dégât à l''adversaire que ce sort verrouille de Mana Feu, jusqu''à 4.\n\nZénith : Une fois par tour, durant votre phase principale, prenez 1 Mana Feu d''un sort Soleil et mettez la sous ce sort.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Lance%20Solaire.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/lance-solaire.html', 'fr', 'Lance Solaire');


--========================================================================================================================
-- Fouet du Tourment
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fouet du tourment', 'mage_noir', '{
  "type": "Équipement : Arme",
  "element": "Feu",
  "manaCost": {
    "total": 3,
    "manaVegetal": 1,
    "manaFeu": 2,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Ronce", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Fouet du Tourment
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fouet du tourment', E'Au début de votre tour, l''adversaire choisit une option :\n- Il défausse 1 carte de sa main\n- Il perd 3 PV\n\nÁ la fin de votre tour, si vous êtes Mage Noir, vous pouvez payer 4 Mana Feu/Végétal pour appliquer l''effet de début de tour.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Fouet%20du%20Tourment.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/fouet-du-tourment.html', 'fr', 'Fouet du Tourment');


--========================================================================================================================
-- Rivière Infernale
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('riviere infernale', 'mage_noir', '{
  "type": "Permanent",
  "element": "Feu",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 2,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Rivière Infernale
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('riviere infernale', E'Unique\n\nAu début de votre tour, exile la carte du dessous de votre deck. Ce tour, vous pouvez la préparer si c''est un sort Feu; perdez 2 PV si vous le faites.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Rivi%C3%A8re%20Infernale.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/riviere-infernale.html', 'fr', 'Rivière Infernale');


--========================================================================================================================
-- Jonglerie Pyrotechnique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('jonglerie pyrotechnique', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Jonglerie Pyrotechnique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('jonglerie pyrotechnique', E'Ce tour, le prochain sort Projectile, Boule ou Écharde que vous activez retourne dans votre main depuis la défausse à la fin du tour.\n\nA tout moment, vous pouvez payer 1 Mana Air et défausser ce sort depuis votre main pour piocher 1 carte.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Jonglerie%20Pyrotechnique.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/jonglerie-pyrotechnique.html', 'fr', 'Jonglerie Pyrotechnique');


--========================================================================================================================
-- Rituel du Pacte Pourpre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du pacte pourpre', 'mage_noir', '{
  "type": "Rituel",
  "element": "Feu",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 2,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Rituel du Pacte Pourpre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du pacte pourpre', E'Vous passez Mage Noir.\n\nLorsque ce sort entre sur le plateau, piochez trois cartes.\n\nLorsque vous préparez un sort, perdez un PV.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Rituel%20du%20Pacte%20Pourpre.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/rituel-du-pacte-pourpre.html', 'fr', 'Rituel du Pacte Pourpre');


--========================================================================================================================
-- Cercueil de Glace
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('cercueil de glace', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Cercueil de Glace
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('cercueil de glace', E'Tant que ce Permanent verrouille de la Mana Eau, aucune carte ne peut sortir des défausses des joueurs sauf pour aller en exil.\n\nAu début de votre tour, libère 1 Mana Eau.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Cercueil%20de%20Glace.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/cercueil-de-glace.html', 'fr', 'Cercueil de Glace');


--========================================================================================================================
-- Glacier
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('glacier', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Glacier
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('glacier', E'Une fois par tour, durant votre phase principale, mettez 1 Mana de l''Éther Disponible sous ce sort.\n\nTransmutable : Condensation.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Glacier.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/glacier.html', 'fr', 'Glacier');


--========================================================================================================================
-- Paradoxe Aquatique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('paradoxe aquatique', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 0,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Goutte", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Paradoxe Aquatique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('paradoxe aquatique', E'Mettez 1 Mana de votre réserve sous un sort du plateau.\n\nSi vous êtes Mage Noir, vous pouvez préparer cette carte depuis votre défausse une fois par tour.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Paradoxe%20Aquatique.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/paradoxe-aquatique.html', 'fr', 'Paradoxe Aquatique');


--========================================================================================================================
-- Gel
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('gel', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Gel
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('gel', E'Transmutable : Glace\n\nJusqu''au début de votre prochain tour, aucun Mana Eau ne peut sortir de l''Éther Disponible.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Gel.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/gel.html', 'fr', 'Gel');


--========================================================================================================================
-- Erosion
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('erosion', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Erosion
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('erosion', E'Rapide, si vous contrôlez une Rivière ou un Océan.\n\nLibérez toute la Mana d''1 sort non-Rituel (en choisissant la répartition).\n\nJusqu''à 2 sorts Minérals non-Sable gagnent : "Transmutable : Sable".', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Erosion.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/erosion.html', 'fr', 'Erosion');


--========================================================================================================================
-- Rivière Sereine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('riviere sereine', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Rivière Sereine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('riviere sereine', E'Unique\n\nAu début de votre tour, exile la carte du dessous de votre deck. Ce tour, vous pouvez la préparer si vous canalisez un sort.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Rivi%C3%A8re%20Sereine.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/riviere-sereine.html', 'fr', 'Rivière Sereine');


--========================================================================================================================
-- Crue du Nil
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('crue du nil', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Rivière", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Crue du Nil
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('crue du nil', E'Mettez en jeu les 3 premières cartes de votre deck. Canalisez celles qui peuvent l''être. Mélangez les autres dans votre deck à la fin du tour.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Crue%20du%20Nil.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/crue-du-nil.html', 'fr', 'Crue du Nil');


--========================================================================================================================
-- Reflux d'Inspiration
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('reflux d inspiration', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Reflux d'Inspiration
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('reflux d inspiration', E'Piochez 3 cartes, puis mettez 2 cartes de votre main au-dessus de votre deck dans l''ordre de votre choix.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Reflux%20d''Inspiration.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/reflux-d-inspiration.html', 'fr', 'Reflux d''Inspiration');


--========================================================================================================================
-- Voeu de la Guérisseuse
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('voeu de la guerisseuse', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Voeu de la Guérisseuse
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('voeu de la guerisseuse', E'Gagnez 1 PV.\n\nAjoutez à votre main 1 carte de votre sideboard. Vous ne pouvez pas la préparer ce tour.\n\n(Constituez vous un sideboard de 5 cartes avant le début de la partie si vous n''en avez pas)', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Voeu%20de%20la%20Gu%C3%A9risseuse.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/voeu-de-la-guerisseuse.html', 'fr', 'Voeu de la Guérisseuse');


--========================================================================================================================
-- Blast du Vide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('blast du vide', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Blast du Vide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('blast du vide', E'Vous pouvez préparer ce sort depuis votre défausse, et ne pouvez pas le faire d''ailleurs.\n\nInflige 2 dégâts à n''importe quelle cible, puis vous pouvez défausser 1 carte de votre main pour infliger 1 dégât à n''importe quelle cible.\n\nLorsque ce sort quitte le plateau, exilez-le à la place.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Blast%20du%20Vide.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/blast-du-vide.html', 'fr', 'Blast du Vide');


--========================================================================================================================
-- Prophétie de Ruine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('prophetie de ruine', 'mage_noir', '{
  "type": "Permanent",
  "element": "Arcane",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [
    {"componentName": "Suppression", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Prophétie de Ruine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('prophetie de ruine', E'Ne peut être préparé que par un Mage Noir.\n\nAu début du tour d''un joueur, celui-ci défausse un sort de coût non-nul (hors Rituel) qu''il contrôle. S''il ne peut pas, il défausse une carte de sa main, perd 2 PV, vous piochez une carte et gagnez 2 PV, puis détruisez Prophétie de Ruine.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Proph%C3%A9tie%20de%20Ruine.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/prophetie-de-ruine.html', 'fr', 'Prophétie de Ruine');


--========================================================================================================================
-- Rituel de Cassandre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel de cassandre', 'mage_noir', '{
  "type": "Rituel",
  "element": "Arcane",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 4
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Rituel de Cassandre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel de cassandre', E'Vous passez Mage Noir.\n\nA tout moment, vous pouvez regarder la carte du dessus de n''importe quel deck.\n\nA la fin de votre tour, vos sorts ont : "Unique".', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Rituel%20de%20Cassandre.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/rituel-de-cassandre.html', 'fr', 'Rituel de Cassandre');


--========================================================================================================================
-- Suppression du Futur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('suppression du futur', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Suppression du Futur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('suppression du futur', E'Regardez les 2 cartes du dessus d''un deck, +1 carte par composant Futur que vous contrôlez.\nVous pouvez défausser l''une d''elles. Remettez le reste au dessus du deck dans l''ordre de votre choix.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Suppression%20du%20Futur.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/suppression-du-futur.html', 'fr', 'Suppression du Futur');


--========================================================================================================================
-- Moteur Anomalique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('moteur anomalique', 'mage_noir', '{
  "type": "Permanent",
  "element": "Arcane",
  "manaCost": {
    "total": 5,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [
    {"componentName": "Paradoxe", "quantity": 3}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Moteur Anomalique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('moteur anomalique', E'Ne peut être préparé que par un Mage Noir.\n\nUne fois par tour, vous pouvez préparer 1 carte non-Permanent/Équipement/Rituel de votre défausse. Elle gagne : "Si ce sort quitte le plateau, exilez-le à la place".', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Moteur%20Anomalique.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/moteur-anomalique.html', 'fr', 'Moteur Anomalique');


--========================================================================================================================
-- Faim des Temps
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('faim des temps', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Nexus Noir",
  "artwork": "Cyrusa"
}');

-- Localisations pour Faim des Temps
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('faim des temps', E'Exilez une carte d''une défausse. Piochez une carte si cet effet exile un Rituel. Gagnez un PV si cet effet exile un Permanent.\n\nDurant votre phase principale, vous pouvez reprendre cette carte en main depuis votre défausse en en exilant 3 autre cartes.', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/Cards/FR/Faim%20des%20Temps.jpg', 'https://astralvault.net/games/SA/cyrusa/MageNoir/FanCards/NexusNoir/CardPages/FR/faim-des-temps.html', 'fr', 'Faim des Temps');


