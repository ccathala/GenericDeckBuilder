-- Fichier SQL généré automatiquement pour les cartes Mage Noir
-- Généré le : 2025-07-25 18:40:17
-- Nombre de cartes : 205
-- Cartes avec correspondance FR/EN : 205

-- Delete CardLocalization
DELETE FROM card_localization
WHERE card_id IN (
  SELECT id FROM card WHERE game_id = 'mage_noir'
);

-- Delete Card
DELETE FROM card
WHERE game_id = 'mage_noir';

--========================================================================================================================
-- Air
--========================================================================================================================

--========================================================================================================================
-- Acceleration
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('acceleration', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Acceleration
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('acceleration', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Arcane de moins à préparer.Piochez 2 cartes.', 'https://magenoir.com/cards/FR/Air/Acceleration.png', 'fr', 'Acceleration'),
('acceleration', E'If you''re a Mage Noir, this spell costs 1 less Arcane Mana to prepare.Draw 2 cards.', 'https://magenoir.com/cards/EN/air/Acceleration.png', 'en', 'Acceleration');

--========================================================================================================================
-- Appel De La Foudre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('appel de la foudre', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Étincelle", "quantity": 1}
  ],
  "extension": "Électrique",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Appel De La Foudre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('appel de la foudre', E'Inflige 2 points de dégâts à n''importe quelle cible.Vous pouvez montrer 1 sort Tonnerre de votre deck à votre adversaire, puis mélanger votre deck, et mettre ce Tonnerre au dessus de celui-ci.Si vous êtes Mage Noir, mettez-le dans votre main à la place.', 'https://magenoir.com/cards/FR/Air/appel_de_la_foudre.png', 'fr', 'Appel De La Foudre'),
('appel de la foudre', E'Inflicts 2 damage to any target.You may take 1 Thunder card from your deck, show it to the opponent, then shuffle your deck and put that card on top of it.If you''re a Mage Noir, put it into your hand instead.', 'https://magenoir.com/cards/EN/air/lightning_call.png', 'en', 'Lightning Call');

--========================================================================================================================
-- Arc De Foudre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arc de foudre', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Étincelle", "quantity": 2}
  ],
  "extension": "Électrique",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Arc De Foudre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arc de foudre', E'Rapide (Ce sort peut être activé à tout moment )Inflige 2 points de dégâts à n''importe quelle cible.Appliquez les effets d''1 composant Étincelle que vous contrôlez.', 'https://magenoir.com/cards/FR/Air/arc_de_foudre.png', 'fr', 'Arc De Foudre'),
('arc de foudre', E'Quickcast (This spell can be activated at any time)Inflicts 2 damage to any target.Apply the effects of 1 Spark component you control.', 'https://magenoir.com/cards/EN/air/lightning_arc.png', 'en', 'Lightning Arc');

--========================================================================================================================
-- Baguette Des Courants D Air
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('baguette des courants d air', 'mage_noir', '{
  "type": "Équipement : Arme",
  "element": "Air",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 3,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Vent", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Baguette Des Courants D Air
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('baguette des courants d air', E'Lorsqu''il arrive en jeu, défausse le composant Vent utilisé pour le lancer, sauf si vous êtes Mage Noir.Au début de votre tour, piochez 1 carte, puis ce sort inflige 1 point de dégâts à l''adversaire.', 'https://magenoir.com/cards/FR/Air/Baguette-des-courants-d-air.png', 'fr', 'Baguette Des Courants D Air'),
('baguette des courants d air', E'When put into play, discard the Wind component used to cast it unless you''re a Mage Noir. At the beginning of your turn, draw 1 card, then this spell inflicts 1 damage to the opponent.', 'https://magenoir.com/cards/EN/air/Wand-of-air-currents.png', 'en', 'Wand Of Air Currents');

--========================================================================================================================
-- Balayage Puissant
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('balayage puissant', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 4,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Balayage Puissant
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('balayage puissant', E'Renvoyez 1 Équipement dans la main de son propriétaire. Si vous êtes Mage Noir, piochez 1 carte.', 'https://magenoir.com/cards/FR/Air/Balayage-puissant.png', 'fr', 'Balayage Puissant'),
('balayage puissant', E'Return 1 piece of Equipment to its owner''s hand. If you''re a Mage Noir, draw 1 card.', 'https://magenoir.com/cards/EN/air/Powerful-swipe.png', 'en', 'Powerful Swipe');

--========================================================================================================================
-- Bobine Tesla
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('bobine tesla', 'mage_noir', '{
  "type": "Permanent",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Bobine Tesla
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('bobine tesla', E'Si un sort Étincelle ou Foudre inflige des dégâts à Bobine Tesla, piochez 1 carte.Si un autre sort lui inflige des dégâts, inflige autant de dégâts à l’adversaire.', 'https://magenoir.com/cards/FR/Air/bobine_tesla.png', 'fr', 'Bobine Tesla'),
('bobine tesla', E'If a Spark or Lightning spell inflicts damage to Tesla coil, you draw 1 card.If another spell inflicts damage to Tesla coil, Tesla coil inflicts that much damage to the opponent.', 'https://magenoir.com/cards/EN/air/tesla_coil.png', 'en', 'Tesla Coil');

--========================================================================================================================
-- Bottes Statiques
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('bottes statiques', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Luca Siméone"
}');

-- Localisations pour Bottes Statiques
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('bottes statiques', E'Lorsque vous piochez votre deuxième carte chaque tour, inflige 3 points de dégâts à l''adversaire.', 'https://magenoir.com/cards/FR/Air/bottes_statique.png', 'fr', 'Bottes Statiques'),
('bottes statiques', E'When you draw your second card each turn, inflicts 3 damage to the opponent', 'https://magenoir.com/cards/EN/air/static_boots.png', 'en', 'Static Boots');

--========================================================================================================================
-- Chaine De Foudre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('chaine de foudre', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Étincelle", "quantity": 1}
  ],
  "extension": "Électrique",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Chaine De Foudre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('chaine de foudre', E'Inflige 1 point de dégâts à n''importe quelle cible. Puis recommencez pour chaque exemplaire de Chaîne de foudre dans votre défausse.Appliquez les effets d''un sort Foudre de votre défausse, excepté un sort Chaîne de foudre.', 'https://magenoir.com/cards/FR/Air/chaine_de_foudre.png', 'fr', 'Chaine De Foudre'),
('chaine de foudre', E'Inflicts 1 damage to any target.Repeat for each copy of Lightning chain in your discard pile.Apply the effects of a Lightning spell from your discard pile, except a Lightning chain spell.', 'https://magenoir.com/cards/EN/air/lightning_chain.png', 'en', 'Lightning Chain');

--========================================================================================================================
-- Eclair D Inspiration
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('eclair d inspiration', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Eclair D Inspiration
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('eclair d inspiration', E'Piochez 1 carte.Piochez 1 carte supplémentaire pour chaque composant Inspiration que vous contrôlez.', 'https://magenoir.com/cards/FR/Air/eclair_d_inspiration.png', 'fr', 'Eclair D Inspiration'),
('eclair d inspiration', E'Draw 1 card.Draw 1 additional card for each Inspiration component you control.', 'https://magenoir.com/cards/EN/air/flash_inspiration.png', 'en', 'Flash Of Inspiration');

--========================================================================================================================
-- Etincelle De Flamme
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('etincelle de flamme', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Etincelle De Flamme
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('etincelle de flamme', E'Après que ce sort est utilisé comme composant, défaussez-le, sauf si vous êtes Mage Noir.Lorsque ce sort est défaussé depuis le plateau, inflige 1 point de dégâts à l''adversaire.', 'https://magenoir.com/cards/FR/Air/etincelle_de_flamme.png', 'fr', 'Etincelle De Flamme'),
('etincelle de flamme', E'After this spell is used as a component, discard it unless you''re a Mage Noir.When this spell is discarded from play, it inflicts 1 damage to the opponent.', 'https://magenoir.com/cards/EN/air/flame_spark.png', 'en', 'Flame Spark');

--========================================================================================================================
-- Etincelle Electrique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('etincelle electrique', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Etincelle Electrique
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('etincelle electrique', E'Inflige 1 point de dégâts à l''adversaire.Piochez 1 carte.Défaussez-vous d''1 carte en main.', 'https://magenoir.com/cards/FR/Air/etincelle_electrique.png', 'fr', 'Etincelle Electrique'),
('etincelle electrique', E'Inflicts 1 damage to the opponent.Draw 1 card.Discard 1 card from hand.', 'https://magenoir.com/cards/EN/air/electric_spark.png', 'en', 'Electric Spark');

--========================================================================================================================
-- Etincelle Statique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('etincelle statique', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Luca Siméone"
}');

-- Localisations pour Etincelle Statique
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('etincelle statique', E'Lorsque ce sort est défaussé depuis votre main, il applique ses effets.Inflige 1 point de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Air/etincelle_statique.png', 'fr', 'Etincelle Statique'),
('etincelle statique', E'When this spell is discarded from hand, it applies its effects.Inflicts 1 damage to any target.', 'https://magenoir.com/cards/EN/air/static_spark.png', 'en', 'Static Spark');

--========================================================================================================================
-- Graine Dans Le Vent
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine dans le vent', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Graine Dans Le Vent
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('graine dans le vent', E'Ce sort coûte 1 Mana Air de moins si vous contrôlez un composant Souffle. Lorsque ce sort quitte le plateau, piochez 1 carte.', 'https://magenoir.com/cards/FR/Air/Graine-dans-le-vent.png', 'fr', 'Graine Dans Le Vent'),
('graine dans le vent', E'This spell costs 1 less Air Mana if you control a Breath component. When this spell leaves play, draw 1 card.', 'https://magenoir.com/cards/EN/air/Seed-in-the-wind.png', 'en', 'Seed In The Wind');

--========================================================================================================================
-- Lame D Air
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lame d air', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Souffle", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Lame D Air
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('lame d air', E'Inflige 3 points de dégâts à n''importe quelle cible. Ils ne peuvent pas être ignorés, réduits, ni redirigés.Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://magenoir.com/cards/FR/Air/Lame-d-air.png', 'fr', 'Lame D Air'),
('lame d air', E'Inflicts 3 damage to any target. It cannot be ignored, reduced or redirected.Put 1 Breath component you control back into your deck, third from the top.', 'https://magenoir.com/cards/EN/air/Air-blade.png', 'en', 'Air Blade');

--========================================================================================================================
-- Lame De Foudre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lame de foudre', 'mage_noir', '{
  "type": "Équipement : Arme",
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
    {"componentName": "Étincelle1", "quantity": 1}
  ],
  "extension": "Électrique",
  "artwork": "Luca Siméone"
}');

-- Localisations pour Lame De Foudre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('lame de foudre', E'Une fois par tour pendant votre phase principale, inflige 2 points de dégâts à l''adversaire.Si l''adversaire ne subit aucun de ces dégâts, choisissez 1 Équipement qu''il contrôle : celui-ci n''applique plus ses effets jusqu''à la fin de votre tour.', 'https://magenoir.com/cards/FR/Air/lame_de_foudre.png', 'fr', 'Lame De Foudre'),
('lame de foudre', E'Once per turn during your main phase, inflicts 2 damage to the opponent.If the opponent doesn''t take any damage this way, choose 1 piece of Equipment they control: it doesn''t apply its effects until the end of your turn.', 'https://magenoir.com/cards/EN/air/lightning_blade.png', 'en', 'Lightning Blade');

--========================================================================================================================
-- Rituel Du Vide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du vide', 'mage_noir', '{
  "type": "Rituel",
  "element": "Air",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Rituel Du Vide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel du vide', E'Vous passez Mage Noir. Votre taille de main maximale devient 4. Défaussez-vous immédiatement pour avoir 4 cartes maximum en main. Durant votre tour, défaussez 1 carte de votre main pour infliger 1 point de dégâts à n''importe quelle cible. (Vous pouvez le faire plusieurs fois par tour)', 'https://magenoir.com/cards/FR/Air/Rituel-du-vide.png', 'fr', 'Rituel Du Vide'),
('rituel du vide', E'You become a Mage Noir. Your maximum hand size becomes 4. Discard right away to have 4 cards maximum in hand. During your turn, you may discard a card from your hand to inflict 1 damage to any target. (You may do this multiple times per turn.)', 'https://magenoir.com/cards/EN/air/Emptiness-ritual.png', 'en', 'Emptiness Ritual');

--========================================================================================================================
-- Rituel Supraconducteur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel supraconducteur', 'mage_noir', '{
  "type": "Rituel",
  "element": "Air",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Rituel Supraconducteur
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel supraconducteur', E'Vous passez Mage Noir.Les effets de dégâts des sorts que vous activez durant le tour de votre adversaire sont augmentés de 1.Durant votre tour, vos sorts ne peuvent pas infliger plus de 2 dégâts à la fois.', 'https://magenoir.com/cards/FR/Air/rituel_supraconducteur.png', 'fr', 'Rituel Supraconducteur'),
('rituel supraconducteur', E'You become a Mage Noir.Damage from spells you activate during the opponent''s turn is increased by 1. During your turn, your spells cannot inflict more than 2 damage at once.', 'https://magenoir.com/cards/EN/air/supraconductor_ritual.png', 'en', 'Superconductor Ritual');

--========================================================================================================================
-- Robe Du Hurleur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('robe du hurleur', 'mage_noir', '{
  "type": "Équipement : Torse",
  "element": "Air",
  "manaCost": {
    "total": 5,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 3,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Robe Du Hurleur
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('robe du hurleur', E'Ne peut être préparé que par un Mage Noir. Les sorts Air que vous préparez coûtent 1 Mana Air de moins. Les dégâts des sorts Air que vous contrôlez sont augmentés de 1.', 'https://magenoir.com/cards/FR/Air/Robe-du-hurleur.png', 'fr', 'Robe Du Hurleur'),
('robe du hurleur', E'Can only be prepared by a Mage Noir Air spells you prepare cost 1 less Air Mana. Damage from Air spells you control is increased by 1.', 'https://magenoir.com/cards/EN/air/Howlers-robe.png', 'en', 'Howlers Robe');

--========================================================================================================================
-- Rugissement De Raijin
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rugissement de raijin', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Foudre", "quantity": 1}
  ],
  "extension": "Électrique",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Rugissement De Raijin
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rugissement de raijin', E'Si vous êtes Mage Noir, ce sort gagne : "Rapide". (Ce sort peut être activé à tout moment )Inflige 3 points de dégâts à n''importe quelle cible.Appliquez les effets d''un composant Foudre que vous contrôlez, puis défaussez-le.', 'https://magenoir.com/cards/FR/Air/rugissement_de_raijin.png', 'fr', 'Rugissement De Raijin'),
('rugissement de raijin', E'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Inflicts 3 damage to any target.Apply the effects of a Lightning component you control, then discard it.', 'https://magenoir.com/cards/EN/air/raijin_s_roar.png', 'en', 'Raijin S Roar');

--========================================================================================================================
-- Souffle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('souffle', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Souffle
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('souffle', E'Prenez jusqu''à 2 Mana Air dans l''Ether Disponible.', 'https://magenoir.com/cards/FR/Air/Souffle.png', 'fr', 'Souffle'),
('souffle', E'Take up to 2 Air Mana from the Available Ether.', 'https://magenoir.com/cards/EN/air/Breath.png', 'en', 'Breath');

--========================================================================================================================
-- Souffle De Flammes
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('souffle de flammes', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Souffle De Flammes
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('souffle de flammes', E'Inflige 3 points de dégâts à 1 Permanent. Ils ne peuvent pas être ignorés, réduits, ni redirigés. Après que ce sort est utilisé comme composant, défaussez-le. Vous pouvez payer 1 Mana Feu ou Air pour ne pas le défausser.', 'https://magenoir.com/cards/FR/Air/Souffle-de-flammes.png', 'fr', 'Souffle De Flammes'),
('souffle de flammes', E'Inflicts 3 damage to any 1 Permanent. It cannot be ignored, reduced or redirected. After this spell is used as a component, discard it. You may pay 1 Fire or Air Mana to prevent it from being discarded.', 'https://magenoir.com/cards/EN/air/Breath-of-flames.png', 'en', 'Breath Of Flames');

--========================================================================================================================
-- Souffle De La Guerisseuse
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('souffle de la guerisseuse', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Souffle De La Guerisseuse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('souffle de la guerisseuse', E'Vous gagnez 1 Point de Vie puis piochez 1 carte. Si vous contrôlez un composant Souffle, gagnez à nouveau 1 Point de Vie.', 'https://magenoir.com/cards/FR/Air/Souffle-de-la-guerisseuse.png', 'fr', 'Souffle De La Guerisseuse'),
('souffle de la guerisseuse', E'You gain 1 Health Point and draw 1 card. If you control a Breath component, gain 1 HP again.', 'https://magenoir.com/cards/EN/air/Healers-breath.png', 'en', 'Healers Breath');

--========================================================================================================================
-- Souffle Etincelle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('souffle etincelle', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Souffle Etincelle
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('souffle etincelle', E'Inflige 1 point de dégâts à 1 Permanent.Prenez 1 Mana Air dans l''Éther Disponible.', 'https://magenoir.com/cards/FR/Air/souffle_etincelle.png', 'fr', 'Souffle Etincelle'),
('souffle etincelle', E'Inflicts 1 damage to 1 Permanent.Take 1 Air Mana from the Available Ether.', 'https://magenoir.com/cards/EN/air/spark_breath.png', 'en', 'Spark Breath');

--========================================================================================================================
-- Supraconductivite
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('supraconductivite', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Infiltration1", "quantity": 1}
  ],
  "extension": "Glace",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Supraconductivite
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('supraconductivite', E'Vos sorts qui ont Lent gagnent : "Rapide". (Ces sorts peuvent être activés à tout moment )(Un sort qui a Lent et Rapide peut être activé à tout moment, sauf le tour durant lequel il a été préparé.)', 'https://magenoir.com/cards/FR/Air/supraconductivite.png', 'fr', 'Supraconductivite'),
('supraconductivite', E'Your spells with Slowcast gain: "Quickcast". (This spell can be activated at any time) (A spell with Slowcast and Quickcast can be activated at any time except the turn it was prepared.)', 'https://magenoir.com/cards/EN/air/superconductivity.png', 'en', 'Superconductivity');

--========================================================================================================================
-- Tonnerre De Zeus
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tonnerre de zeus', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 3,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Étincelle", "quantity": 1}
  ],
  "extension": "Électrique",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Tonnerre De Zeus
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('tonnerre de zeus', E'Ne peut être préparé que par un Mage Noir.Rapide (Ce sort peut être activé à tout moment)Inflige 5 points de dégâts à l''adversaire.Jusqu''au début de votre prochain tour, l''adversaire ne peut gagner des cartes en main que durant sa phase de pioche.(Les effets annulés ainsi sont ignorés.)', 'https://magenoir.com/cards/FR/Air/tonnerre_de_zeus.png', 'fr', 'Tonnerre De Zeus'),
('tonnerre de zeus', E'Can only be prepared by a Mage Noir.Quickcast (This spell can be activated at any time)Inflicts 5 damage to the opponent.Until the beginning of your next turn, the opponent can only add cards to their hand during their draw phase. (Effects negated this way are ignored)', 'https://magenoir.com/cards/EN/air/zeus_s_thunder.png', 'en', 'Zeus S Thunder');

--========================================================================================================================
-- Tonnerre Etourdissant
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tonnerre etourdissant', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 3,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Tonnerre Etourdissant
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('tonnerre etourdissant', E'Rapide (Ce sort peut être activé à tout moment )Jusqu''au début de votre prochain tour, TOUS les sorts gagnent : "Lent". (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )', 'https://magenoir.com/cards/FR/Air/tonnerre_etourdissant.png', 'fr', 'Tonnerre Etourdissant'),
('tonnerre etourdissant', E'Quickcast (This spell can be activated at any time)Until the beginning of your next turn, ALL spells gain: "Slowcast". (This spell can''t be activated on the turn it was prepared)', 'https://magenoir.com/cards/EN/air/stunning_thunder.png', 'en', 'Stunning Thunder');

--========================================================================================================================
-- Tornade
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tornade', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 3,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Vent", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Tornade
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('tornade', E'Inflige 4 points de dégâts à n''importe quelle cible.Appliquez les effets d''1 composant Vent que vous contrôlez, puis renvoyez-le dans votre deck en troisième position à partir du dessus.', 'https://magenoir.com/cards/FR/Air/Tornade.png', 'fr', 'Tornade'),
('tornade', E'Inflicts 4 damage to any target.Apply the effects of 1 Wind component you control, then put that component back into your deck, third from the top.', 'https://magenoir.com/cards/EN/air/Tornado.png', 'en', 'Tornado');

--========================================================================================================================
-- Typhon
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('typhon', 'mage_noir', '{
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
    {"componentName": "Vent", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Typhon
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('typhon', E'Inflige 6 points de dégâts à n''importe quelle cible.Défausse jusqu''à 3 sorts en préparation de l''adversaire.Renvoyez 1 composant Vent que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://magenoir.com/cards/FR/Air/Typhon.png', 'fr', 'Typhon'),
('typhon', E'Inflicts 6 damage to any target.Discard up to 3 of the opponent''s prepared spells.Put 1 Wind component you control back into your deck, third from the top.', 'https://magenoir.com/cards/EN/air/Typhoon.png', 'en', 'Typhoon');

--========================================================================================================================
-- Vague De Foudre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vague de foudre', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Étincelle", "quantity": 2}
  ],
  "extension": "Électrique",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Vague De Foudre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vague de foudre', E'Inflige 1 point de dégâts à n''importe quelle cible.Votre prochain sort Eau qui applique ses effets ce tour-ci gagne les effets de Vague de foudre, ajoutés après ses propres effets.', 'https://magenoir.com/cards/FR/Air/vague_de_foudre.png', 'fr', 'Vague De Foudre'),
('vague de foudre', E'Inflicts 1 damage to any target.Your next Water spell to apply its effects this turn gains the effects of Wave of Lightning, added after its own effects.', 'https://magenoir.com/cards/EN/air/wave_of_lightning.png', 'en', 'Wave Of Lightning');

--========================================================================================================================
-- Vent Tourbillonnant
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vent tourbillonnant', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 4,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Vent Tourbillonnant
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vent tourbillonnant', E'Renvoyez 1 sort en préparation au-dessus du deck de son propriétaire.', 'https://magenoir.com/cards/FR/Air/Vent-tourbillonnant.png', 'fr', 'Vent Tourbillonnant'),
('vent tourbillonnant', E'Return 1 prepared spell on top of its owner''s deck.', 'https://magenoir.com/cards/EN/air/Whirling-wind.png', 'en', 'Whirling Wind');

--========================================================================================================================
-- Vent Violent
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vent violent', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 3,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Souffle", "quantity": 2}
  ],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Vent Violent
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vent violent', E'Inflige 4 points de dégâts à n''importe quelle cible. Si vous êtes Mage Noir, les dégâts infligés sont augmentés de 1 par composant Souffle que vous contrôlez. Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://magenoir.com/cards/FR/Air/Vent-violent.png', 'fr', 'Vent Violent'),
('vent violent', E'Inflicts 4 damage to any target. If you''re a Mage Noir, the damage inflicted is augmented by 1 for each Breath component you control. Put 1 Breath component you control back into your deck, third from the top.', 'https://magenoir.com/cards/EN/air/Violent-wind.png', 'en', 'Violent Wind');

--========================================================================================================================
-- Vents Favorables
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vents favorables', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Souffle", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Vents Favorables
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vents favorables', E'Ce tour-ci, vous pouvez échanger la Mana Air à 1 pour 1 dans les deux sens. Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://magenoir.com/cards/FR/Air/Vents-favorables.png', 'fr', 'Vents Favorables'),
('vents favorables', E'This turn, you may trade Air Mana at a rate of 1 for 1 in either direction. Put 1 Breath component you control back into your deck, third from the top.', 'https://magenoir.com/cards/EN/air/Favorable-winds.png', 'en', 'Favorable Winds');

--========================================================================================================================
-- Zap
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('zap', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Électrique",
  "artwork": "Luca Siméone"
}');

-- Localisations pour Zap
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('zap', E'Si vous êtes Mage Noir, ce sort gagne : "Rapide" (Ce sort peut être activé à tout moment). Inflige 1 point de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Air/zap.png', 'fr', 'Zap'),
('zap', E'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Inflicts 1 damage to any target.', 'https://magenoir.com/cards/EN/air/zap.png', 'en', 'Zap');

--========================================================================================================================
-- Zephyr
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('zephyr', 'mage_noir', '{
  "type": "Sort",
  "element": "Air",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Souffle", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Zephyr
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('zephyr', E'Inflige 2 points de dégâts à n''importe quelle cible.Piochez 1 carte.', 'https://magenoir.com/cards/FR/Air/Zephyr.png', 'fr', 'Zephyr'),
('zephyr', E'Inflicts 2 damage to any target.Draw 1 card.', 'https://magenoir.com/cards/EN/air/Zephyr.png', 'en', 'Zephyr');

--========================================================================================================================
-- Arcane
--========================================================================================================================

--========================================================================================================================
-- Acceleration Du Temps
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('acceleration du temps', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du plieur de temps",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Acceleration Du Temps
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('acceleration du temps', E'Tout sort utilisant ce sort comme composant gagne l''effet : "Défaussez 1 carte du dessus de votre deck."', 'https://magenoir.com/cards/FR/Arcane/Acceleration-du-temps.png', 'fr', 'Acceleration Du Temps'),
('acceleration du temps', E'Any spell using this as a component gains: "Discard 1 card from the top of your deck."', 'https://magenoir.com/cards/EN/arcane/Time-acceleration.png', 'en', 'Time Acceleration');

--========================================================================================================================
-- Acceleration Forcee
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('acceleration forcee', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Acceleration Forcee
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('acceleration forcee', E'Votre adversaire pioche 7 cartes (ou 3 s''il est Mage Noir).', 'https://magenoir.com/cards/FR/Arcane/acceleration_forcee.png', 'fr', 'Acceleration Forcee'),
('acceleration forcee', E'The opponent draws 7 cards (or 3 if they''re a Mage Noir).', 'https://magenoir.com/cards/EN/arcane/forced_acceleration.png', 'en', 'Forced Acceleration');

--========================================================================================================================
-- Alteration Du Passe
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('alteration du passe', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Alteration Du Passe
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('alteration du passe', E'Échangez les positions de deux sorts dans la défausse du joueur de votre choix.', 'https://magenoir.com/cards/FR/Arcane/alteration_du_passe.png', 'fr', 'Alteration Du Passe'),
('alteration du passe', E'Swap the positions of two spells in the discard pile of any player.', 'https://magenoir.com/cards/EN/arcane/alteration_of_the_past.png', 'en', 'Alteration Of The Past');

--========================================================================================================================
-- Antimatiere
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('antimatiere', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Antimatiere
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('antimatiere', E'Payez le coût en Mana d''1 Permanent pour le détruire.', 'https://magenoir.com/cards/FR/Arcane/antimatiere.png', 'fr', 'Antimatiere'),
('antimatiere', E'Pay the Mana cost of 1 Permanent to destroy it.', 'https://magenoir.com/cards/EN/arcane/antimatter.png', 'en', 'Antimatter');

--========================================================================================================================
-- Apercu Du Futur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('apercu du futur', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Apercu Du Futur
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('apercu du futur', E'Déphase 1 le joueur de votre choix (Défausse 1 carte du dessous de son deck).Puis ce joueur pioche 1 carte.', 'https://magenoir.com/cards/FR/Arcane/apercu_du_futur.png', 'fr', 'Apercu Du Futur'),
('apercu du futur', E'Phase out any player by 1. (Discard 1 card from the bottom of their deck)Then that player draws 1 card.', 'https://magenoir.com/cards/EN/arcane/glimpse_of_the_future.png', 'en', 'Glimpse Of The Future');

--========================================================================================================================
-- Avance Rapide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('avance rapide', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Voie du plieur de temps",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Avance Rapide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('avance rapide', E'Défaussez 1 composant Temps que vous contrôlez. Piochez 1 carte. Inflige 2 points de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Arcane/Avance-rapide.png', 'fr', 'Avance Rapide'),
('avance rapide', E'Discard 1 Time component you control. Draw 1 card. Inflicts 2 damage to any target.', 'https://magenoir.com/cards/EN/arcane/Fast-forward.png', 'en', 'Fast Forward');

--========================================================================================================================
-- Blast Temporel
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('blast temporel', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Voie du plieur de temps",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Blast Temporel
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('blast temporel', E'Vous pouvez préparer ce sort depuis votre défausse tant qu''il n''est pas au dessus de celle-ci. Lorsque vous préparez ce sort, défaussez le composant Temps utilisé. Inflige 3 points de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Arcane/Blast-temporel.png', 'fr', 'Blast Temporel'),
('blast temporel', E'You may prepare this spell from your discard pile as long as it isn''t on top of it. When you prepare this spell, discard the Time component used. Inflicts 3 damage to any target.', 'https://magenoir.com/cards/EN/arcane/Temporal-blast.png', 'en', 'Temporal Blast');

--========================================================================================================================
-- Cape Galactique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('cape galactique', 'mage_noir', '{
  "type": "Équipement : Dos",
  "element": "Arcane",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du plieur de temps",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Cape Galactique
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('cape galactique', E'Ne peut être préparé que par un Mage Noir. Lorsque vous devriez piocher lors de votre phase de pioche, à la place choisissez une carte dans votre défausse et mettez-la dans votre main.', 'https://magenoir.com/cards/FR/Arcane/Cape-galactique.png', 'fr', 'Cape Galactique'),
('cape galactique', E'Can only be prepared by a Mage Noir. When you would draw during your draw phase, return a spell from your discard pile to your hand instead.', 'https://magenoir.com/cards/EN/arcane/Galactic-mantle.png', 'en', 'Galactic Mantle');

--========================================================================================================================
-- Chaos
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('chaos', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [
    {"componentName": "Inspiration", "quantity": 1}
  ],
  "extension": "Voie du plieur de temps",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Chaos
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('chaos', E'Regardez la carte du dessus de votre deck. Si c''est un Équipement, un Permanent, ou un Rituel, mettez-la à la défausse. Autrement, appliquez ses effets et défaussez-la. Puis l''adversaire fait de même. Si aucun joueur n''a perdu de Point de Vie, relancez les effets de ce sort.', 'https://magenoir.com/cards/FR/Arcane/Chaos.png', 'fr', 'Chaos'),
('chaos', E'Look at the top card of your deck. If it''s Equipment, a Permanent or a Ritual, put it in your discard pile. Else, apply its effects and discard it. Then the opponent does the same. If no player lost any Health Points, apply the effects of this spell again.', 'https://magenoir.com/cards/EN/arcane/Chaos.png', 'en', 'Chaos');

--========================================================================================================================
-- Connaissance De L Histoire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('connaissance de l histoire', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 6,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 6
  },
  "components": [],
  "componentCost": [
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Voie du plieur de temps",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Connaissance De L Histoire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('connaissance de l histoire', E'Activez les effets d''1 sort de votre défausse. Si vous êtes Mage Noir, les effets du composant Temps utilisé pour Connaissance de l''Histoire s''appliquent aussi à ce sort. Si Connaissance de l''Histoire est activé depuis votre défausse, il ne peut cibler que les sorts situés en-dessous de celui-ci.', 'https://magenoir.com/cards/FR/Arcane/Connaisance-de-l-histoire.png', 'fr', 'Connaissance De L Histoire'),
('connaissance de l histoire', E'Apply the effects of 1 spell in your discard pile. If you''re a Mage Noir, the effects of the Time component used to prepare Knowledge of history are also applied to this spell. If Knowledge of history is activated from your discard pile, it can only target spells that are located underneath it.', 'https://magenoir.com/cards/EN/arcane/Knowledge-of-history.png', 'en', 'Knowledge Of History');

--========================================================================================================================
-- Destin Differe
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('destin differe', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Voie du plieur de temps",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Destin Differe
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('destin differe', E'Vous pouvez utiliser 1 composant Temps supplémentaire pour le prochain sort que vous préparez ce tour-ci.', 'https://magenoir.com/cards/FR/Arcane/Destin-differe.png', 'fr', 'Destin Differe'),
('destin differe', E'You may use 1 additional Time component for the next spell you prepare this turn.', 'https://magenoir.com/cards/EN/arcane/Delayed-fate.png', 'en', 'Delayed Fate');

--========================================================================================================================
-- Heaume Galactique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('heaume galactique', 'mage_noir', '{
  "type": "Équipement : Tête",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Heaume Galactique
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('heaume galactique', E'Lorsque vous préparez un sort dont le coût en Mana Arcane est supérieur ou égal à 3, celui-ci coûte 1 Mana Arcane de moins (ou 2 de moins si vous êtes Mage Noir).À tout moment, vous pouvez regarder la carte du dessous de votre deck.', 'https://magenoir.com/cards/FR/Arcane/heaume_galactique.png', 'fr', 'Heaume Galactique'),
('heaume galactique', E'Spells with an Arcane Mana cost of 3 or greater cost 1 less Arcane Mana to prepare (or 2 if you''re a Mage Noir).At any time, you may look at the bottom card of your deck.', 'https://magenoir.com/cards/EN/arcane/galactic_helm.png', 'en', 'Galactic Helm');

--========================================================================================================================
-- Inception
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('inception', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Inception
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('inception', E'Renvoyez 1 sort de la défausse de l''adversaire dans sa main.Si vous êtes Mage Noir, et s''il est canalisable, vous pouvez décider de le renvoyer en jeu canalisé pour votre adversaire à la place. (Équipements, Permanents, et Rituels ne sont pas canalisables)', 'https://magenoir.com/cards/FR/Arcane/inception.png', 'fr', 'Inception'),
('inception', E'Return 1 spell from the opponent''s discard pile to their hand.If you''re a Mage Noir, and if it can be channeled, you may put it in play channeled as a component instead (Equipement, Permanents, and Rituals cannot be channeled).', 'https://magenoir.com/cards/EN/arcane/inception.png', 'en', 'Inception');

--========================================================================================================================
-- Infiltration Temporelle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('infiltration temporelle', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Infiltration Temporelle
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('infiltration temporelle', E'Déphase 3 l''adversaire.(Défausse 3 cartes du dessous de son deck )Si vous êtes Mage Noir, Déphase 3 le joueur de votre choix à la place.', 'https://magenoir.com/cards/FR/Arcane/infiltration_temporelle.png', 'fr', 'Infiltration Temporelle'),
('infiltration temporelle', E'Phase out the opponent by 3. (Discard 3 cards from the bottom of their deck)If you''re a Mage Noir, phase out any player by 3 instead.', 'https://magenoir.com/cards/EN/arcane/temporal_infiltration.png', 'en', 'Temporal Infiltration');

--========================================================================================================================
-- Inspiration Brillante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('inspiration brillante', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du plieur de temps",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Inspiration Brillante
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('inspiration brillante', E'Piochez 2 cartes, puis défaussez-vous d''1 carte en main.', 'https://magenoir.com/cards/FR/Arcane/Inspiration-brillante.png', 'fr', 'Inspiration Brillante'),
('inspiration brillante', E'Draw 2 cards, then discard 1 card from hand.', 'https://magenoir.com/cards/EN/arcane/Brilliant-inspiration.png', 'en', 'Brilliant Inspiration');

--========================================================================================================================
-- Millenaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('millenaire', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 5
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Millenaire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('millenaire', E'Transmutable : TempsVous ne pouvez pas contrôler ce sort si votre deck contient plus de 4 cartes. Si votre deck contient plus de 4 cartes tandis que Millénaire est en jeu, défaussez-le.Ajoutez 10 à chaque nombre présent dans l''effet de tout sort utilisant ce composant.', 'https://magenoir.com/cards/FR/Arcane/millenaire.png', 'fr', 'Millenaire'),
('millenaire', E'Transmutable : TimeYou cannot control this spell if there are more than 4 cards in your deck.If there are more than 4 cards in your deck while this is in play, discard it right away.Add 10 to every number in the effect of any spell using this as a component.', 'https://magenoir.com/cards/EN/arcane/millenium.png', 'en', 'Millennium');

--========================================================================================================================
-- Milliseconde
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('milliseconde', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Milliseconde
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('milliseconde', E'Transmutable : Temps Réduisez de 1 chaque nombre présent dans l''effet de tout sort utilisant ce composant (0 si vous êtes Mage Noir).Tout sort utilisant ce sort comme composant gagne : "Rapide" ( Vous pouvez activer ce sort à tout moment )', 'https://magenoir.com/cards/FR/Arcane/milliseconde.png', 'fr', 'Milliseconde'),
('milliseconde', E'Transmutable : TimeReduce every number in the effect of any spell using this as a component by 1 (0 if you''re a Mage Noir). Any spell using this as a component gains: "Quickcast". (This spell can be activated at any time)', 'https://magenoir.com/cards/EN/arcane/millisecond.png', 'en', 'Millisecond');

--========================================================================================================================
-- Montre De Nikola
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('montre de nikola', 'mage_noir', '{
  "type": "Équipement : Amulette",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Phase",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Montre De Nikola
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('montre de nikola', E'Lorsque vous piochez une carte, Déphase 1 l''adversaire (Défausse 1 carte du dessous de son deck ).', 'https://magenoir.com/cards/FR/Arcane/montre_de_nikola.png', 'fr', 'Montre De Nikola'),
('montre de nikola', E'Whenever you draw a card, phase out the opponent by 1. (Discard 1 card from the bottom of their deck)', 'https://magenoir.com/cards/EN/arcane/nikola_s_watch.png', 'en', 'Nikola S Watch');

--========================================================================================================================
-- Paradoxe Temporel
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('paradoxe temporel', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
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
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Voie du plieur de temps",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Paradoxe Temporel
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('paradoxe temporel', E'Inflige 0 points de dégâts à n''importe quelle cible. Si vous êtes Mage Noir, vous pouvez préparer cette carte depuis votre défausse une fois par tour.', 'https://magenoir.com/cards/FR/Arcane/Paradoxe-temporel.png', 'fr', 'Paradoxe Temporel'),
('paradoxe temporel', E'Inflicts 0 damage to any target. If you''re a Mage Noir, you may play this card from your discard pile once per turn.', 'https://magenoir.com/cards/EN/arcane/Temporal-paradox.png', 'en', 'Temporal Paradox');

--========================================================================================================================
-- Rappel Au Present
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rappel au present', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Voie du plieur de temps",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Rappel Au Present
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rappel au present', E'Inflige 1 point de dégâts à n''importe quelle cible pour chaque composant Temps dans votre défausse. Défaussez TOUS les sorts en jeu ne verrouillant aucune Mana.', 'https://magenoir.com/cards/FR/Arcane/Rappel-au-present.png', 'fr', 'Rappel Au Present'),
('rappel au present', E'Inflicts 1 damage to any target for every Time component in your discard pile. Discard EVERY spell in play without Mana locked under it.', 'https://magenoir.com/cards/EN/arcane/Callback-to-present.png', 'en', 'Callback To Present');

--========================================================================================================================
-- Recuperation Temporelle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('recuperation temporelle', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du plieur de temps",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Recuperation Temporelle
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('recuperation temporelle', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Eau de moins à préparer. Choisissez jusqu''à 3 composants Temps dans votre défausse et mettez-les en jeu, canalisés comme composants.', 'https://magenoir.com/cards/FR/Arcane/Recuperation-temporelle.png', 'fr', 'Recuperation Temporelle'),
('recuperation temporelle', E'If you''re a Mage Noir, this spell costs 1 less Water Mana to prepare. Put up to 3 Time components from your discard pile into play channeled as components.', 'https://magenoir.com/cards/EN/arcane/Temporal-salvage.png', 'en', 'Temporal Salvage');

--========================================================================================================================
-- Reflexion Abstruse
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('reflexion abstruse', 'mage_noir', '{
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
  "extension": "Phase",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Reflexion Abstruse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('reflexion abstruse', E'Déphase 0 l''adversaire. (Défausse 0 cartes du dessous de son deck )Déphase 0 l''adversaire. (Défausse 0 cartes du dessous de son deck )', 'https://magenoir.com/cards/FR/Arcane/reflexion_abstruse.png', 'fr', 'Reflexion Abstruse'),
('reflexion abstruse', E'Phase out any player by 0. (Discard 0 cards from the bottom of their deck)Phase out any player by 0. (Discard 0 cards from the bottom of their deck)', 'https://magenoir.com/cards/EN/arcane/abstruse_reflection.png', 'en', 'Abstruse Reflection');

--========================================================================================================================
-- Retour A L Origine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('retour a l origine', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Retour A L Origine
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('retour a l origine', E'Le joueur de votre choix renvoie les 10 cartes du dessus de sa défausse dans son deck, puis le mélange. Tant que ce sort est dans votre défausse, si vous êtes Mage Noir, vous pouvez payer 2 Mana Arcane pour renvoyer ce sort dans votre deck, puis mélanger votre deck.', 'https://magenoir.com/cards/FR/Arcane/retour_a_l_origine.png', 'fr', 'Retour A L Origine'),
('retour a l origine', E'Return the top 10 cards of any player''s discard pile to their deck, then they shuffle their deck.While this spell is in your discard pile, if you''re a Mage Noir, you may pay 2 Arcane Mana to return this card to your deck, then shuffle your deck.', 'https://magenoir.com/cards/EN/arcane/return_to_the_origin.png', 'en', 'Return To The Origin');

--========================================================================================================================
-- Revocation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('revocation', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [
    {"componentName": "Suppression", "quantity": 1}
  ],
  "extension": "Phase",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Revocation
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('revocation', E'Ne peut être préparé que par un Mage Noir.Rapide (Ce sort peut être activé à tout moment)Défaussez 1 sort en préparation.', 'https://magenoir.com/cards/FR/Arcane/revocation.png', 'fr', 'Revocation'),
('revocation', E'Can only be prepared by a Mage Noir.Quickcast (This spell can be activated at any time)Discard 1 prepared spell.', 'https://magenoir.com/cards/EN/arcane/revocation.png', 'en', 'Revocation');

--========================================================================================================================
-- Rite De Passage
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rite de passage', 'mage_noir', '{
  "type": "Rituel",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du plieur de temps & Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Rite De Passage
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rite de passage', E'Vous passez Mage Noir.', 'https://magenoir.com/cards/FR/Arcane/Rite-de-passage.png', 'fr', 'Rite De Passage'),
('rite de passage', E'You become a Mage Noir.', 'https://magenoir.com/cards/EN/arcane/Rite-of-passage.png', 'en', 'Rite Of Passage');

--========================================================================================================================
-- Rite De Phase
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rite de phase', 'mage_noir', '{
  "type": "Rituel",
  "element": "Arcane",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 5
  },
  "components": [],
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Rite De Phase
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rite de phase', E'Vous passez Mage Noir.Lorsque ce sort arrive en jeu, votre adversaire met sa défausse dans son deck et le mélange.Vos effets de Déphase sont augmentés de 1.Lorsque vous déphasez votre adversaire, infligez-lui 1 point de dégâts.', 'https://magenoir.com/cards/FR/Arcane/rite_de_phase.png', 'fr', 'Rite De Phase'),
('rite de phase', E'You become a Mage Noir.When put into play, the opponent puts their discard pile into their deck and shuffles it.Your Phase out effects are increased by 1.When you phase out the opponent, inflict 1 damage to them.', 'https://magenoir.com/cards/EN/arcane/rite_of_phase.png', 'en', 'Rite Of Phase');

--========================================================================================================================
-- Rituel Du Savoir
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du savoir', 'mage_noir', '{
  "type": "Rituel",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du plieur de temps",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Rituel Du Savoir
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel du savoir', E'Vous passez Mage Noir. Au début de votre tour, défaussez la carte du dessus de votre deck.', 'https://magenoir.com/cards/FR/Arcane/Rituel-du-savoir.png', 'fr', 'Rituel Du Savoir'),
('rituel du savoir', E'You become a Mage Noir. At the beginning of your turn, discard the top card of your deck.', 'https://magenoir.com/cards/EN/arcane/Knowledge-ritual.png', 'en', 'Knowledge Ritual');

--========================================================================================================================
-- Ronces Temporelles
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ronces temporelles', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
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
  "extension": "Phase",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Ronces Temporelles
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('ronces temporelles', E'Déphase 2 l''adversaire (Défausse 2 cartes du dessous de son deck).S''il est Mage Noir, il peut choisir de perdre 4 Points de Vie à la place.', 'https://magenoir.com/cards/FR/Arcane/ronces_temporelles.png', 'fr', 'Ronces Temporelles'),
('ronces temporelles', E'Phase out the opponent by 2. (Discard 2 cards from the bottom of their deck)If they are a Mage Noir, they may choose to lose 4 HP instead.', 'https://magenoir.com/cards/EN/arcane/temporal_brambles.png', 'en', 'Temporal Brambles');

--========================================================================================================================
-- Saut Dans Le Temps
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('saut dans le temps', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Saut Dans Le Temps
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('saut dans le temps', E'Déphase 1 n''importe quel joueur. (Défausse 1 carte du dessous de son deck )Ajoutez dans l''Éther Disponible la Mana correspondant au coût des cartes ainsi déphasées (cette Mana provient de l''Éther Infini).', 'https://magenoir.com/cards/FR/Arcane/saut_dans_le_temps.png', 'fr', 'Saut Dans Le Temps'),
('saut dans le temps', E'Phase out the opponent by 1.(Discard 1 card from the bottom of their deck)Take the Mana cost of any cards phased out this way from the Infinite Ether and add it to the Available Ether.', 'https://magenoir.com/cards/EN/arcane/leap_in_time.png', 'en', 'Leap In Time');

--========================================================================================================================
-- Sceptre Galactique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sceptre galactique', 'mage_noir', '{
  "type": "Équipement : Arme",
  "element": "Arcane",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Voie du plieur de temps",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Sceptre Galactique
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('sceptre galactique', E'Au début de votre tour, inflige 1 point de dégâts à n''importe quelle cible. Vous pouvez détruire cet Équipement pour aller chercher 1 Équipement Galactique dans votre deck, le montrer à l''adversaire, le mettre dans votre main et mélanger votre deck.', 'https://magenoir.com/cards/FR/Arcane/Sceptre-galactique.png', 'fr', 'Sceptre Galactique'),
('sceptre galactique', E'At the beginning of your turn, inflicts 1 damage to any target. You may destroy this Equipment from play to take 1 Galactic Equipment card from your deck, show it to the opponent, put it in your hand and shuffle your deck.', 'https://magenoir.com/cards/EN/arcane/Galactic-scepter.png', 'en', 'Galactic Scepter');

--========================================================================================================================
-- Seconde Divisee
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('seconde divisee', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
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
  "extension": "Voie du plieur de temps",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Seconde Divisee
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('seconde divisee', E'Transmutable : Temps (Ce sort est utilisable comme composant Temps.) Soustrayez 1 à chaque chiffre présent dans l''effet de tout sort utilisant ce composant. Si vous êtes Mage Noir, ajoutez 1 à la place.', 'https://magenoir.com/cards/FR/Arcane/Seconde-divisee.png', 'fr', 'Seconde Divisee'),
('seconde divisee', E'Transmutable : Time (This spell can be used as a Time component.) Subtract 1 from every number in the effect of any spell using this as a component. If you''re a Mage Noir, add 1 instead.', 'https://magenoir.com/cards/EN/arcane/Split-second.png', 'en', 'Split Second');

--========================================================================================================================
-- Siecle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('siecle', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
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
  "componentCost": [],
  "extension": "Voie du plieur de temps",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Siecle
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('siecle', E'Transmutable : Temps (Ce sort est utilisable comme composant Temps.) Après que ce sort est utilisé comme composant, défaussez-le. Doublez chaque chiffre présent dans l''effet de tout sort utilisant ce composant.', 'https://magenoir.com/cards/FR/Arcane/Siecle.png', 'fr', 'Siecle'),
('siecle', E'Transmutable : Time (This spell can be used as a Time component.) After this spell is used as a component, discard it. Double every number in the effect of any spell using this as a component.', 'https://magenoir.com/cards/EN/arcane/Century.png', 'en', 'Century');

--========================================================================================================================
-- Suppression Dimensionnelle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('suppression dimensionnelle', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du plieur de temps",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Suppression Dimensionnelle
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('suppression dimensionnelle', E'Défaussez 1 sort en préparation.', 'https://magenoir.com/cards/FR/Arcane/Suppression-dimensionnelle.png', 'fr', 'Suppression Dimensionnelle'),
('suppression dimensionnelle', E'Discard 1 prepared spell.', 'https://magenoir.com/cards/EN/arcane/dimensional-deletion.png', 'en', 'Dimensional Deletion');

--========================================================================================================================
-- Temps Destructure
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('temps destructure', 'mage_noir', '{
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
  "extension": "Phase",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Temps Destructure
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('temps destructure', E'Tout sort utilisant ce sort comme composant gagne l''effet :"Déphase 1 l''adversaire (Défausse 1 carte du dessous de son deck )"', 'https://magenoir.com/cards/FR/Arcane/temps_destructure.png', 'fr', 'Temps Destructure'),
('temps destructure', E'Any spell using this as a component gains: "Phase out the opponent by 1". (Discard 1 card from the bottom of their deck)', 'https://magenoir.com/cards/EN/arcane/unstructured_time.png', 'en', 'Unstructured Time');

--========================================================================================================================
-- Eau
--========================================================================================================================

--========================================================================================================================
-- Anneau D Azur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('anneau d azur', 'mage_noir', '{
  "type": "Équipement : Anneau",
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
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Anneau D Azur
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('anneau d azur', E'Au début de votre tour, choississez 1 option : - Vous gagnez 1 Point de Vie. - Si vous êtes Mage Noir, vous pouvez placer 1 Mana de votre réserve sous 1 sort que vous contrôlez.', 'https://magenoir.com/cards/FR/Eau/Anneau-d-azur.png', 'fr', 'Anneau D Azur'),
('anneau d azur', E'At the beginning of your turn, choose 1 option: - You gain 1 Health Point. - If you''re a Mage Noir, you may put 1 Mana from your Mana reserve under 1 spell you control.', 'https://magenoir.com/cards/EN/water/Azure-ring.png', 'en', 'Azure Ring');

--========================================================================================================================
-- Arbre De Glace
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre de glace', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Graine", "quantity": 1}
  ],
  "extension": "Glace",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Arbre De Glace
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arbre de glace', E'Au début de votre tour, choisissez 1 Permanent ou Équipement : il n''applique pas ses effets jusqu''au début de votre prochain tour.Puis, Arbre de glace perd 1 PV.', 'https://magenoir.com/cards/FR/Eau/arbre_de_glace.png', 'fr', 'Arbre De Glace'),
('arbre de glace', E'At the beginning of your turn, choose 1 Permanent or piece of Equipment. It stops applying its effects until the beginning of your next turn.Then, Ice tree loses 1 HP.', 'https://magenoir.com/cards/EN/water/ice_tree.png', 'en', 'Ice Tree');

--========================================================================================================================
-- Brinicle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('brinicle', 'mage_noir', '{
  "type": "Permanent",
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
    {"componentName": "Maelström", "quantity": 1}
  ],
  "extension": "Glace",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Brinicle
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('brinicle', E'À la fin du tour de l''adversaire, Brinicle lui inflige 1 point de dégâts par Mana Eau dans sa réserve de Mana.', 'https://magenoir.com/cards/FR/Eau/brinicle.png', 'fr', 'Brinicle'),
('brinicle', E'At the end of the opponent''s turn, Brinicle inflicts 1 damage to them for each Water Mana in their Mana reserve.', 'https://magenoir.com/cards/EN/water/brinicle.png', 'en', 'Brinicle');

--========================================================================================================================
-- Condensation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('condensation', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Condensation
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('condensation', E'Tant que ce sort est en préparation, au début de votre tour, mettez 1 Mana Eau de l''Éther Infini sous ce sort. Lorsque vous l''activez, répartissez la Mana verrouillée sous Condensation entre votre réserve de Mana et vos sorts.', 'https://magenoir.com/cards/FR/Eau/Condensation.png', 'fr', 'Condensation'),
('condensation', E'While in preparation: At the start of your turn, lock 1 Water Mana from the Infinite Ether under this spell. When activated, distribute the Mana locked under this spell between your Mana reserve and your spells.', 'https://magenoir.com/cards/EN/water/Condensation.png', 'en', 'Condensation');

--========================================================================================================================
-- Echarde De Glace
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('echarde de glace', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Luca Siméone"
}');

-- Localisations pour Echarde De Glace
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('echarde de glace', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Inflige 2 points de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Eau/echarde_de_glace.png', 'fr', 'Echarde De Glace'),
('echarde de glace', E'Slowcast (This spell can''t be activated on the turn it was prepared) Inflicts 2 damage to any target.', 'https://magenoir.com/cards/EN/water/ice_shard.png', 'en', 'Ice Shard');

--========================================================================================================================
-- Engloutissement
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('engloutissement', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 3,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Vague", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Engloutissement
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('engloutissement', E'Détruisez 1 Permanent ou 1 Équipement.', 'https://magenoir.com/cards/FR/Eau/Engloutissement.png', 'fr', 'Engloutissement'),
('engloutissement', E'Destroy 1 Permanent or 1 piece of Equipment.', 'https://magenoir.com/cards/EN/water/Engulfment.png', 'en', 'Engulfment');

--========================================================================================================================
-- Ere Glaciaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ere glaciaire', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 1,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Glace1", "quantity": 2}
  ],
  "extension": "Glace",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Ere Glaciaire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('ere glaciaire', E'Ne peut être préparé que par un Mage Noir.Vous pouvez préparer ce sort sans le composant Temps requis.Les effets de dégâts de vos sorts Eau sont augmentés de 1.', 'https://magenoir.com/cards/FR/Eau/ere_glaciaire.png', 'fr', 'Ere Glaciaire'),
('ere glaciaire', E'Can only be prepared by a Mage Noir.You may prepare this spell without the required Time component.Damage from Water spells you control is increased by 1.', 'https://magenoir.com/cards/EN/water/glacial_age.png', 'en', 'Glacial Age');

--========================================================================================================================
-- Fleche Mordante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleche mordante', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Fleche Mordante
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleche mordante', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Inflige 1 point de dégâts à n''importe quelle cible.Lorsque ce sort doit aller depuis le plateau vers la défausse, vous pouvez payer 1 Mana Eau pour le renvoyer dans votre main à la place.', 'https://magenoir.com/cards/FR/Eau/fleche_mordante.png', 'fr', 'Fleche Mordante'),
('fleche mordante', E'Slowcast (This spell can''t be activated on the turn it was prepared) Inflicts 1 damage to any target.If this spell would be discarded from play, you may pay 1 Water Mana to return it to your hand instead.', 'https://magenoir.com/cards/EN/water/biting_arrow.png', 'en', 'Biting Arrow');

--========================================================================================================================
-- Flocon De Neige
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('flocon de neige', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Flocon De Neige
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('flocon de neige', E'Transmutable : Glace, GoutteMettez 1 Mana Eau verrouillée par ce sort sous un autre sort que vous contrôlez.', 'https://magenoir.com/cards/FR/Eau/flocon_de_neige_1.png', 'fr', 'Flocon De Neige'),
('flocon de neige', E'Transmutable : Ice, DropPut 1 Water Mana locked under this spell under another spell you control.', 'https://magenoir.com/cards/EN/water/snowflake_1.png', 'en', 'Snowflake');

--========================================================================================================================
-- Goutte D Eau
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('goutte d eau', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Goutte D Eau
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('goutte d eau', E'Tant que ce sort est canalisé comme composant, une fois par tour, peut être considéré par un autre sort comme étant 2 composants Goutte. Si vous êtes Mage Noir, compte toujours comme 2 composants Goutte.', 'https://magenoir.com/cards/FR/Eau/Goutte-d-eau.png', 'fr', 'Goutte D Eau'),
('goutte d eau', E'When channeled, once per turn, may be counted by another spell as 2 Drop components. If you''re a Mage Noir, it is always counted as 2 Drop components.', 'https://magenoir.com/cards/EN/water/Water-drop.png', 'en', 'Water Drop');

--========================================================================================================================
-- Gouttelette
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('gouttelette', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Gouttelette
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('gouttelette', E'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.)', 'https://magenoir.com/cards/FR/Eau/Gouttelette.png', 'fr', 'Gouttelette'),
('gouttelette', E'Transmutable : Drop (This spell can be used as a Drop component.)', 'https://magenoir.com/cards/EN/water/Droplet.png', 'en', 'Droplet');

--========================================================================================================================
-- Grandes Eaux
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('grandes eaux', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Grandes Eaux
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('grandes eaux', E'Inflige 1 point de dégâts à n''importe quelle cible par composant Eau actuellement sur le plateau (Permanents et Équipements exclus).', 'https://magenoir.com/cards/FR/Eau/Grandes-eaux.png', 'fr', 'Grandes Eaux'),
('grandes eaux', E'Inflicts 1 damage to any target for each Water component in play (Permanents and Equipment excluded).', 'https://magenoir.com/cards/EN/water/Great-waters.png', 'en', 'Great Waters');

--========================================================================================================================
-- Haute Pression
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('haute pression', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 1,
    "manaEau": 3,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Condensation", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Haute Pression
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('haute pression', E'Inflige X points de dégâts à n''importe quelle cible. X est égal au nombre de Mana verrouillées sous un composant Condensation que vous contrôlez. Ce composant Condensation retourne dans votre main.', 'https://magenoir.com/cards/FR/Eau/Haute-pression.png', 'fr', 'Haute Pression'),
('haute pression', E'Inflicts X damage to any target, where X is the amount of Mana locked under a Condensation component you control. Return that component to your hand.', 'https://magenoir.com/cards/EN/water/High-pressure.png', 'en', 'High Pressure');

--========================================================================================================================
-- Hiver Percant
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('hiver percant', 'mage_noir', '{
  "type": "Équipement : Arme",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 3,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Hiver Percant
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('hiver percant', E'Pour chaque carte que votre adversaire pioche, cet Équipement lui inflige 1 point de dégâts.Au début de votre tour, Hiver perçant libère 1 Mana Eau.Détruisez cet Équipement dès qu''il ne verrouille plus de Mana Eau.', 'https://magenoir.com/cards/FR/Eau/hiver_percant.png', 'fr', 'Hiver Percant'),
('hiver percant', E'Inflicts 1 damage to the opponent every time they draw a card.At the beginning of your turn, releases 1 Water Mana.Discard Piercing winter as soon as there''s no Water Mana locked under it.', 'https://magenoir.com/cards/EN/water/piercing_winter.png', 'en', 'Piercing Winter');

--========================================================================================================================
-- Infiltration Glaciale
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('infiltration glaciale', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 3,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Infiltration Glaciale
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('infiltration glaciale', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Ce tour-ci, les dégâts des sorts Eau que vous contrôlez sont réduits de 1.Ces dégâts ne peuvent pas être ignorés, réduits, ni redirigés ce tour-ci.', 'https://magenoir.com/cards/FR/Eau/infiltration_glaciale.png', 'fr', 'Infiltration Glaciale'),
('infiltration glaciale', E'Slowcast (This spell can''t be activated on the turn it was prepared) This turn, damage from Water spells you control is reduced by 1.This damage can''t be ignored, reduced or redirected this turn.', 'https://magenoir.com/cards/EN/water/icy_infiltration.png', 'en', 'Icy Infiltration');

--========================================================================================================================
-- Infiltration Subtile
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('infiltration subtile', 'mage_noir', '{
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
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Infiltration Subtile
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('infiltration subtile', E'A chaque fois que vous échangez de la Mana Eau avec l''Ether Disponible, inflige 1 point de dégâts à l''adversaire, puis libère 1 Mana verrouillée par ce sort. Dès qu''il ne verrouille plus de Mana, détruisez ce sort, puis vous pouvez prendre jusqu''à 2 Mana Eau dans l''Ether disponible.', 'https://magenoir.com/cards/FR/Eau/Infiltration-subtile.png', 'fr', 'Infiltration Subtile'),
('infiltration subtile', E'Every time you trade Water Mana with the Available Ether, inflict 1 damage to the opponent and release 1 Mana locked under this spell. Discard this Permanent as soon as there''s no Mana locked under it, then you may take up to 2 Water Mana from the Available Ether.', 'https://magenoir.com/cards/EN/water/Subtle-infiltration.png', 'en', 'Subtle Infiltration');

--========================================================================================================================
-- La Guerisseuse De L Eau
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('la guerisseuse de l eau', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour La Guerisseuse De L Eau
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('la guerisseuse de l eau', E'La cible de votre choix gagne 3 Points de Vie. Reprenez 1 sort de votre défausse dans votre main.', 'https://magenoir.com/cards/FR/Eau/La-guerisseuse-de-l-eau.png', 'fr', 'La Guerisseuse De L Eau'),
('la guerisseuse de l eau', E'Any target gains 3 Health Points. Return 1 spell from your discard pile to your hand.', 'https://magenoir.com/cards/EN/water/The-water-healer.png', 'en', 'The Water Healer');

--========================================================================================================================
-- Lances De L Hiver
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lances de l hiver', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Glace", "quantity": 2}
  ],
  "extension": "Glace",
  "artwork": "Luca Siméone"
}');

-- Localisations pour Lances De L Hiver
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('lances de l hiver', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Ne peut jamais être Lent tant que vous êtes Mage Noir.Ce sort libère 2 Mana Eau.Inflige 3 points de dégâts à n''importe quelle cible (ou 5 si ce sort verrouille au moins 1 Mana Eau).', 'https://magenoir.com/cards/FR/Eau/lances_de_l_hiver.png', 'fr', 'Lances De L Hiver'),
('lances de l hiver', E'Slowcast (This spell can''t be activated on the turn it was prepared) This spell can never have Slowcast as long as you''re a Mage Noir.Releases 2 Water Mana.Inflicts 3 damage to any target (or 5 if this spell locks at least 1 Water Mana).', 'https://magenoir.com/cards/EN/water/winter_spears.png', 'en', 'Winter Spears');

--========================================================================================================================
-- Maelstrom
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('maelstrom', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 3,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Maelstrom
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('maelstrom', E'À la fin de leur tour, les joueurs mettent la Mana de leur réserve de Mana dans l''Ether Disponible. Au début de votre tour, détruisez Maelström.', 'https://magenoir.com/cards/FR/Eau/Maelstrom.png', 'fr', 'Maelstrom'),
('maelstrom', E'At the end of their turns, players put all the Mana from their Mana reserve into the Available Ether. At the beginning of your turn, destroy Maelström.', 'https://magenoir.com/cards/EN/water/Maelstrom.png', 'en', 'Maelstrom');

--========================================================================================================================
-- Maree
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('maree', 'mage_noir', '{
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
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Maree
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('maree', E'Piochez 1 carte, puis défaussez-vous d''1 carte en main. Mettez la Mana verrouillée par ce sort sous un autre sort que vous contrôlez. Puis vous pouvez payer 1 Mana Eau pour aller chercher 1 carte Marée dans votre défausse, et la mettre dans votre main.', 'https://magenoir.com/cards/FR/Eau/Maree.png', 'fr', 'Maree'),
('maree', E'Draw 1 card, then discard 1 card from hand. Put the Mana locked under this spell under another spell you control. Then you may pay 1 Water Mana to return 1 Tide spell from your discard pile to your hand.', 'https://magenoir.com/cards/EN/water/Tide.png', 'en', 'Tide');

--========================================================================================================================
-- Meteore De Cristal
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('meteore de cristal', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 3,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Glace", "quantity": 1}
  ],
  "extension": "Glace",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Meteore De Cristal
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('meteore de cristal', E'Inflige 2 points de dégâts à n''importe quelle cible.Les dégâts infligés sont augmentés de 1 par composant Glace que vous contrôlez.', 'https://magenoir.com/cards/FR/Eau/meteore_de_cristal.png', 'fr', 'Meteore De Cristal'),
('meteore de cristal', E'Inflicts 2 damage to any target.This damage is increased by 1 for each Ice component you control.', 'https://magenoir.com/cards/EN/water/crystal_meteor.png', 'en', 'Crystal Meteor');

--========================================================================================================================
-- Mur De Glace
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('mur de glace', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Mur De Glace
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('mur de glace', E'Ce Permanent a Protecteur tant qu''il verrouille de la Mana Eau.Au début de votre tour, libère 1 Mana Eau.', 'https://magenoir.com/cards/FR/Eau/mur_de_glace.png', 'fr', 'Mur De Glace'),
('mur de glace', E'As long as it locks Water Mana, this Permanent has Protector.At the beginning of your turn, releases 1 Water Mana.', 'https://magenoir.com/cards/EN/water/ice_wall.png', 'en', 'Ice Wall');

--========================================================================================================================
-- Ocean Dechaine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ocean dechaine', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 1,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Vague", "quantity": 2}
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Ocean Dechaine
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('ocean dechaine', E'Au début de votre tour, vos composants Vague appliquent leurs effets. Puis, ce sort libère 1 Mana Eau pour chaque composant Vague que vous contrôlez. Détruisez ce sort dès qu''il ne verrouille plus de Mana Eau.', 'https://magenoir.com/cards/FR/Eau/Ocean-dechaine.png', 'fr', 'Ocean Dechaine'),
('ocean dechaine', E'At the beginning of your turn, your Wave components apply their effects. Then, this spell releases 1 Water Mana for each Wave component you control. Discard this Permanent as soon as there''s no Water Mana locked under it.', 'https://magenoir.com/cards/EN/water/Unleashed-ocean.png', 'en', 'Unleashed Ocean');

--========================================================================================================================
-- Rituel Du Melange
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du melange', 'mage_noir', '{
  "type": "Rituel",
  "element": "Eau",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Rituel Du Melange
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel du melange', E'Vous passez Mage Noir. Lorsque vous ajoutez de la Mana à l''Éther disponible durant votre phase de récupération de Mana, ajoutez 1 Mana de moins. Durant votre phase principale, vous pouvez échanger la Mana verrouillée sous vos sorts Eau et celle de votre réserve de Mana à 1 pour 1.', 'https://magenoir.com/cards/FR/Eau/Rituel-du-melange.png', 'fr', 'Rituel Du Melange'),
('rituel du melange', E'You become a Mage Noir. When you add Mana to the Available Ether during your Mana gathering phase, add 1 less Mana. During your main phase, you may trade Mana between your Mana reserve and your Water spells at a rate of 1 for 1.', 'https://magenoir.com/cards/EN/water/Ritual-of-melange.png', 'en', 'Ritual Of Melange');

--========================================================================================================================
-- Rituel Du Zero Absolu
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du zero absolu', 'mage_noir', '{
  "type": "Rituel",
  "element": "Eau",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Rituel Du Zero Absolu
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel du zero absolu', E'Vous passez Mage Noir.TOUS les sorts gagnent : "Lent" (Ces sort ne peuvent pas être activés le tour durant lequel ils ont été préparés ).TOUS les sorts peuvent être préparés pour 1 Mana Eau supplémentaire afin qu''ils n''aient pas Lent.', 'https://magenoir.com/cards/FR/Eau/rituel_du_zero_absolu.png', 'fr', 'Rituel Du Zero Absolu'),
('rituel du zero absolu', E'You become a Mage Noir.ALL spells gain: "Slowcast". (You cannot activate these spells on the same turn they were prepared)ALL spells can be prepared for 1 additional Water Mana so that they don''t have Slowcast.', 'https://magenoir.com/cards/EN/water/ritual_of_absolute_zero.png', 'en', 'Ritual Of Absolute Zero');

--========================================================================================================================
-- Robe De Yuki Onna
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('robe de yuki onna', 'mage_noir', '{
  "type": "Équipement : Torse",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Robe De Yuki Onna
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('robe de yuki onna', E'Pour chaque carte que votre adversaire pioche, il paye 1 Mana.', 'https://magenoir.com/cards/FR/Eau/robe_de_yuki_onna.png', 'fr', 'Robe De Yuki Onna'),
('robe de yuki onna', E'Each time the opponent draws a card, they pay 1 Mana.', 'https://magenoir.com/cards/EN/water/yuki_onna_s_robe.png', 'en', 'Yuki Onna S Robe');

--========================================================================================================================
-- Souffle Brume
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('souffle brume', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Souffle Brume
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('souffle brume', E'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.) Renvoyez 3 cartes de votre défausse dans votre deck, puis mélangez votre deck.', 'https://magenoir.com/cards/FR/Eau/Souffle-brume.png', 'fr', 'Souffle Brume'),
('souffle brume', E'Transmutable : Drop (This spell can be used as a Drop component.) Return 3 cards from your discard pile to your deck, then shuffle your deck.', 'https://magenoir.com/cards/EN/water/Mist-breath.png', 'en', 'Mist Breath');

--========================================================================================================================
-- Souffle De Glace
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('souffle de glace', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Glace",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Souffle De Glace
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('souffle de glace', E'Jusqu''au début de votre prochain tour, les sorts du joueur ciblé coûtent 1 Mana Eau supplémentaire.', 'https://magenoir.com/cards/FR/Eau/souffle_de_glace.png', 'fr', 'Souffle De Glace'),
('souffle de glace', E'Until the beginning of your next turn, target player''s spells cost 1 more Water Mana.', 'https://magenoir.com/cards/EN/water/ice_breath.png', 'en', 'Ice Breath');

--========================================================================================================================
-- Source Prodigieuse
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('source prodigieuse', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Source Prodigieuse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('source prodigieuse', E'Vos composants Eau sont comptés 1 fois de plus (Permanents exclus).', 'https://magenoir.com/cards/FR/Eau/Source-prodigieuse.png', 'fr', 'Source Prodigieuse'),
('source prodigieuse', E'Each of your Water components counts as 1 additional instance of that component (Permanents excluded).', 'https://magenoir.com/cards/EN/water/Prodigious-source.png', 'en', 'Prodigious Source');

--========================================================================================================================
-- Tsunami
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tsunami', 'mage_noir', '{
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
    {"componentName": "Océan", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Tsunami
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('tsunami', E'Détruisez tous les Permanents de l''adversaire.Inflige 8 points de dégâts à l''adversaire.', 'https://magenoir.com/cards/FR/Eau/Tsunami.png', 'fr', 'Tsunami'),
('tsunami', E'Destroy all of the opponent''s PermanentsInflicts 8 damage to the opponent.', 'https://magenoir.com/cards/EN/water/Tsunami.png', 'en', 'Tsunami');

--========================================================================================================================
-- Vague Deferlante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vague deferlante', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 3,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Goutte", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Vague Deferlante
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vague deferlante', E'Inflige 3 points de dégâts à n''importe quelle cible (ou 4 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Eau/Vague-deferlante.png', 'fr', 'Vague Deferlante'),
('vague deferlante', E'Inflicts 3 damage to any target (or 4 if you''re a Mage Noir).', 'https://magenoir.com/cards/EN/water/Surging-wave.png', 'en', 'Surging Wave');

--========================================================================================================================
-- Vague Echo
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vague echo', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Vague", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Vague Echo
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vague echo', E'Applique les effets d''1 composant Vague que vous contrôlez.', 'https://magenoir.com/cards/FR/Eau/Vague-echo.png', 'fr', 'Vague Echo'),
('vague echo', E'Apply the effects of 1 Wave component you control.', 'https://magenoir.com/cards/EN/water/Wave-echo.png', 'en', 'Wave Echo');

--========================================================================================================================
-- Vague Mordante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vague mordante', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Glace", "quantity": 1}
  ],
  "extension": "Glace",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Vague Mordante
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vague mordante', E'Inflige 2 points de dégâts à n''importe quelle cible.Si vous êtes Mage Noir, verrouillez la Mana Eau de ce sort sous un autre sort que vous contrôlez.', 'https://magenoir.com/cards/FR/Eau/vague_mordante.png', 'fr', 'Vague Mordante'),
('vague mordante', E'Inflicts 2 damage to any target.If you''re a Mage Noir, put the Mana locked under this spell under another spell you control.', 'https://magenoir.com/cards/EN/water/biting_wave.png', 'en', 'Biting Wave');

--========================================================================================================================
-- Vague Purificatrice
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vague purificatrice', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Goutte", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Vague Purificatrice
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vague purificatrice', E'La cible de votre choix gagne 2 Points de Vie (ou 3 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Eau/Vague-purificatrice.png', 'fr', 'Vague Purificatrice'),
('vague purificatrice', E'Any target gains 2 Health Points (or 3 if you''re a Mage Noir).', 'https://magenoir.com/cards/EN/water/Purifying-wave.png', 'en', 'Purifying Wave');

--========================================================================================================================
-- Feu
--========================================================================================================================

--========================================================================================================================
-- Anneau Pourpre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('anneau pourpre', 'mage_noir', '{
  "type": "Équipement : Anneau",
  "element": "Feu",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Anneau Pourpre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('anneau pourpre', E'Lorsque vous perdez des Points de Vie ou que des dégâts vous sont infligés, vous pouvez payer 1 Mana Feu pour infliger 1 point de dégâts à l''adversaire.', 'https://magenoir.com/cards/FR/Feu/Anneau-pourpre.png', 'fr', 'Anneau Pourpre'),
('anneau pourpre', E'Whenever you lose Health Points or damage is inflicted to you, you may pay 1 Fire Mana to inflict 1 damage to the opponent.', 'https://magenoir.com/cards/EN/fire/Crimson-ring.png', 'en', 'Crimson Ring');

--========================================================================================================================
-- Aube
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('aube', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
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
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Aube
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('aube', E'Tant que ce sort est en préparation, si un Soleil que vous contrôlez devait être détruit, défaussez ce sort à la place.Lorsque vous activez Aube, si vous êtes Mage Noir, piochez 1 carte.', 'https://magenoir.com/cards/FR/Feu/aube.png', 'fr', 'Aube'),
('aube', E'While in preparation, if a Sun you control would be destroyed, discard this spell instead.When activated, if you''re a Mage Noir, draw 1 card.', 'https://magenoir.com/cards/EN/fire/dawn.png', 'en', 'Dawn');

--========================================================================================================================
-- Boule De Feu
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('boule de feu', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
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
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Boule De Feu
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('boule de feu', E'Vous pouvez défausser 1 carte Feu depuis votre main pour préparer ce sort sans le composant Flamme requis. Inflige 2 points de dégâts à tous les permanents de l''adversaire. Puis inflige 2 points de dégâts à l''adversaire (ou 3 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Feu/Boule-de-feu.png', 'fr', 'Boule De Feu'),
('boule de feu', E'You may discard 1 Fire card from your hand to prepare this spell without the required Flame component. Inflicts 2 damage to every Permanent your opponent controls. Then, inflicts 2 damage to the opponent (or 3 if you''re a Mage Noir).', 'https://magenoir.com/cards/EN/fire/Fire-ball.png', 'en', 'Fire Ball');

--========================================================================================================================
-- Brulure Solaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('brulure solaire', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Soleil", "quantity": 1}
  ],
  "extension": "Soleil",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Brulure Solaire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('brulure solaire', E'Inflige 3 points de dégâts à n''importe quelle cible.Zénith: Défaussez 1 composant que vous contrôlez. Puis infligez 1 point de dégâts à l''adversaire. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://magenoir.com/cards/FR/Feu/brulure_solaire.png', 'fr', 'Brulure Solaire'),
('brulure solaire', E'Inflicts 3 damage to any target.Zenith: Discard 1 component you control. Then, inflict 1 damage to the opponent.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://magenoir.com/cards/EN/fire/solar_burn.png', 'en', 'Solar Burn');

--========================================================================================================================
-- Catalyseur De Soleil
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('catalyseur de soleil', 'mage_noir', '{
  "type": "Permanent",
  "element": "Feu",
  "manaCost": {
    "total": 6,
    "manaVegetal": 0,
    "manaFeu": 6,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Soleil",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Catalyseur De Soleil
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('catalyseur de soleil', E'Unique Zénith : Vos sorts Solaires coûtent 1 Mana Feu de moins à préparer. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://magenoir.com/cards/FR/Feu/catalyseur_de_soleil.png', 'fr', 'Catalyseur De Soleil'),
('catalyseur de soleil', E'UniqueZenith: Your Solar spells cost 1 less Fire Mana to prepare. (Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://magenoir.com/cards/EN/fire/sun_catalyst.png', 'en', 'Sun Catalyst');

--========================================================================================================================
-- Eblouissement
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('eblouissement', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Lumière", "quantity": 1}
  ],
  "extension": "Soleil",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Eblouissement
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('eblouissement', E'Si vous êtes Mage Noir, vous pouvez préparer ce sort sans le composant Lumière requis.Rapide (Vous pouvez activer ce sort à tout moment )Renvoyez 1 sort en préparation dans la main de son propriétaire.', 'https://magenoir.com/cards/FR/Feu/eblouissement.png', 'fr', 'Eblouissement'),
('eblouissement', E'If you''re a Mage Noir, you may prepare this spell without the required Light component.Quickcast (This spell can be activated at any time)Return 1 prepared spell to its owner''s hand.', 'https://magenoir.com/cards/EN/fire/dazzle.png', 'en', 'Dazzle');

--========================================================================================================================
-- Eruption De Magma
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('eruption de magma', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 3,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Flamme", "quantity": 3}
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Eruption De Magma
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('eruption de magma', E'Inflige 7 points de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Feu/Magma-eruption.png', 'fr', 'Eruption De Magma'),
('eruption de magma', E'Inflicts 7 damage to any target.', 'https://magenoir.com/cards/EN/fire/Magma-eruption.png', 'en', 'Magma Eruption');

--========================================================================================================================
-- Eruption Solaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('eruption solaire', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Eruption Solaire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('eruption solaire', E'Ce tour-ci, préparer les sorts suivants coûte 2 Mana de moins de l''élément du sort : Tornade, Engloutissement, Séisme, Mons Igneus, Maelström, Explosion.Quand vous préparez l''un de ces sorts, piochez une carte.', 'https://magenoir.com/cards/FR/Feu/eruption_solaire.png', 'fr', 'Eruption Solaire'),
('eruption solaire', E'This turn, preparing the following spells costs 2 less Mana of the spell''s element: Maelström, Tornado, Engulfment, Earthquake, Mons Igneus, Explosion.When you prepare one of these spells, draw a card.', 'https://magenoir.com/cards/EN/fire/solar_eruption.png', 'en', 'Solar Eruption');

--========================================================================================================================
-- Explosion Solaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('explosion solaire', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 6,
    "manaVegetal": 0,
    "manaFeu": 4,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Soleil1", "quantity": 1}
  ],
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Explosion Solaire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('explosion solaire', E'Détruisez TOUS les Soleils.Zénith : Inflige 9 points de dégâts à n''importe quelle cible.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://magenoir.com/cards/FR/Feu/explosion_solaire.png', 'fr', 'Explosion Solaire'),
('explosion solaire', E'Destroy ALL Suns.Zenith: Inflicts 9 damage to any target.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://magenoir.com/cards/EN/fire/solar_explosion.png', 'en', 'Solar Explosion');

--========================================================================================================================
-- Fission
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fission', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Fission
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fission', E'Vous pouvez défausser 1 carte Feu depuis votre main pour préparer ce sort sans le composant Flamme requis. Défaussez-vous d''1 carte en main. Détruisez 1 Permanent.', 'https://magenoir.com/cards/FR/Feu/Fission.png', 'fr', 'Fission'),
('fission', E'You may discard 1 Fire card from your hand to prepare this spell without the required Flame component. Discard 1 card in hand. Destroy 1 Permanent.', 'https://magenoir.com/cards/EN/fire/Fission.png', 'en', 'Fission');

--========================================================================================================================
-- Flamme
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('flamme', 'mage_noir', '{
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
  "extension": "Jeu de base",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Flamme
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('flamme', E'Inflige 1 point de dégâts à n''importe quelle cible. Après que ce sort est utilisé comme composant, défaussez-le.', 'https://magenoir.com/cards/FR/Feu/Flamme.png', 'fr', 'Flamme'),
('flamme', E'Inflicts 1 damage to any target. After this spell is used as a component, discard it.', 'https://magenoir.com/cards/EN/fire/Flame.png', 'en', 'Flame');

--========================================================================================================================
-- Flamme De Soufre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('flamme de soufre', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
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
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Flamme De Soufre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('flamme de soufre', E'Ne peut être préparé que par un Mage Noir.Inflige 3 points de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Feu/Flamme-de-soufre.png', 'fr', 'Flamme De Soufre'),
('flamme de soufre', E'Can only be prepared by a Mage Noir.Inflicts 3 damage to any target.', 'https://magenoir.com/cards/EN/fire/Sulfur-flame.png', 'en', 'Sulfur Flame');

--========================================================================================================================
-- Flamme Draconique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('flamme draconique', 'mage_noir', '{
  "type": "Sort",
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
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Flamme Draconique
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('flamme draconique', E'Inflige 2 points de dégâts à n''importe quelle cible.Après que ce sort est utilisé comme composant, vous perdez 1 Point de Vie.', 'https://magenoir.com/cards/FR/Feu/Flamme-draconique.png', 'fr', 'Flamme Draconique'),
('flamme draconique', E'Inflicts 2 damage to any target.After this spell is used as a component, you lose 1 Health Point.', 'https://magenoir.com/cards/EN/fire/Draconic-flame.png', 'en', 'Draconic Flame');

--========================================================================================================================
-- Flamme Mentale
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('flamme mentale', 'mage_noir', '{
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
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Flamme Mentale
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('flamme mentale', E'Tant que ce sort est canalisé comme composant :au début de votre tour, payez 1 Mana Feu ou défaussez ce sort.', 'https://magenoir.com/cards/FR/Feu/Flamme-mentale.png', 'fr', 'Flamme Mentale'),
('flamme mentale', E'While channeled as a component:at the start of your turn, pay 1 Fire Mana or discard this spell.', 'https://magenoir.com/cards/EN/fire/Mental-flame.png', 'en', 'Mental Flame');

--========================================================================================================================
-- Flamme Solaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('flamme solaire', 'mage_noir', '{
  "type": "Sort",
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
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Flamme Solaire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('flamme solaire', E'', 'https://magenoir.com/cards/FR/Feu/flamme_solaire.png', 'fr', 'Flamme Solaire'),
('flamme solaire', E'', 'https://magenoir.com/cards/EN/fire/solar_flame.png', 'en', 'Solar Flame');

--========================================================================================================================
-- Fleche Ardente
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleche ardente', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Fleche Ardente
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleche ardente', E'Inflige 3 points de dégâts à l''adversaire (ou 4 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Feu/Fleche-ardente.png', 'fr', 'Fleche Ardente'),
('fleche ardente', E'Inflicts 3 damage to the opponent (or 4 if you''re a Mage Noir).', 'https://magenoir.com/cards/EN/fire/Fiery-arrow.png', 'en', 'Fiery Arrow');

--========================================================================================================================
-- Fouet De Feu
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fouet de feu', 'mage_noir', '{
  "type": "Équipement : Arme",
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
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Fouet De Feu
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fouet de feu', E'Au début de votre tour, inflige 1 point de dégâts à l''adversaire (ou 2 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Feu/Fouet-de-feu.png', 'fr', 'Fouet De Feu'),
('fouet de feu', E'At the beginning of your turn, inflicts 1 damage to the opponent (or 2 if you''re a Mage Noir).', 'https://magenoir.com/cards/EN/fire/Fire-whip.png', 'en', 'Fire Whip');

--========================================================================================================================
-- Ignition
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ignition', 'mage_noir', '{
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
  "extension": "Jeu de base",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Ignition
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('ignition', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Feu de moins à préparer. Ce tour-ci, à chaque fois qu''un sort va depuis le plateau vers la défausse, inflige 1 point de dégâts à l''adversaire.', 'https://magenoir.com/cards/FR/Feu/Ignition.png', 'fr', 'Ignition'),
('ignition', E'If you''re a Mage Noir, this spell costs 1 less Fire Mana to prepare. This turn, whenever a card goes from play to any discard pile, inflict 1 damage to the opponent.', 'https://magenoir.com/cards/EN/fire/Ignition.png', 'en', 'Ignition');

--========================================================================================================================
-- Invocation Solaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('invocation solaire', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [
    {"componentName": "Soleil", "quantity": 1}
  ],
  "extension": "Soleil",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Invocation Solaire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('invocation solaire', E'Si le sort du dessus de votre défausse est canalisable, mettez-le en jeu, canalisé comme composant (Équipements, Permanent, et Rituels ne sont pas canalisables). Zénith : inflige 2 points de dégâts à n''importe quelle cible.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://magenoir.com/cards/FR/Feu/invocation_solaire.png', 'fr', 'Invocation Solaire'),
('invocation solaire', E'If the top spell of your discard pile can be channeled, put it into play channeled. (Equipment, Permanents and Rituals cannot be channeled)Zenith: Inflicts 2 damage to any target.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://magenoir.com/cards/EN/fire/solar_invocation.png', 'en', 'Solar Invocation');

--========================================================================================================================
-- Lame Du Soleil
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lame du soleil', 'mage_noir', '{
  "type": "Équipement : Arme",
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
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Lame Du Soleil
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('lame du soleil', E'Au début de votre tour, libère 1 Mana Feu.Dès que Lame du soleil ne verrouille plus de Mana Feu, elle inflige 5 points de dégâts à TOUS les joueurs, puis elle est détruite.', 'https://magenoir.com/cards/FR/Feu/lame_du_soleil.png', 'fr', 'Lame Du Soleil'),
('lame du soleil', E'At the beginning of your turn, releases 1 Fire Mana.As soon as there''s no Fire Mana locked under Sun blade, it inflicts 5 damage to ALL players, then it is destroyed.', 'https://magenoir.com/cards/EN/fire/sun_blade.png', 'en', 'Sun Blade');

--========================================================================================================================
-- Lumiere Radieuse
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lumiere radieuse', 'mage_noir', '{
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
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Lumiere Radieuse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('lumiere radieuse', E'Regardez la carte du dessus de votre deck.Vous pouvez la laisser au-dessus, ou la mettre en dessous de votre deck.Puis piochez 1 carte.', 'https://magenoir.com/cards/FR/Feu/lumiere_radieuse.png', 'fr', 'Lumiere Radieuse'),
('lumiere radieuse', E'Look at the top card of your deck.You may leave it on top, or put it at the bottom of your deck.Then, draw 1 card.', 'https://magenoir.com/cards/EN/fire/radiant_light.png', 'en', 'Radiant Light');

--========================================================================================================================
-- Masque De Feu
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('masque de feu', 'mage_noir', '{
  "type": "Équipement : Tête",
  "element": "Feu",
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
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Masque De Feu
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('masque de feu', E'A tout moment, vous pouvez regarder la carte du dessus de votre deck. Les composants nécessaires plusieurs fois pour préparer vos sorts Feu sont nécessaires 1 fois de moins.', 'https://magenoir.com/cards/FR/Feu/Masque-de-feu.png', 'fr', 'Masque De Feu'),
('masque de feu', E'At any time, you may look at the top card of your deck. Components needed multiple times to prepare your Fire spells are needed 1 less time.', 'https://magenoir.com/cards/EN/fire/Fire-mask.png', 'en', 'Fire Mask');

--========================================================================================================================
-- Minerai D Or Solaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('minerai d or solaire', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Soleil",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Minerai D Or Solaire
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('minerai d or solaire', E'ForgeZénith : Indestructible (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )Tout Équipement qui utilise ce sort comme composant gagne les effets de Minerai d''or solaire.', 'https://magenoir.com/cards/FR/Feu/minerai_d_or_solaire.png', 'fr', 'Minerai D Or Solaire'),
('minerai d or solaire', E'ForgeZenith: Indestructible (Only activates if you started this turn with an equal number of prepared and channeled spells)Any spell using this spell as a component gains the effects of Solar gold ore.', 'https://magenoir.com/cards/EN/fire/solar_gold_ore.png', 'en', 'Solar Gold Ore');

--========================================================================================================================
-- Pluie De Flammes
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('pluie de flammes', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 2,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Pluie De Flammes
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('pluie de flammes', E'Ne peut être préparé que par un Mage Noir.Inflige 5 points de dégâts, répartis comme vous le souhaitez entre 1 à 5 cibles.', 'https://magenoir.com/cards/FR/Feu/Pluie-de-flammes.png', 'fr', 'Pluie De Flammes'),
('pluie de flammes', E'Can only be prepared by a Mage Noir.Inflicts 5 damage distributed as you choose between 1 to 5 targets.', 'https://magenoir.com/cards/EN/fire/Rain-of-flames.png', 'en', 'Rain Of Flames');

--========================================================================================================================
-- Projectile De Flamme
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('projectile de flamme', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Projectile De Flamme
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('projectile de flamme', E'Inflige 3 points de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Feu/Projectile-de-flamme.png', 'fr', 'Projectile De Flamme'),
('projectile de flamme', E'Inflicts 3 damage to any target.', 'https://magenoir.com/cards/EN/fire/Flame-projectile.png', 'en', 'Flame Projectile');

--========================================================================================================================
-- Rayon De Lumiere
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rayon de lumiere', 'mage_noir', '{
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
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Rayon De Lumiere
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rayon de lumiere', E'Le prochain sort Végétal que vous préparez ce tour-ci coûte 2 Mana Végétal de moins.Si c''est un Permanent avec PV, il arrive en jeu avec 1 PV supplémentaire.', 'https://magenoir.com/cards/FR/Feu/rayon_de_lumiere.png', 'fr', 'Rayon De Lumiere'),
('rayon de lumiere', E'The next Vegetal spell you prepare this turn costs 2 less Vegetal Mana.If it''s a Permanent with HP, it is put into play with 1 additional HP.', 'https://magenoir.com/cards/EN/fire/light_ray.png', 'en', 'Light Ray');

--========================================================================================================================
-- Rituel Du Zenith
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du zenith', 'mage_noir', '{
  "type": "Rituel",
  "element": "Feu",
  "manaCost": {
    "total": 5,
    "manaVegetal": 0,
    "manaFeu": 2,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Rituel Du Zenith
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel du zenith', E'Vous passez Mage Noir.Chaque fois qu''un sort que vous contrôlez est canalisé, payez 1 Mana Feu.Zénith : Durant votre phase principale, vous pouvez payer 1 Mana Feu pour activer 1 de vos sorts canalisés. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://magenoir.com/cards/FR/Feu/rituel_du_zenith.png', 'fr', 'Rituel Du Zenith'),
('rituel du zenith', E'You become a Mage Noir.Each time a spell you control is channeled, pay 1 Fire Mana.Zenith: During your main phase, you may pay 1 Fire Mana to activate 1 of your channeled spells.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://magenoir.com/cards/EN/fire/zenith_ritual.png', 'en', 'Zenith Ritual');

--========================================================================================================================
-- Rituel Pourpre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel pourpre', 'mage_noir', '{
  "type": "Rituel",
  "element": "Feu",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Rituel Pourpre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel pourpre', E'Lorsque ce sort arrive en jeu, perdez la moitié de vos Points de Vie actuels, arrondie à l''inférieur. Vous passez Mage Noir. Durant votre phase principale, vous pouvez perdre 1 PV pour prendre 1 Mana Feu dans l''Ether Infini et piocher 1 carte. (Vous pouvez le faire plusieurs fois par tour)', 'https://magenoir.com/cards/FR/Feu/Rituel-pourpre.png', 'fr', 'Rituel Pourpre'),
('rituel pourpre', E'When put into play, lose half of your current Health Points, rounded down. You become a Mage Noir. During your main phase, you may lose 1 HP to take 1 Fire Mana from the infinite Ether and draw 1 card. (You may do this multiple times per turn.)', 'https://magenoir.com/cards/EN/fire/Crimson-ritual.png', 'en', 'Crimson Ritual');

--========================================================================================================================
-- Robe Brulante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('robe brulante', 'mage_noir', '{
  "type": "Équipement : Torse",
  "element": "Feu",
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
  "componentCost": [
    {"componentName": "Flamme", "quantity": 2}
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Robe Brulante
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('robe brulante', E'Chaque fois qu''un sort Feu que vous contrôlez inflige des dégâts à une cible adverse, ils sont augmentés de 1 (ou 2 si vous êtes Mage Noir). Puis, Robe brûlante vous inflige 1 point de dégâts.', 'https://magenoir.com/cards/FR/Feu/Robe-brulante.png', 'fr', 'Robe Brulante'),
('robe brulante', E'If a Fire spell you control would inflict damage to an opposing target, it deals that much damage plus 1 (or 2 if you''re a Mage Noir). Then, Burning robe inflicts 1 damage to you.', 'https://magenoir.com/cards/EN/fire/Burning-robe.png', 'en', 'Burning Robe');

--========================================================================================================================
-- Soleil Artificiel
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('soleil artificiel', 'mage_noir', '{
  "type": "Permanent",
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
  "extension": "Soleil",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Soleil Artificiel
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('soleil artificiel', E'Au début de votre tour, Soleil artificiel inflige 1 point de dégâts à TOUS les joueurs. Puis payez 1 Mana Feu ou détruisez Soleil artificiel.', 'https://magenoir.com/cards/FR/Feu/soleil_artificiel.png', 'fr', 'Soleil Artificiel'),
('soleil artificiel', E'At the beginning of your turn, Artificial sun inflicts 1 damage to ALL players.Then, pay 1 Fire Mana or destroy Artificial sun.', 'https://magenoir.com/cards/EN/fire/artificial_sun.png', 'en', 'Artificial Sun');

--========================================================================================================================
-- Vague De Flammes
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vague de flammes', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 2,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Vague De Flammes
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vague de flammes', E'Inflige 1 point de dégâts à l''adversaire et ses Permanents par composant Flamme que vous contrôlez.', 'https://magenoir.com/cards/FR/Feu/Vague-de-flammes.png', 'fr', 'Vague De Flammes'),
('vague de flammes', E'Inflicts 1 damage to the opponent and their Permanents for each Flame component you control.', 'https://magenoir.com/cards/EN/fire/Wave-of-flames.png', 'en', 'Wave Of Flames');

--========================================================================================================================
-- Vents Solaires
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vents solaires', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
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
    {"componentName": "Soleil", "quantity": 1}
  ],
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Vents Solaires
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vents solaires', E'Inflige 3 points de dégâts à n''importe quelle cible.Zénith : Piochez 1 carte.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://magenoir.com/cards/FR/Feu/vents_solaires.png', 'fr', 'Vents Solaires'),
('vents solaires', E'Inflicts 3 damage to any target.Zenith: Draw 1 card.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://magenoir.com/cards/EN/fire/solar_winds.png', 'en', 'Solar Winds');

--========================================================================================================================
-- Minéral
--========================================================================================================================

--========================================================================================================================
-- Anneau De Lithomancie
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('anneau de lithomancie', 'mage_noir', '{
  "type": "Équipement : Anneau",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Anneau De Lithomancie
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('anneau de lithomancie', E'Vos permanents Minéraux ayant au moins un Point de Vie ont "Protecteur". (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://magenoir.com/cards/FR/Mineral/anneau-de-lithomancie.png', 'fr', 'Anneau De Lithomancie'),
('anneau de lithomancie', E'Your Mineral Permanents with at least one Health Point have "Protector". (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/mineral/Lithomancy-ring.png', 'en', 'Lithomancy Ring');

--========================================================================================================================
-- Arbre De Pierre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre de pierre', 'mage_noir', '{
  "type": "Permanent",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 3,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Arbre De Pierre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arbre de pierre', E'Ne peut pas gagner de Points de Vie.', 'https://magenoir.com/cards/FR/Mineral/Arbre-de-pierre.png', 'fr', 'Arbre De Pierre'),
('arbre de pierre', E'Can''t gain Health Points.', 'https://magenoir.com/cards/EN/mineral/Stone-tree.png', 'en', 'Stone Tree');

--========================================================================================================================
-- Armure Materialisee
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('armure materialisee', 'mage_noir', '{
  "type": "Équipement : Torse",
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
    {"componentName": "Armure", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Armure Materialisee
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('armure materialisee', E'Les dégâts que vous subissez sont réduits de 1. Chaque tour, ignorez jusqu''à X point de dégâts qui vous sont infligés. X est égal au nombre de Mana Minéral sous vos autres composants. X est déterminé la première fois que des dégâts vous sont infligés dans le tour. X ne peut être supérieur à 6', 'https://magenoir.com/cards/FR/Mineral/Armure-materialisee.png', 'fr', 'Armure Materialisee'),
('armure materialisee', E'Damage you take is reduced by 1. Each turn, ignore up to X damage that is inflicted to you, where X is the amount of Mineral Mana under your other components. X is determined the first time damage is inflicted to you during the turn. X can''t be more than 6.', 'https://magenoir.com/cards/EN/mineral/Materialized-armor.png', 'en', 'Materialized Armor');

--========================================================================================================================
-- Armure Solide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('armure solide', 'mage_noir', '{
  "type": "Équipement : Torse",
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
  "componentCost": [
    {"componentName": "Minerai", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Armure Solide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('armure solide', E'Chaque tour, ignorez jusqu''à X point de dégâts qui vous sont infligés. X est égal au nombre de Mana Minéral sous vos autres composants. X est déterminé la première fois que des dégâts vous sont infligés dans le tour. X ne peut être supérieur à 4.', 'https://magenoir.com/cards/FR/Mineral/Armure-solide.png', 'fr', 'Armure Solide'),
('armure solide', E'Each turn, ignore up to X damage that is inflicted to you, where X is the amount of Mineral Mana under your other components. X is determined the first time damage is inflicted to you during the turn. X can''t be more than 4.', 'https://magenoir.com/cards/EN/mineral/Solid-armor.png', 'en', 'Solid Armor');

--========================================================================================================================
-- Bastion
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('bastion', 'mage_noir', '{
  "type": "Permanent",
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
  "componentCost": [
    {"componentName": "Mur", "quantity": 2}
  ],
  "extension": "Sable",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Bastion
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('bastion', E'Vous ne pouvez pas subir plus d''1 point de dégâts à la fois.Au début de votre tour, détruisez ce Permanent.', 'https://magenoir.com/cards/FR/Mineral/bastion.png', 'fr', 'Bastion'),
('bastion', E'You cannot take more than 1 damage at once. At the beginning of your turn, destroy Bastion.', 'https://magenoir.com/cards/EN/mineral/bastion.png', 'en', 'Bastion');

--========================================================================================================================
-- Brulure De Magma
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('brulure de magma', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Roche", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Brulure De Magma
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('brulure de magma', E'Inflige 5 points de dégâts à n''importe quelle cible. Vous pouvez détruire 1 Anneau.', 'https://magenoir.com/cards/FR/Mineral/Brulure-de-magma.png', 'fr', 'Brulure De Magma'),
('brulure de magma', E'Inflicts 5 damage to any target. You may destroy 1 Ring.', 'https://magenoir.com/cards/EN/mineral/Magma-burn.png', 'en', 'Magma Burn');

--========================================================================================================================
-- Colere De Ra
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('colere de ra', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Désert1", "quantity": 1}
  ],
  "extension": "Sable",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Colere De Ra
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('colere de ra', E'Mettez 1 sort en jeu (hors Rituel) dans la défausse de son contrôleur. Si vous êtes Mage Noir, cet effet ignore Indestructible.Inflige 5 points de dégâts à l''adversaire.', 'https://magenoir.com/cards/FR/Mineral/colere_de_ra.png', 'fr', 'Colere De Ra'),
('colere de ra', E'Put any 1 spell in play (except a Ritual) into its owner''s discard pile. If you''re a Mage Noir, this ignores Indestructible.Inflicts 5 damage to the opponent.', 'https://magenoir.com/cards/EN/mineral/ra_s_wrath.png', 'en', 'Ra S Wrath');

--========================================================================================================================
-- Coup De Marteau Divin
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('coup de marteau divin', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 4,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Coup De Marteau Divin
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('coup de marteau divin', E'Détruisez 1 Équipement.', 'https://magenoir.com/cards/FR/Mineral/Coup-de-marteau-divin.png', 'fr', 'Coup De Marteau Divin'),
('coup de marteau divin', E'Destroy 1 piece of Equipment.', 'https://magenoir.com/cards/EN/mineral/Divine-hammer-strike.png', 'en', 'Divine Hammer Strike');

--========================================================================================================================
-- Couronne De La Renonciation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('couronne de la renonciation', 'mage_noir', '{
  "type": "Équipement : Tête",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Couronne De La Renonciation
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('couronne de la renonciation', E'Ne peut être équipé que par un Mage Noir. Tant que ce sort est en jeu, vous n''êtes pas Mage Noir et vos rituels n''ont pas d''effet. A tout moment payez 1 Mana pour ignorer 1 point de dégâts qui vous est infligé. Si votre réserve de Mana est vide, détruisez cet Équipement.', 'https://magenoir.com/cards/FR/Mineral/Couronne-de-la-renonciation.png', 'fr', 'Couronne De La Renonciation'),
('couronne de la renonciation', E'Can only be equipped by a Mage Noir. While this spell is in play, you are not a Mage Noir and your rituals have no effect. At any time, you may pay 1 Mana to ignore 1 damage that would be inflicted to you. When your Mana reserve is empty, destroy this Equipment.', 'https://magenoir.com/cards/EN/mineral/Waiver-crown.png', 'en', 'Waiver Crown');

--========================================================================================================================
-- Crocs Du Desert
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('crocs du desert', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 3,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Sable",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Crocs Du Desert
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('crocs du desert', E'Si vous êtes Mage Noir, vous pouvez préparer ce sort en utilisant la Mana verrouillée sous vos composants Sable.Si vous êtes Mage Noir, ce sort gagne : "Rapide" (Ce sort peut être activé à tout moment ).Inflige 3 points de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Mineral/crocs_du_desert.png', 'fr', 'Crocs Du Desert'),
('crocs du desert', E'If you''re a Mage Noir, you may prepare this spell using Mana locked under your Sand components.If you''re a Mage Noir, this spell gains: "Quickcast". (This spell can be activated at any time)Inflicts 3 damage to any target.', 'https://magenoir.com/cards/EN/mineral/desert_fangs.png', 'en', 'Desert Fangs');

--========================================================================================================================
-- Epee Materialisee
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('epee materialisee', 'mage_noir', '{
  "type": "Équipement : Arme",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 3,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Lame", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Epee Materialisee
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('epee materialisee', E'Une fois par tour, durant votre phase principale, inflige 2 points de dégâts à n''importe quelle cible. Puis la Lame utilisée comme composant pour lancer ce sort applique ses effets (même si celle-ci est dans la défausse).', 'https://magenoir.com/cards/FR/Mineral/Lame-materialisee.png', 'fr', 'Epee Materialisee'),
('epee materialisee', E'Once per turn during your main phase, inflicts 2 damage to any target. Then, the Blade used as a component to cast this spell also applies its effects (even if it is in the discard pile).', 'https://magenoir.com/cards/EN/mineral/Materialized-sword.png', 'en', 'Materialized Sword');

--========================================================================================================================
-- Graine Des Sables
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine des sables', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Sable",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Graine Des Sables
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('graine des sables', E'Le dernier sort Permanent ayant utilisé Graine des sables comme composant a l''effet :"Les dégâts infligés à ce Permanent sont réduits de 1."', 'https://magenoir.com/cards/FR/Mineral/graine_des_sables.png', 'fr', 'Graine Des Sables'),
('graine des sables', E'The last Permanent spell that used Seed of the sands as a component has the effect:"Damage inflicted to this Permanent is reduced by 1."', 'https://magenoir.com/cards/EN/mineral/seed_of_the_sands.png', 'en', 'Seed Of The Sands');

--========================================================================================================================
-- Lame Forgee
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lame forgee', 'mage_noir', '{
  "type": "Équipement : Arme",
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
  "componentCost": [
    {"componentName": "Roche", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Lame Forgee
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('lame forgee', E'Une fois par tour, durant votre phase principale, inflige 1 point de dégât à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Mineral/Lame-forgee.png', 'fr', 'Lame Forgee'),
('lame forgee', E'Once per turn during your main phase, inflicts 1 damage to any target.', 'https://magenoir.com/cards/EN/mineral/Forged-blade.png', 'en', 'Forged Blade');

--========================================================================================================================
-- Main Du Desert
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('main du desert', 'mage_noir', '{
  "type": "Permanent",
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
  "componentCost": [
    {"componentName": "Sable", "quantity": 1}
  ],
  "extension": "Sable",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Main Du Desert
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('main du desert', E'Au début de votre tour, inflige 1 point de dégâts à l''adversaire.Si vous contrôlez au moins 2 composants Sable, ce Permanent a Protecteur.', 'https://magenoir.com/cards/FR/Mineral/main_du_desert.png', 'fr', 'Main Du Desert'),
('main du desert', E'At the beginning of your turn, inflicts 1 damage to the opponent.If you control at least 2 Sand components, this Permanent has Protector.', 'https://magenoir.com/cards/EN/mineral/desert_hand.png', 'en', 'Desert Hand');

--========================================================================================================================
-- Meteore D Ina
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('meteore d ina', 'mage_noir', '{
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
    {"componentName": "Météore", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Meteore D Ina
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('meteore d ina', E'Si vous êtes Mage Noir, pour préparer ce sort, vous pouvez utiliser 4 roches au lieu d''1 composant Météore. Inflige X points de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Mineral/Meteore-d-ina.png', 'fr', 'Meteore D Ina'),
('meteore d ina', E'If you''re a Mage Noir, you may use 4 Rocks instead of 1 Meteor component to prepare this spell. Inflicts X damage to any target.', 'https://magenoir.com/cards/EN/mineral/Inas-meteor.png', 'en', 'Inas Meteor');

--========================================================================================================================
-- Meteore Du Desert
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('meteore du desert', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 4,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Sable", "quantity": 2}
  ],
  "extension": "Sable",
  "artwork": "Jeffrey Jeanson"
}');

-- Localisations pour Meteore Du Desert
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('meteore du desert', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Minéral de moins à préparer.Inflige 1 point de dégâts à n''importe quelle cible par composant Sable que vous contrôlez.', 'https://magenoir.com/cards/FR/Mineral/meteore_du_desert.png', 'fr', 'Meteore Du Desert'),
('meteore du desert', E'If you''re a Mage Noir, this spell costs 1 less Mineral Mana to prepare.Inflicts 1 damage to any target for each Sand component you control.', 'https://magenoir.com/cards/EN/mineral/desert_meteor.png', 'en', 'Desert Meteor');

--========================================================================================================================
-- Mine Souterraine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('mine souterraine', 'mage_noir', '{
  "type": "Permanent",
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
  "extension": "Sable",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Mine Souterraine
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('mine souterraine', E'Durant votre phase principale, vous pouvez payer 1 Mana Minéral pour regarder la carte du dessus de votre deck.Si c''est une Roche, vous pouvez la montrer à votre adversaire et la mettre dans votre main.Sinon, mettez-la au-dessous de votre deck.', 'https://magenoir.com/cards/FR/Mineral/mine_souterraine.png', 'fr', 'Mine Souterraine'),
('mine souterraine', E'During your main phase, you may pay 1 Mineral Mana to look at the top card of your deck.If it''s a Rock, you may show it to the opponent and put it into your hand.Otherwise, put it at the bottom of your deck.', 'https://magenoir.com/cards/EN/mineral/underground_mine.png', 'en', 'Underground Mine');

--========================================================================================================================
-- Minerai Des Temps
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('minerai des temps', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [],
  "extension": "Phase",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Minerai Des Temps
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('minerai des temps', E'Tout Équipement qui utilise ce sort comme composant coûte 1 Mana Minéral de moins.', 'https://magenoir.com/cards/FR/Mineral/minerai_des_temps.png', 'fr', 'Minerai Des Temps'),
('minerai des temps', E'Any Equipment using this spell as a component costs 1 less Mineral Mana to prepare.', 'https://magenoir.com/cards/EN/mineral/time_ore.png', 'en', 'Time Ore');

--========================================================================================================================
-- Mons Igneus
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('mons igneus', 'mage_noir', '{
  "type": "Sort",
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
    {"componentName": "Magma", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Mons Igneus
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('mons igneus', E'Inflige 5 points de dégâts à n''importe quelle cible, puis 1 composant Séisme et 1 composant Magma que vous contrôlez appliquent leurs effets.', 'https://magenoir.com/cards/FR/Mineral/Mons-igneus.png', 'fr', 'Mons Igneus'),
('mons igneus', E'Inflicts 5 damage to any target, then apply the effects of 1 Earthquake and 1 Magma component you control', 'https://magenoir.com/cards/EN/mineral/Mons-igneus.png', 'en', 'Mons Igneus');

--========================================================================================================================
-- Mur De Roche
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('mur de roche', 'mage_noir', '{
  "type": "Permanent",
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
  "componentCost": [
    {"componentName": "Roche", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Mur De Roche
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('mur de roche', E'Lorsque ce Permanent a moins de un Point de Vie, libérez sa Mana et canalisez-le en composant plutôt que de le détruire. Celui-ci ne compte alors plus comme composant Mur.', 'https://magenoir.com/cards/FR/Mineral/Mur-de-roche.png', 'fr', 'Mur De Roche'),
('mur de roche', E'Once this Permanent has less than one Health Point, release its Mana and channel it as a Rock component instead of destroying it. It does not count as a Wall component anymore.', 'https://magenoir.com/cards/EN/mineral/Rock-wall.png', 'en', 'Rock Wall');

--========================================================================================================================
-- Mur Du Desert
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('mur du desert', 'mage_noir', '{
  "type": "Permanent",
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
  "componentCost": [
    {"componentName": "Sable", "quantity": 2}
  ],
  "extension": "Sable",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Mur Du Desert
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('mur du desert', E'Lorsqu''il arrive en jeu, déplacez autant de Mana Minéral que vous le souhaitez de vos composants Sable sous ce Permanent.Mur du désert arrive en jeu avec autant de PV qu''il verrouille de Mana Minéral.Si vous êtes Mage Noir, ce Permanent a Protecteur.', 'https://magenoir.com/cards/FR/Mineral/mur_du_desert.png', 'fr', 'Mur Du Desert'),
('mur du desert', E'When put into play, move any amount of Mineral Mana from your Sand components under Desert wall.Desert wall is put into play with HP equal to the amount of Mineral Mana locked under it.If you''re a Mage Noir, this Permanent has Protector.', 'https://magenoir.com/cards/EN/mineral/desert_wall.png', 'en', 'Desert Wall');

--========================================================================================================================
-- Oasis
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('oasis', 'mage_noir', '{
  "type": "Permanent",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Désert", "quantity": 1}
  ],
  "extension": "Sable",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Oasis
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('oasis', E'Lorsque vous activez un sort Désert, vous pouvez payer 1 Mana Eau pour le renvoyer dans votre main au lieu de le défausser.', 'https://magenoir.com/cards/FR/Mineral/oasis.png', 'fr', 'Oasis'),
('oasis', E'Whenever you activate a Desert spell, you may pay 1 Water Mana to return it to your hand instead of discarding it.', 'https://magenoir.com/cards/EN/mineral/oasis.png', 'en', 'Oasis');

--========================================================================================================================
-- Poing Meteore
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('poing meteore', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
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
  "componentCost": [
    {"componentName": "Roche", "quantity": 2}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Poing Meteore
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('poing meteore', E'Inflige 5 points de dégâts à l''adversaire. Puis vous inflige 2 points de dégâts. Puis inflige 2 points de dégâts à TOUS les Permanents.', 'https://magenoir.com/cards/FR/Mineral/Poing-meteore.png', 'fr', 'Poing Meteore'),
('poing meteore', E'Inflicts 5 damage to the opponent. Then, inflicts 2 damage to you. Then, inflicts 2 damage to EVERY Permanent.', 'https://magenoir.com/cards/EN/mineral/Meteor-punch.png', 'en', 'Meteor Punch');

--========================================================================================================================
-- Reforger
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('reforger', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Sable",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Reforger
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('reforger', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé ) Les dégâts d''un Équipement de votre choix sont augmentés de 1.Puis vous pouvez payer 1 Mana Eau pour renvoyer Reforger dans votre main au lieu de le défausser.', 'https://magenoir.com/cards/FR/Mineral/reforger.png', 'fr', 'Reforger'),
('reforger', E'Slowcast (This spell can''t be activated on the turn it was prepared)Damage inflicted by target Equipment you control is increased by 1.Then, you may pay 1 Water Mana to return Reforge to your hand instead of discarding it.', 'https://magenoir.com/cards/EN/mineral/reforge.png', 'en', 'Reforge');

--========================================================================================================================
-- Replique De Verre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('replique de verre', 'mage_noir', '{
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
  "extension": "Sable",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Replique De Verre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('replique de verre', E'Prenez 1 Équipement dans votre deck. Il perd tous ses effets. Mettez-le en jeu. Il est toujours un Équipement et correspond toujours à son emplacement désigné.Mélangez votre deck.', 'https://magenoir.com/cards/FR/Mineral/replique_de_verre.png', 'fr', 'Replique De Verre'),
('replique de verre', E'Take 1 piece of Equipment from your deck. It loses all its effects. Put it into play. It retains its card type and Equipment type.Shuffle your deck.', 'https://magenoir.com/cards/EN/mineral/glass_replica.png', 'en', 'Glass Replica');

--========================================================================================================================
-- Rituel D Exuviation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel d exuviation', 'mage_noir', '{
  "type": "Rituel",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 2
  },
  "components": [],
  "componentCost": [],
  "extension": "Sable",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Rituel D Exuviation
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel d exuviation', E'Vous passez Mage Noir.Vos sorts coûtent 1 Mana Minéral de moins à préparer.Les dégâts qui vous sont infligés sont augmentés de 1.', 'https://magenoir.com/cards/FR/Mineral/rituel_d_exuviation.png', 'fr', 'Rituel D Exuviation'),
('rituel d exuviation', E'You become a Mage Noir.Your spells cost 1 less Mineral Mana to prepare.Damage inflicted to you is increased by 1.', 'https://magenoir.com/cards/EN/mineral/ecdysis_ritual.png', 'en', 'Ecdysis Ritual');

--========================================================================================================================
-- Rituel Du Guerrier Mage
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du guerrier mage', 'mage_noir', '{
  "type": "Rituel",
  "element": "Minéral",
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
  "componentCost": [],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Rituel Du Guerrier Mage
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel du guerrier mage', E'Vous passez Mage Noir. A la fin de votre tour, détruisez tous les Équipements que vous avez joué ce tour-ci. Les dégâts infligés par vos Équipements sont augmentés de 1. A tout moment vous pouvez défausser 1 carte de votre main pour que l''Équipement ciblé soit indestructible ce tour-ci.', 'https://magenoir.com/cards/FR/Mineral/Rituel-du-guerrier-mage.png', 'fr', 'Rituel Du Guerrier Mage'),
('rituel du guerrier mage', E'You become a Mage Noir. At the end of your turn, destroy all Equipment you played this turn. Damage inflicted by your Equipment is increased by 1. At any time, you may discard 1 card to make target Equipment you control indestructible until the end of the turn.', 'https://magenoir.com/cards/EN/mineral/Warrior-mage-ritual.png', 'en', 'Warrior Mage Ritual');

--========================================================================================================================
-- Roche
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('roche', 'mage_noir', '{
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
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Roche
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('roche', E'Si vous contrôlez 2 exemplaires de ce sort, ils ont "Transmutable : Minerai". Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.) Prenez 1 Mana Minéral dans l''Ether disponible puis infligez 1 point de dégât à 1 Permanent.', 'https://magenoir.com/cards/FR/Mineral/Roche.png', 'fr', 'Roche'),
('roche', E'If you control 2 copies of this spell, they have "Transmutable : Ore". (These spells can be used as Ore components.) Forge. (Is discarded once used as a component for Equipment.) Take 1 Mineral Mana from the Available Ether and deal 1 damage to 1 Permanent.', 'https://magenoir.com/cards/EN/mineral/Iron-rock.png', 'en', 'Rock');

--========================================================================================================================
-- Roche D Obsidienne
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('roche d obsidienne', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 4,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Roche D Obsidienne
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('roche d obsidienne', E'Lorsque des dégâts vous sont infligés, ce sort libère 1 Mana Minéral. Lorsqu''il ne verrouille plus de Mana, ce sort a Transmutable : Minerai (Ce sort est utilisable comme composant Minerai.) Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.) Ajoutez 1 à chaque chiffre dans l''effet de tout Équipement utilisant ce sort comme composant.', 'https://magenoir.com/cards/FR/Mineral/Roche-d-obsidienne.png', 'fr', 'Roche D Obsidienne'),
('roche d obsidienne', E'When damage is inflicted to you, this spell releases 1 Mineral Mana. As soon as there''s no Mana locked under it, this spell gains "Transmutable : Ore" (This spell can be used as a Ore component.) Forge. (Is discarded once used as a component for Equipment.) Add 1 to every number in the effects of any Equipment using this spell as a component.', 'https://magenoir.com/cards/EN/mineral/Obsidian-rock.png', 'en', 'Obsidian Rock');

--========================================================================================================================
-- Roche Ferreuse
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('roche ferreuse', 'mage_noir', '{
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
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Roche Ferreuse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('roche ferreuse', E'Durant votre phase principale, vous pouvez placer 1 Mana Feu de votre réserve de Mana sous ce sort. Il gagne alors "Transmutable : Minerai" (Ce sort est utilisable comme composant Minerai.) Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.)', 'https://magenoir.com/cards/FR/Mineral/Roche-ferreuse.png', 'fr', 'Roche Ferreuse'),
('roche ferreuse', E'During your main phase, you may put 1 Fire Mana from your Mana reserve under this spell. Then, it gains "Transmutable : Ore" (This spell can be used as an Ore component.). Forge.(Is discarded once used as a component for Equipment.)', 'https://magenoir.com/cards/EN/mineral/Solid-rock.png', 'en', 'Iron Rock');

--========================================================================================================================
-- Roche Friable
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('roche friable', 'mage_noir', '{
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
  "extension": "Sable",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Roche Friable
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('roche friable', E'Durant votre phase principale, vous pouvez payer 1 Mana Minéral pour que ce sort gagne "Transmutable : Sable" jusqu''à la fin du tour.Lorsque vous activez Roche friable, inflige 1 point de dégâts à n''importe quelle cible.', 'https://magenoir.com/cards/FR/Mineral/roche_friable.png', 'fr', 'Roche Friable'),
('roche friable', E'During your main phase, you may pay 1 Mineral Mana to have this spell gain: "Transmutable: Sand" until the end of your turn.When activated, inflicts 1 damage to any target.', 'https://magenoir.com/cards/EN/mineral/crumbling_rock.png', 'en', 'Crumbling Rock');

--========================================================================================================================
-- Sable Fin
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sable fin', 'mage_noir', '{
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
  "extension": "Sable",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Sable Fin
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('sable fin', E'Si Sable fin verrouille plus d''1 Mana, toute Mana en excédent est immédiatement libérée, sauf si vous êtes Mage Noir.Lorsqu''un Désert va à la défausse, verrouillez 1 Mana Minéral de celui-ci sous Sable fin au lieu de la libérer.', 'https://magenoir.com/cards/FR/Mineral/sable_fin.png', 'fr', 'Sable Fin'),
('sable fin', E'Whenever Fine sand locks more than 1 Mana, any excess Mana is instantly released, unless you''re a Mage Noir.When a Desert spell goes to the discard pile, lock 1 Mineral Mana from it under Fine sand instead of releasing it.', 'https://magenoir.com/cards/EN/mineral/fine_sand.png', 'en', 'Fine Sand');

--========================================================================================================================
-- Sables Mouvants
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sables mouvants', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
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
  "extension": "Sable",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Sables Mouvants
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('sables mouvants', E'Transmutable : GoutteRapide (Ce sort peut être activé à tout moment )1 sort en préparation de votre choix gagne : "Lent". (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )', 'https://magenoir.com/cards/FR/Mineral/sables_mouvants.png', 'fr', 'Sables Mouvants'),
('sables mouvants', E'Transmutable: Drop, SandQuickcast (This spell can be activated at any time)1 prepared spell gains: "Slowcast". (This spell can''t be activated on the turn it was prepared)', 'https://magenoir.com/cards/EN/mineral/quicksand.png', 'en', 'Quicksand');

--========================================================================================================================
-- Seisme
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('seisme', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 6,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 6,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Seisme
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('seisme', E'Inflige 4 points de dégâts à l''adversaire. Si vous êtes Mage Noir, détruisez TOUS les Permanents.', 'https://magenoir.com/cards/FR/Mineral/Seisme.png', 'fr', 'Seisme'),
('seisme', E'Inflicts 4 damage to the opponent. If you''re a Mage Noir, destroy EVERY Permanent.', 'https://magenoir.com/cards/EN/mineral/Earthquake.png', 'en', 'Earthquake');

--========================================================================================================================
-- Sirocco
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sirocco', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Sable",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Sirocco
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('sirocco', E'Transmutable : Sable, SoufflePiochez 1 carte.Si vous êtes Mage Noir, renvoyez 1 sort canalisé dans la main de son propriétaire.', 'https://magenoir.com/cards/FR/Mineral/sirocco.png', 'fr', 'Sirocco'),
('sirocco', E'Transmutable: Sand, BreathDraw 1 card.If you''re a Mage Noir, return 1 channeled spell to its owner''s hand.', 'https://magenoir.com/cards/EN/mineral/sirocco.png', 'en', 'Sirocco');

--========================================================================================================================
-- Vague Du Desert
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vague du desert', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 3,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Sable", "quantity": 2}
  ],
  "extension": "Sable",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Vague Du Desert
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('vague du desert', E'Lorsque vous préparez ce sort, déplacez autant de Mana Minéral que vous le souhaitez depuis vos composants Sable sous Vague du désert.Inflige X points de dégâts à n''importe quelle cible.X est égal au nombre de Mana Minéral verrouillée par ce sort.', 'https://magenoir.com/cards/FR/Mineral/vague_du_desert.png', 'fr', 'Vague Du Desert'),
('vague du desert', E'When you prepare this spell, move any amount of Mineral Mana from your Sand components under Desert wave. Inflicts X damage to any target, where X is the amount of Mineral Mana locked under this spell.', 'https://magenoir.com/cards/EN/mineral/desert_wave.png', 'en', 'Desert Wave');

--========================================================================================================================
-- Volee Aiguisee
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('volee aiguisee', 'mage_noir', '{
  "type": "Sort",
  "element": "Minéral",
  "manaCost": {
    "total": 4,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 0,
    "manaMineral": 2,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Roche", "quantity": 2}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Volee Aiguisee
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('volee aiguisee', E'Vous inflige 1 point de dégâts 5 fois, à moins que vous ne soyez Mage Noir. Inflige 1 point de dégâts à l''adversaire 5 fois.', 'https://magenoir.com/cards/FR/Mineral/Volee-aiguisee.png', 'fr', 'Volee Aiguisee'),
('volee aiguisee', E'Inflicts 1 damage to you 5 times, unless you''re a Mage Noir. Inflicts 1 damage to the opponent 5 times.', 'https://magenoir.com/cards/EN/mineral/Sharp-volley.png', 'en', 'Sharp Volley');

--========================================================================================================================
-- Végétal
--========================================================================================================================

--========================================================================================================================
-- Anneau Du Druide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('anneau du druide', 'mage_noir', '{
  "type": "Équipement : Anneau",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 3,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Anneau Du Druide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('anneau du druide', E'Les dégâts infligés par les Permanents Végétaux que vous contrôlez sont augmentés de 2.Si vous êtes Mage Noir, lorsque vous ajoutez de la Mana dans l''Ether disponible au début de votre tour, ajoutez 1 Mana Végétal supplémentaire.', 'https://magenoir.com/cards/FR/Vegetal/Anneau-du-druide.png', 'fr', 'Anneau Du Druide'),
('anneau du druide', E'Damage inflicted by Vegetal Permanents you control is increased by 2.If you''re a Mage Noir, when you add Mana to the Available Ether at the beginning of your turn, add 1 additional Vegetal Mana.', 'https://magenoir.com/cards/EN/vegetal/Druid-ring.png', 'en', 'Druid Ring');

--========================================================================================================================
-- Arbre Anime
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre anime', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 3,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Graine", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Arbre Anime
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arbre anime', E'Lorsqu''il arrive en jeu, défausse la Graine utilisée comme composant.Au début de votre tour, inflige 2 points de dégâts à l''adversaire, puis vous pouvez mettre 1 Graine en préparation depuis votre défausse.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://magenoir.com/cards/FR/Vegetal/Arbre-anime.png', 'fr', 'Arbre Anime'),
('arbre anime', E'When put into play, discard the Seed component used to cast it.At the beginning of your turn, inflicts 2 damage to the opponent, then you may put 1 Seed from your discard pile into play prepared.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/vegetal/Animated-tree.png', 'en', 'Animated Tree');

--========================================================================================================================
-- Arbre En Flammes
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre en flammes', 'mage_noir', '{
  "type": "Permanent",
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
  "componentCost": [
    {"componentName": "Arbre", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Arbre En Flammes
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arbre en flammes', E'Si vous êtes Mage Noir, préparer ce sort nécessite 1 composant de moins.Au début de votre tour, ce Permanent inflige 2 points de dégâts à l''adversaire, puis il perd 1 Point de Vie.', 'https://magenoir.com/cards/FR/Vegetal/Arbre-en-flammes.png', 'fr', 'Arbre En Flammes'),
('arbre en flammes', E'If you''re a Mage Noir, preparing this spell requires 1 less component.At the beginning of your turn, this Permanent inflicts 2 damage to the opponent, then loses 1 Health Point.', 'https://magenoir.com/cards/EN/vegetal/Tree-in-flames.png', 'en', 'Tree In Flames');

--========================================================================================================================
-- Arbre Mort
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre mort', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Arbre Mort
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arbre mort', E'Si vous êtes Mage Noir, ce Permanent a Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://magenoir.com/cards/FR/Vegetal/Arbre-mort.png', 'fr', 'Arbre Mort'),
('arbre mort', E'If you''re a Mage Noir, this Permanent has Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/vegetal/Dead-tree.png', 'en', 'Dead Tree');

--========================================================================================================================
-- Armure D Ecorce
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('armure d ecorce', 'mage_noir', '{
  "type": "Équipement : Torse",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Arbre", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Armure D Ecorce
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('armure d ecorce', E'Chaque tour, ignorez jusqu''à 1 point de dégâts adverses qui vous sont infligés.', 'https://magenoir.com/cards/FR/Vegetal/Armure-d-ecorce.png', 'fr', 'Armure D Ecorce'),
('armure d ecorce', E'Each turn, ignore up to 1 inflicted damage you receive from the opponent.', 'https://magenoir.com/cards/EN/vegetal/Bark-armor.png', 'en', 'Bark Armor');

--========================================================================================================================
-- Armure De Druide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('armure de druide', 'mage_noir', '{
  "type": "Équipement : Torse",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Écorce", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Armure De Druide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('armure de druide', E'Chaque tour, ignorez jusqu''à 3 points de dégâts adverses qui vous sont infligés.', 'https://magenoir.com/cards/FR/Vegetal/Armure-de-druide.png', 'fr', 'Armure De Druide'),
('armure de druide', E'Each turn, ignore up to 3 inflicted damage you receive from the opponent.', 'https://magenoir.com/cards/EN/vegetal/Druid-armor.png', 'en', 'Druid Armor');

--========================================================================================================================
-- Baguette De Druide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('baguette de druide', 'mage_noir', '{
  "type": "Équipement : Arme",
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
  "componentCost": [
    {"componentName": "Écorce", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Baguette De Druide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('baguette de druide', E'Au début de votre tour, inflige 1 point de dégâts par Équipement Druide que vous contrôlez à n''importe quelle cible.Si vous êtes Mage Noir, Baguette de druide ne détruit pas les Équipements qu''elle utilise comme composants, et elle n''est pas détruite lorsqu''un Équipement l''utilise comme composant.', 'https://magenoir.com/cards/FR/Vegetal/baguette_de_druide.png', 'fr', 'Baguette De Druide'),
('baguette de druide', E'At the beginning of your turn, inflicts 1 damage per Druid Equipment you control to any target.If you are a Mage Noir, this piece of Equipment does not destroy Equipment that it uses as a component, and it is not destroyed when used as a component to prepare other Equipment.', 'https://magenoir.com/cards/EN/vegetal/druid_wand.png', 'en', 'Druid Wand');

--========================================================================================================================
-- Champ De Tournesols
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('champ de tournesols', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Champ De Tournesols
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('champ de tournesols', E'Transmutable : FleurLorsqu''il arrive en jeu, allez chercher 1 sort Soleil dans votre deck, montrez-le à votre adversaire, mettez-le dans votre main, puis mélangez votre deck.Vos sorts Soleil coûtent 1 Mana Feu de moins à préparer.', 'https://magenoir.com/cards/FR/Vegetal/champ_de_tournesol.png', 'fr', 'Champ De Tournesols'),
('champ de tournesols', E'Transmutable : FlowerWhen put into play, take 1 Sun card from your deck, show it to the opponent, put it into your hand and shuffle your deck.Your Sun spells cost 1 less Fire Mana to prepare.', 'https://magenoir.com/cards/EN/vegetal/sunflower_field.png', 'en', 'Sunflower Field');

--========================================================================================================================
-- Cornes De Druide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('cornes de druide', 'mage_noir', '{
  "type": "Équipement : Tête",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Cornes De Druide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('cornes de druide', E'A tout moment, vous pouvez regarder la carte du dessus de votre deck. Si c''est une Graine, montrez-la à votre adversaire et mettez-la dans votre main.Vos Graines coûtent 1 Mana Végétal de moins. Si vous êtes Mage Noir, vos Graines coûtent 0 Mana.', 'https://magenoir.com/cards/FR/Vegetal/Cornes-de-druide.png', 'fr', 'Cornes De Druide'),
('cornes de druide', E'At any time, you may look at the top card of your deck. If it''s a Seed, show it to your opponent and put it into your hand.Your Seeds cost 1 less Vegetal Mana. If you''re a Mage Noir, your Seeds cost 0 Mana.', 'https://magenoir.com/cards/EN/vegetal/Druid-horns.png', 'en', 'Druid Horns');

--========================================================================================================================
-- Croissance De Fleur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('croissance de fleur', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Fleur", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Croissance De Fleur
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('croissance de fleur', E'La cible de votre choix gagne 2 PV.Regardez les 3 cartes du dessus de votre deck. Vous pouvez choisir 1 carte Fleur parmi celles-ci, la montrer à votre adversaire, puis la mettre dans votre main. Mettez le reste au dessous de votre deck dans l''ordre de votre choix.', 'https://magenoir.com/cards/FR/Vegetal/croissance_de_fleurs.png', 'fr', 'Croissance De Fleur'),
('croissance de fleur', E'Any target gains 2 HP.Look at the top 3 cards of your deck. You may take 1 Flower card from them, show it to the opponent and then put it in your hand.Put the rest at the bottom of your deck in any order.', 'https://magenoir.com/cards/EN/vegetal/flower_growth.png', 'en', 'Flower Growth');

--========================================================================================================================
-- Distillation De Seve
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('distillation de seve', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Distillation De Seve
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('distillation de seve', E'Prenez 3 Mana de votre choix dans l''Éther Infini (ou 4 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Vegetal/distillation_de_seve.png', 'fr', 'Distillation De Seve'),
('distillation de seve', E'Take 3 Mana of your choice from the Infinite Ether (or 4 if you''re a Mage Noir).', 'https://magenoir.com/cards/EN/vegetal/sap_distillation.png', 'en', 'Sap Distillation');

--========================================================================================================================
-- Fleur De Kerloc H
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleur de kerloc h', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Graine1", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Fleur De Kerloc H
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleur de kerloc h', E'Unique, sauf si vous êtes Mage Noir.Au début de votre tour, inflige 2 points de dégâts à l''adversaire, puis ce permanent gagne 1 PV (ou 2 si vous contrôlez au moins 4 composants Goutte).', 'https://magenoir.com/cards/FR/Vegetal/fleur_de_kerloc_h.png', 'fr', 'Fleur De Kerloc H'),
('fleur de kerloc h', E'Unique, unless you''re a Mage Noir.At the beginning of your turn, inflicts 2 damage to the opponent, then this Permanent gains 1 HP (or 2 if you control at least 4 Drop components).', 'https://magenoir.com/cards/EN/vegetal/kerloch_s_flower.png', 'en', 'Kerloc H S Flower');

--========================================================================================================================
-- Fleur Fractale
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleur fractale', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [],
  "extension": "Fleurs",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Fleur Fractale
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleur fractale', E'Au début de votre tour, inflige 1 point de dégâts à l''adversaire, puis, si vous êtes Mage Noir, choisissez une carte Fleur dans votre défausse et mettez-la dans votre main.Automne (Lorsqu''il est détruit, ce Permanent applique ses effets de début de tour )', 'https://magenoir.com/cards/FR/Vegetal/fleur_fractale.png', 'fr', 'Fleur Fractale'),
('fleur fractale', E'At the beginning of your turn, inflicts 1 damage to the opponent, then, if you''re a Mage Noir, return 1 Flower spell from your discard pile to your hand.Autumn (When it is destroyed, this Permanent applies its start-of-turn effects)', 'https://magenoir.com/cards/EN/vegetal/fractal_flower.png', 'en', 'Fractal Flower');

--========================================================================================================================
-- Fleur Hypnotique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleur hypnotique', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Fleur Hypnotique
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleur hypnotique', E'Votre adversaire perd 2 Points de Vie (ou 3 si vous êtes Mage Noir).Votre adversaire pioche 1 carte.', 'https://magenoir.com/cards/FR/Vegetal/fleur_hypnotique.png', 'fr', 'Fleur Hypnotique'),
('fleur hypnotique', E'The opponent loses 2 HP (or 3 if you''re a Mage Noir).The opponent draws 1 card.', 'https://magenoir.com/cards/EN/vegetal/hypnotic_flower.png', 'en', 'Hypnotic Flower');

--========================================================================================================================
-- Fleurs D Arbre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleurs d arbre', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Fleur", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Fleurs D Arbre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleurs d arbre', E'Chaque Permanent Végétal que vous contrôlez libère 1 Mana Végétal.', 'https://magenoir.com/cards/FR/Vegetal/fleurs_d_arbre.png', 'fr', 'Fleurs D Arbre'),
('fleurs d arbre', E'Each Vegetal Permanent you control releases 1 Vegetal Mana.', 'https://magenoir.com/cards/EN/vegetal/tree_flowers.png', 'en', 'Tree Flowers');

--========================================================================================================================
-- Fleurs De Ronces
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleurs de ronces', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Fleurs",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Fleurs De Ronces
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleurs de ronces', E'Lorsqu''un Permanent avec des PV que vous contrôlez subit des dégâts, inflige 1 point de dégâts à l''adversaire.', 'https://magenoir.com/cards/FR/Vegetal/fleurs_de_ronces.png', 'fr', 'Fleurs De Ronces'),
('fleurs de ronces', E'When a Permanent with HP you control takes damage, inflicts 1 damage to the opponent.', 'https://magenoir.com/cards/EN/vegetal/bramble_flowers.png', 'en', 'Bramble Flowers');

--========================================================================================================================
-- Floraison Letale
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('floraison letale', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 3,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Fleur", "quantity": 2}
  ],
  "extension": "Fleurs",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Floraison Letale
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('floraison letale', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )L''adversaire perd 5 PV.Défaussez 1 composant Fleur que vous contrôlez.', 'https://magenoir.com/cards/FR/Vegetal/floraison_letale.png', 'fr', 'Floraison Letale'),
('floraison letale', E'Slowcast (This spell can''t be activated on the turn it was prepared) The opponent loses 5 HP.Discard 1 Flower component you control.', 'https://magenoir.com/cards/EN/vegetal/lethal_flourish.png', 'en', 'Lethal Flourish');

--========================================================================================================================
-- Foret Enchantee
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('foret enchantee', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 2,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Arbre", "quantity": 2}
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Foret Enchantee
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('foret enchantee', E'Au début de votre tour, vous et vos Permanents Végétaux qui ont des Points de Vie gagnez 2 Points de Vie.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://magenoir.com/cards/FR/Vegetal/Foret-enchantee.png', 'fr', 'Foret Enchantee'),
('foret enchantee', E'At the beginning of your turn, you and your Vegetal Permanents with Health Points gain 2 HP.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/vegetal/Enchanted-forest.png', 'en', 'Enchanted Forest');

--========================================================================================================================
-- Foret Hostile
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('foret hostile', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 3,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Arbre", "quantity": 3}
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Foret Hostile
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('foret hostile', E'Au début de votre tour, inflige X points de dégâts à n''importe quelle cible, X étant les Points de Vie actuels de ce Permanent.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent)', 'https://magenoir.com/cards/FR/Vegetal/Foret-hostile.png', 'fr', 'Foret Hostile'),
('foret hostile', E'At the beginning of your turn, inflicts X damage to any target, where X is the current Health Points of this Permanent.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/vegetal/Hostile-forest.png', 'en', 'Hostile Forest');

--========================================================================================================================
-- Graine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Graine
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('graine', E'Vous gagnez 1 Point de Vie.', 'https://magenoir.com/cards/FR/Vegetal/Graine.png', 'fr', 'Graine'),
('graine', E'You gain 1 Health Point.', 'https://magenoir.com/cards/EN/vegetal/Seed.png', 'en', 'Seed');

--========================================================================================================================
-- Graine Bourgeonnante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine bourgeonnante', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Fleurs",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Graine Bourgeonnante
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('graine bourgeonnante', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Allez chercher 1 carte Fleur dans votre deck, montrez-la à votre adversaire, mettez-la dans votre main, puis mélangez votre deck.', 'https://magenoir.com/cards/FR/Vegetal/graine_bourgeonnante.png', 'fr', 'Graine Bourgeonnante'),
('graine bourgeonnante', E'Slowcast (This spell can''t be activated on the turn it was prepared) Take 1 Flower card from your deck, show it to the opponent, put it into your hand and shuffle your deck.', 'https://magenoir.com/cards/EN/vegetal/budding_seed.png', 'en', 'Budding Seed');

--========================================================================================================================
-- Graine Germee
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine germee', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Graine Germee
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('graine germee', E'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.)Allez chercher 1 carte Arbre dans votre deck, montrez-la à votre adversaire, mettez-la dans votre main, puis mélangez votre deck.', 'https://magenoir.com/cards/FR/Vegetal/Graine-germee.png', 'fr', 'Graine Germee'),
('graine germee', E'Transmutable : Drop (This spell can be used as a Drop component.)Take 1 Tree card from your deck, show it to the opponent, put it into your hand and shuffle your deck.', 'https://magenoir.com/cards/EN/vegetal/Sprouted-seed.png', 'en', 'Sprouted Seed');

--========================================================================================================================
-- Infusion Florale
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('infusion florale', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
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
    {"componentName": "Fleur1", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Infusion Florale
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('infusion florale', E'Tant que ce sort est en préparation, au début de votre tour, mettez 1 Mana Végétal de l''Éther Infini sous ce sort.Lorsque vous l''activez, piochez X cartes, où X est le nombre de Mana verrouillées par ce sort. X ne peut être supérieur au nombre de composants Gouttes que vous contrôlez.', 'https://magenoir.com/cards/FR/Vegetal/infusion_florale.png', 'fr', 'Infusion Florale'),
('infusion florale', E'While in preparation:At the start of your turn, lock 1 Vegetal Mana from the Infinite Ether under this spell.When activated, draw X cards, where X is the amount of Mana this spell locks. X can''t be more than the number of Drop components you control.', 'https://magenoir.com/cards/EN/vegetal/floral_infusion.png', 'en', 'Floral Infusion');

--========================================================================================================================
-- La Guerisseuse Sylvestre
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('la guerisseuse sylvestre', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour La Guerisseuse Sylvestre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('la guerisseuse sylvestre', E'Choisissez 1 option :- Le Permanent Végétal avec des Points de Vie ciblé gagne 4 Points de Vie.- Vous gagnez 3 Points de Vie.', 'https://magenoir.com/cards/FR/Vegetal/La-guerisseuse-sylvestre.png', 'fr', 'La Guerisseuse Sylvestre'),
('la guerisseuse sylvestre', E'Choose 1 option:-Target Vegetal Permanent with Health Points gains 4 HP.-You gain 3 HP.', 'https://magenoir.com/cards/EN/vegetal/The-sylvan-healer.png', 'en', 'The Sylvan Healer');

--========================================================================================================================
-- Petales Tranchants
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('petales tranchants', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Fleur", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Petales Tranchants
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('petales tranchants', E'Inflige 3 points de dégâts à n''importe quelle cible.Inflige 2 points de dégâts à un Permanent Végétal que vous contrôlez (ou 1 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Vegetal/petales_tranchants.png', 'fr', 'Petales Tranchants'),
('petales tranchants', E'Inflicts 3 damage to any target.Inflicts 2 damage to a Vegetal Permanent you control (or 1 if you''re a Mage Noir).', 'https://magenoir.com/cards/EN/vegetal/sharp_petals.png', 'en', 'Sharp Petals');

--========================================================================================================================
-- Photosynthese
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('photosynthese', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 1,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Fleurs",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Photosynthese
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('photosynthese', E'Rapide (Ce sort peut être activé à tout moment )1 Permanent Végétal que vous contrôlez gagne 2 PV.Si vous contrôlez un composant Soleil, il gagne 2 PV de plus.', 'https://magenoir.com/cards/FR/Vegetal/photosynthese.png', 'fr', 'Photosynthese'),
('photosynthese', E'Quickcast (This spell can be activated at any time) 1 Vegetal Permanent you control gains 2 HP.If you control a Sun component, it gains 2 additional HP.', 'https://magenoir.com/cards/EN/vegetal/photosynthesis.png', 'en', 'Photosynthesis');

--========================================================================================================================
-- Renouveau
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('renouveau', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Ronce", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Renouveau
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('renouveau', E'Si vous êtes Mage Noir, ce sort gagne: "Rapide" (Ce sort peut être activé à tout moment)Détruisez un Permanent Végétal.À la fin de ce tour, remettez-le en jeu depuis la défausse.', 'https://magenoir.com/cards/FR/Vegetal/renouveau.png', 'fr', 'Renouveau'),
('renouveau', E'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Destroy a Vegetal Permanent. At the end of the turn, put it back into play from the discard pile.', 'https://magenoir.com/cards/EN/vegetal/renewal.png', 'en', 'Renewal');

--========================================================================================================================
-- Rituel De Decomposition
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel de decomposition', 'mage_noir', '{
  "type": "Rituel",
  "element": "Végétal",
  "manaCost": {
    "total": 5,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 3
  },
  "components": [],
  "componentCost": [],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Rituel De Decomposition
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel de decomposition', E'Vous passez Mage Noir.Au début de votre tour, perdez 1 Point de Vie.Durant votre phase principale, vous pouvez détruire 1 Permanent que vous contrôlez pour infliger un montant de dégâts égal à ses Points de Vie à n''importe quelle cible.(Vous pouvez le faire plusieurs fois par tour)', 'https://magenoir.com/cards/FR/Vegetal/Rituel-de-decomposition.png', 'fr', 'Rituel De Decomposition'),
('rituel de decomposition', E'You become a Mage Noir.At the beginning of your turn, you lose 1 Health Point.During your main phase, you may destroy 1 Permanent you control to inflict damage equal to its HP to any target.(You may do this multiple times per turn.)', 'https://magenoir.com/cards/EN/vegetal/Ritual-of-decomposition.png', 'en', 'Ritual Of Decomposition');

--========================================================================================================================
-- Rituel Des Saisons
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel des saisons', 'mage_noir', '{
  "type": "Rituel",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [],
  "extension": "Fleurs",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Rituel Des Saisons
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel des saisons', E'Vous passez Mage Noir.Lorsque ce sort arrive en jeu, vos Permanents Végétaux perdent 1 PV.Durant votre phase principale, vous pouvez faire perdre 1 PV à un Permanent que vous contrôlez, puis celui-ci gagne : "Automne". (Lorsqu''il est détruit, ce Permanent applique ses effets de début de tour )', 'https://magenoir.com/cards/FR/Vegetal/rituel_des_saisons.png', 'fr', 'Rituel Des Saisons'),
('rituel des saisons', E'You become a Mage Noir.When put into play, your Vegetal Permanents lose 1 HP.During your main phase, you may have a Permanent you control lose 1 HP, then it gains: "Autumn". (When it is destroyed, this Permanent applies its start-of-turn effects)', 'https://magenoir.com/cards/EN/vegetal/ritual_of_seasons.png', 'en', 'Ritual Of Seasons');

--========================================================================================================================
-- Robe De Kerloch
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('robe de kerloch', 'mage_noir', '{
  "type": "Équipement : Torse",
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
  "componentCost": [
    {"componentName": "Druide", "quantity": 2}
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Robe De Kerloch
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('robe de kerloch', E'Les dégâts des sorts Végétaux (dont Permanents) que vous contrôlez sont augmentés de 3.Les dégâts qui vous sont infligés sont réduits de 2.A tout moment, vous pouvez détruire cet Équipement et défausser toute votre main pour annuler les dégâts qui vous sont infligés jusqu''à la fin du tour.', 'https://magenoir.com/cards/FR/Vegetal/Robe-de-kerloch.png', 'fr', 'Robe De Kerloch'),
('robe de kerloch', E'Damage from Vegetal spells you control (Permanents included) is increased by 3.Inflicted damage you take is reduced by 2.At any time, you may sacrifice this Equipment and discard your hand to prevent all damage you would take until the end of the turn.', 'https://magenoir.com/cards/EN/vegetal/kerlochs-robe.png', 'en', 'Kerlochs Robe');

--========================================================================================================================
-- Roi Des Arbres
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('roi des arbres', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 5,
    "manaVegetal": 5,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Arbre", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Roi Des Arbres
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('roi des arbres', E'Unique (Vous ne pouvez contrôler qu''un seul exemplaire de cette carte)Au début de votre tour, inflige 2 points de dégâts à l''adversaire pour chaque Arbre sur le plateau.Si vous êtes Mage Noir, vos autres Arbres appliquent leurs effets 1 fois de plus.', 'https://magenoir.com/cards/FR/Vegetal/Roi-des-arbres.png', 'fr', 'Roi Des Arbres'),
('roi des arbres', E'Unique (You may only control one copy of this card)At the beginning of your turn, inflicts 2 damage to the opponent for every Tree in play.If you''re a Mage Noir, your other Trees apply their effects 1 more time.', 'https://magenoir.com/cards/EN/vegetal/King_of_trees.png', 'en', 'King Of Trees');

--========================================================================================================================
-- Ronces Ephemeres
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ronces ephemeres', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2,
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
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Ronces Ephemeres
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('ronces ephemeres', E'L''adversaire choisit 1 option :- Il défausse 1 carte de sa main- Il perd 3 Points de Vie', 'https://magenoir.com/cards/FR/Vegetal/Ronces-ephemeres.png', 'fr', 'Ronces Ephemeres'),
('ronces ephemeres', E'The opponent chooses 1 option:- They discard 1 card in hand.- They lose 3 Health Points.', 'https://magenoir.com/cards/EN/vegetal/Ephemeral-brambles.png', 'en', 'Ephemeral Brambles');

--========================================================================================================================
-- Semee Prodigieuse
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('semee prodigieuse', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Graine", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Semee Prodigieuse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('semee prodigieuse', E'Tant que ce Permanent est en jeu, jusqu''à 3 composants Graine que vous contrôlez ont : "Transmutable : Arbre" (Ce sort est utilisable comme composant Arbre.)Au début de votre tour, payez 1 Mana Végétal et 1 Mana Eau ou détruisez Semée prodigieuse.', 'https://magenoir.com/cards/FR/Vegetal/Semee-prodigieuse.png', 'fr', 'Semee Prodigieuse'),
('semee prodigieuse', E'As long as this Permanent is in play, up to 3 Seed components you control have Transmutable : Tree (This spell can be used as a Tree component.)At the beginning of your turn, pay 1 Vegetal Mana and 1 Water Mana or destroy Prodigious sowing.', 'https://magenoir.com/cards/EN/vegetal/Prodigious-sowing.png', 'en', 'Prodigious Sowing');

--========================================================================================================================
-- Tourment D Epines
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tourment d epines', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 3,
    "manaFeu": 0,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Ronce", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Tourment D Epines
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('tourment d epines', E'Si l''adversaire a pioché plus d''1 carte ce tour-ci, ce sort est Rapide. (Ce sort peut être activé à tout moment )L''adversaire peut défausser autant de cartes de sa main qu''il le souhaite.Puis ce sort lui inflige 1 point de dégâts par carte qu''il a en main.', 'https://magenoir.com/cards/FR/Vegetal/tourment_d_epines.png', 'fr', 'Tourment D Epines'),
('tourment d epines', E'If the opponent drew more than 1 card this turn, this spell has Quickcast. (This spell can be activated at any time) The opponent may discard any number of cards from hand.Then, this spell inflicts 1 damage to them per card they have in hand.', 'https://magenoir.com/cards/EN/vegetal/thorn_torment.png', 'en', 'Thorn Torment');
