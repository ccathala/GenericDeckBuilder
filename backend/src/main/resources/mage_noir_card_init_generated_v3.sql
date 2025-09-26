-- Fichier SQL généré automatiquement pour les cartes Mage Noir
-- Généré le : 2025-09-26 17:06:32
-- Nombre de cartes : 301
-- Cartes avec correspondance FR/EN : 301

-- Ce script vérifie si chaque carte existe déjà avant de l'ajouter
-- Si la carte existe, elle n'est PAS ajoutée (ON CONFLICT DO NOTHING)
-- Si la carte n'existe pas, elle est ajoutée avec ses localisations

--========================================================================================================================
-- Air
--========================================================================================================================

--========================================================================================================================
-- Accélération
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Accélération
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('acceleration', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Arcane de moins à préparer.Piochez 2 cartes.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Acceleration.png', 'https://magenoir.com/collection/FR/air/Acceleration.html', 'fr', 'Accélération'),
('acceleration', E'If you''re a Mage Noir, this spell costs 1 less Arcane Mana to prepare.Draw 2 cards.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Acceleration.png', 'https://magenoir.com/collection/EN/air/Acceleration.html', 'en', 'Acceleration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Aigle
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('aigle', 'mage_noir', '{
  "type": "Animal",
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
  "componentCost": [],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Jessica Heran"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Aigle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('aigle', E'Rapide. Appliquez les effets d''un composant Étincelle que vous contrôlez. Le prochain sort que vous préparez ce tour-ci a Rapide jusqu''à votre prochain tour.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/aigle.png', 'https://magenoir.com/collection/FR/air/Aigle.html', 'fr', 'Aigle'),
('aigle', E'Quickcast. Apply the effects of a Spark component you control. The next spell you prepare this turn has Quickcast until your next turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/eagle.png', 'https://magenoir.com/collection/EN/air/Eagle.html', 'en', 'Eagle')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Ailes enchantées
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ailes enchantees', 'mage_noir', '{
  "type": "Permanent",
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
    {"componentName": "Vent", "quantity": 1}
  ],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Ailes enchantées
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ailes enchantees', E'Lorsque vous activez un sort Air, vous pouvez régénérer votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/ailes_enchantees.png', 'https://magenoir.com/collection/FR/air/Ailes-enchantees.html', 'fr', 'Ailes enchantées'),
('ailes enchantees', E'When you activate an Air spell, you may rest your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/enchanted_wings.png', 'https://magenoir.com/collection/EN/air/Enchanted_wings.html', 'en', 'Enchanted wings')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Amulette du zéphyr
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('amulette du zephyr', 'mage_noir', '{
  "type": "Équipement : Amulette",
  "element": "Air",
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
  "componentCost": [],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Amulette du zéphyr
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('amulette du zephyr', E'Une fois par tour durant votre phase principale, vous pouvez mélanger votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/amulette_du_zephyr.png', 'https://magenoir.com/collection/FR/air/Amulette-du-zephyr.html', 'fr', 'Amulette du zéphyr'),
('amulette du zephyr', E'Once per turn during your main phase, you may shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/zephyr_s_amulet.png', 'https://magenoir.com/collection/EN/air/Zephyr-s-amulet.html', 'en', 'Zephyr''s amulet')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Appel de la foudre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Appel de la foudre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('appel de la foudre', E'Inflige 2 points de dégâts à n''importe quelle cible.Vous pouvez montrer 1 sort Tonnerre de votre deck à votre adversaire, puis mélanger votre deck, et mettre ce Tonnerre au dessus de celui-ci.Si vous êtes Mage Noir, mettez-le dans votre main à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/appel_de_la_foudre.png', 'https://magenoir.com/collection/FR/air/Appel-de-la-foudre.html', 'fr', 'Appel de la foudre'),
('appel de la foudre', E'Inflicts 2 damage to any target.You may take 1 Thunder card from your deck, show it to the opponent, then shuffle your deck and put that card on top of it.If you''re a Mage Noir, put it into your hand instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/lightning_call.png', 'https://magenoir.com/collection/EN/air/Lightning-call.html', 'en', 'Lightning call')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Arc de foudre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Arc de foudre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('arc de foudre', E'Rapide (Ce sort peut être activé à tout moment )Inflige 2 points de dégâts à n''importe quelle cible.Appliquez les effets d''1 composant Étincelle que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/arc_de_foudre.png', 'https://magenoir.com/collection/FR/air/Arc-de-foudre.html', 'fr', 'Arc de foudre'),
('arc de foudre', E'Quickcast (This spell can be activated at any time)Inflicts 2 damage to any target.Apply the effects of 1 Spark component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/lightning_arc.png', 'https://magenoir.com/collection/EN/air/Lightning-arc.html', 'en', 'Lightning arc')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Baguette des courants d'air
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Baguette des courants d'air
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('baguette des courants d air', E'Lorsqu''il arrive en jeu, défausse le composant Vent utilisé pour le lancer, sauf si vous êtes Mage Noir.Au début de votre tour, piochez 1 carte, puis ce sort inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Baguette-des-courants-d-air.png', 'https://magenoir.com/collection/FR/air/Baguette_des_courants_d_air.html', 'fr', 'Baguette des courants d''air'),
('baguette des courants d air', E'When put into play, discard the Wind component used to cast it unless you''re a Mage Noir. At the beginning of your turn, draw 1 card, then this spell inflicts 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Wand-of-air-currents.png', 'https://magenoir.com/collection/EN/air/Wand-of-air-currents.html', 'en', 'Wand of air currents')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Balayage puissant
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Balayage puissant
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('balayage puissant', E'Renvoyez 1 Équipement dans la main de son propriétaire. Si vous êtes Mage Noir, piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Balayage-puissant.png', 'https://magenoir.com/collection/FR/air/Balayage_puissant.html', 'fr', 'Balayage puissant'),
('balayage puissant', E'Return 1 piece of Equipment to its owner''s hand. If you''re a Mage Noir, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Powerful-swipe.png', 'https://magenoir.com/collection/EN/air/Powerful-swipe.html', 'en', 'Powerful swipe')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Bobine Tesla
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('bobine tesla', E'Si un sort Étincelle ou Foudre inflige des dégâts à Bobine Tesla, piochez 1 carte.Si un autre sort lui inflige des dégâts, inflige autant de dégâts à l’adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/bobine_tesla.png', 'https://magenoir.com/collection/FR/air/Bobine-tesla.html', 'fr', 'Bobine Tesla'),
('bobine tesla', E'If a Spark or Lightning spell inflicts damage to Tesla coil, you draw 1 card.If another spell inflicts damage to Tesla coil, Tesla coil inflicts that much damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/tesla_coil.png', 'https://magenoir.com/collection/EN/air/Tesla-coil.html', 'en', 'Tesla coil')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Bottes statiques
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Bottes statiques
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('bottes statiques', E'Lorsque vous piochez votre deuxième carte chaque tour, inflige 3 points de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/bottes_statique.png', 'https://magenoir.com/collection/FR/air/Bottes-statiques.html', 'fr', 'Bottes statiques'),
('bottes statiques', E'When you draw your second card each turn, inflicts 3 damage to the opponent', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/static_boots.png', 'https://magenoir.com/collection/EN/air/Static-boots.html', 'en', 'Static boots')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Chaîne de foudre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Chaîne de foudre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('chaine de foudre', E'Inflige 1 point de dégâts à n''importe quelle cible. Puis recommencez pour chaque exemplaire de Chaîne de foudre dans votre défausse.Appliquez les effets d''un sort Foudre de votre défausse, excepté un sort Chaîne de foudre.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/chaine_de_foudre.png', 'https://magenoir.com/collection/FR/air/Chaine-de-foudre.html', 'fr', 'Chaîne de foudre'),
('chaine de foudre', E'Inflicts 1 damage to any target.Repeat for each copy of Lightning chain in your discard pile.Apply the effects of a Lightning spell from your discard pile, except a Lightning chain spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/lightning_chain.png', 'https://magenoir.com/collection/EN/air/Lightning-chain.html', 'en', 'Lightning chain')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Corbeau
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('corbeau', 'mage_noir', '{
  "type": "Animal",
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
  "componentCost": [],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Jessica Heran"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Corbeau
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('corbeau', E'Regardez la 3ème carte de votre deck. Vous pouvez la mettre au-dessus de celui-ci. Si vous avez pioché X cartes ce tour-ci, où X est le nombre de Mana sous cet Animal, mettez 1 de vos Mana Air sous cet Animal pour piocher 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/corbeau.png', 'https://magenoir.com/collection/FR/air/Corbeau.html', 'fr', 'Corbeau'),
('corbeau', E'Look at the 3rd card of your deck. You may put that card on top of it. If you drew X cards this turn, where X is the amount of Mana under this Animal, put 1 Air Mana under this Animal to draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/crow.png', 'https://magenoir.com/collection/EN/air/Crow.html', 'en', 'Crow')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Cri strident
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('cri strident', 'mage_noir', '{
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
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Cri strident
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('cri strident', E'Rapide si vous êtes Mage Noir. Activez 1 composant Souffle que vous contrôlez. Inflige 2 points de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/cri_strident.png', 'https://magenoir.com/collection/FR/air/Cri-strident.html', 'fr', 'Cri strident'),
('cri strident', E'Quickcast if you''re a Mage Noir. Activate 1 Breath component you control. Inflicts 2 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/shrill_cry.png', 'https://magenoir.com/collection/EN/air/Shrill-cry.html', 'en', 'Shrill cry')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Éclair d'inspiration
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Éclair d'inspiration
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('eclair d inspiration', E'Piochez 1 carte.Piochez 1 carte supplémentaire pour chaque composant Inspiration que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/eclair_d_inspiration.png', 'https://magenoir.com/collection/FR/air/Eclair-d-inspiration.html', 'fr', 'Éclair d''inspiration'),
('eclair d inspiration', E'Draw 1 card.Draw 1 additional card for each Inspiration component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/flash_inspiration.png', 'https://magenoir.com/collection/EN/air/Flash-of-inspiration.html', 'en', 'Flash of inspiration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Étincelle de flamme
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Étincelle de flamme
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('etincelle de flamme', E'Après que ce sort est utilisé comme composant, défaussez-le, sauf si vous êtes Mage Noir.Lorsque ce sort est défaussé depuis le plateau, inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/etincelle_de_flamme.png', 'https://magenoir.com/collection/FR/air/Etincelle-de-flamme.html', 'fr', 'Étincelle de flamme'),
('etincelle de flamme', E'After this spell is used as a component, discard it unless you''re a Mage Noir.When this spell is discarded from play, it inflicts 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/flame_spark.png', 'https://magenoir.com/collection/EN/air/Flame-spark.html', 'en', 'Flame spark')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Étincelle électrique
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Étincelle électrique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('etincelle electrique', E'Inflige 1 point de dégâts à l''adversaire.Piochez 1 carte.Défaussez-vous d''1 carte en main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/etincelle_electrique.png', 'https://magenoir.com/collection/FR/air/Etincelle-electrique.html', 'fr', 'Étincelle électrique'),
('etincelle electrique', E'Inflicts 1 damage to the opponent.Draw 1 card.Discard 1 card from hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/electric_spark.png', 'https://magenoir.com/collection/EN/air/Electric-spark.html', 'en', 'Electric spark')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Étincelle statique
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Étincelle statique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('etincelle statique', E'Lorsque ce sort est défaussé depuis votre main, il applique ses effets.Inflige 1 point de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/etincelle_statique.png', 'https://magenoir.com/collection/FR/air/Etincelle-statique.html', 'fr', 'Étincelle statique'),
('etincelle statique', E'When this spell is discarded from hand, it applies its effects.Inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/static_spark.png', 'https://magenoir.com/collection/EN/air/Static-spark.html', 'en', 'Static spark')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Graine dans le vent
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Graine dans le vent
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('graine dans le vent', E'Ce sort coûte 1 Mana Air de moins si vous contrôlez un composant Souffle. Lorsque ce sort quitte le plateau, piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Graine-dans-le-vent.png', 'https://magenoir.com/collection/FR/air/Graine_dans_le_vent.html', 'fr', 'Graine dans le vent'),
('graine dans le vent', E'This spell costs 1 less Air Mana if you control a Breath component. When this spell leaves play, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Seed-in-the-wind.png', 'https://magenoir.com/collection/EN/air/Seed-in-the-wind.html', 'en', 'Seed in the wind')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lame d'air
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lame d'air
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lame d air', E'Inflige 3 points de dégâts à n''importe quelle cible. Ils ne peuvent pas être ignorés, réduits, ni redirigés.Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Lame-d-air.png', 'https://magenoir.com/collection/FR/air/Lame_d_air.html', 'fr', 'Lame d''air'),
('lame d air', E'Inflicts 3 damage to any target. It cannot be ignored, reduced or redirected.Put 1 Breath component you control back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Air-blade.png', 'https://magenoir.com/collection/EN/air/Air-blade.html', 'en', 'Air blade')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lame de foudre
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
    {"componentName": "Étincelle", "quantity": 1},
    {"componentName": "Minerai", "quantity": 1}
  ],
  "extension": "Électrique",
  "artwork": "Luca Siméone"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lame de foudre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lame de foudre', E'Une fois par tour pendant votre phase principale, inflige 2 points de dégâts à l''adversaire.Si l''adversaire ne subit aucun de ces dégâts, choisissez 1 Équipement qu''il contrôle : celui-ci n''applique plus ses effets jusqu''à la fin de votre tour.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/lame_de_foudre.png', 'https://magenoir.com/collection/FR/air/Lame-de-foudre.html', 'fr', 'Lame de foudre'),
('lame de foudre', E'Once per turn during your main phase, inflicts 2 damage to the opponent.If the opponent doesn''t take any damage this way, choose 1 piece of Equipment they control: it doesn''t apply its effects until the end of your turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/lightning_blade.png', 'https://magenoir.com/collection/EN/air/Lightning-blade.html', 'en', 'Lightning blade')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Meurtre de corbeaux
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('meurtre de corbeaux', 'mage_noir', '{
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
    {"componentName": "Corbeau", "quantity": 1}
  ],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Meurtre de corbeaux
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('meurtre de corbeaux', E'Libérez jusqu''à 3 Mana Air verrouillées par votre Corbeau. Inflige 1 point de dégâts à n''importe quelle cible autant de fois que le nombre de Mana libérées de cette manière.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/meurtre_de_corbeaux.png', 'https://magenoir.com/collection/FR/air/Meurtre-de-corbeaux.html', 'fr', 'Meurtre de corbeaux'),
('meurtre de corbeaux', E'Release up to 3 Air Mana locked by your Crow. Inflicts 1 damage to any target for each Mana released this way.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/murder_of_crows.png', 'https://magenoir.com/collection/EN/air/Murder-of-crows.html', 'en', 'Murder of crows')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Orage
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('orage', 'mage_noir', '{
  "type": "Permanent",
  "element": "Air",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 2,
    "manaEau": 1,
    "manaMineral": 0,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Vent", "quantity": 1}
  ],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Orage
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('orage', E'Unique Lorsqu''il arrive en jeu, défausse le composant Vent utilisé pour le lancer, sauf si vous êtes Mage Noir. Chaque fois que vous piochez une carte, inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/orage.png', 'https://magenoir.com/collection/FR/air/Orage.html', 'fr', 'Orage'),
('orage', E'Unique When put into play, discard the Wind component used to cast it, unless you''re a Mage Noir. Each time you draw a card, inflicts 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/storm.png', 'https://magenoir.com/collection/EN/air/Storm.html', 'en', 'Storm')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Plongeon Aérien
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('plongeon aerien', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Aigle", "quantity": 1}
  ],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Plongeon Aérien
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('plongeon aerien', E'Inflige 2 points de dégâts à l''adversaire. Regardez sa main et choisissez-y une carte. Votre adversaire la défausse. Exilez votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/plongeon_aerien.png', 'https://magenoir.com/collection/FR/air/Plongeon-aerien.html', 'fr', 'Plongeon Aérien'),
('plongeon aerien', E'Inflicts 2 damage to the opponent. Look at the opponent''s hand and choose a card from it. They discard it. Exile your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/aerial_dive.png', 'https://magenoir.com/collection/EN/air/Aerial-dive.html', 'en', 'Aerial dive')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Poing électrique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('poing electrique', 'mage_noir', '{
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
    {"componentName": "Étincelle", "quantity": 1}
  ],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Poing électrique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('poing electrique', E'Rapide (Ce sort peut être activé à tout moment.) Inflige 2 points de dégâts à l''adversaire. Les échanges de Mana se font à 3 pour 1 ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/poing_electrique.png', 'https://magenoir.com/collection/FR/air/Poing-electrique.html', 'fr', 'Poing électrique'),
('poing electrique', E'Quickcast (This spell can be activated at any time.) Inflicts 2 damage to the opponent. Mana trades are at a rate of 3 for 1 this turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/electric_punch.png', 'https://magenoir.com/collection/EN/air/Electric-punch.html', 'en', 'Electric punch')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Réflexes éclairs
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('reflexes eclairs', 'mage_noir', '{
  "type": "Permanent",
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
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Réflexes éclairs
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('reflexes eclairs', E'Les sorts que vous contrôlez avec un effet de pioche ont "Rapide". (Ces sorts peuvent être activés à tout moment.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/reflexes_eclair.png', 'https://magenoir.com/collection/FR/air/Reflexes-eclairs.html', 'fr', 'Réflexes éclairs'),
('reflexes eclairs', E'Spells you control with a draw effect have "Quickcast".(These spells can be activated at any time.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/flash_reflexes.png', 'https://magenoir.com/collection/EN/air/Flash-reflexes.html', 'en', 'Flash reflexes')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel Aérien
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel aerien', 'mage_noir', '{
  "type": "Rituel",
  "element": "Air",
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
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel Aérien
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel aerien', E'Vous passez Mage Noir. Vous n''avez plus de phase de pioche. Une fois par tour durant votre phase principale, vous pouvez piocher 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/rituel_aerien.png', 'https://magenoir.com/collection/FR/air/Rituel-aerien.html', 'fr', 'Rituel Aérien'),
('rituel aerien', E'You become a Mage Noir. You have no more draw phase. Once per turn during your main phase, you may draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/aerial_ritual.png', 'https://magenoir.com/collection/EN/air/Aerial-ritual.html', 'en', 'Aerial ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel du vide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du vide', 'mage_noir', '{
  "type": "Rituel",
  "element": "Air",
  "manaCost": {;
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel du vide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du vide', E'Vous passez Mage Noir. Votre taille de main maximale devient 4. Défaussez-vous immédiatement pour avoir 4 cartes maximum en main. Durant votre tour, défaussez 1 carte de votre main pour infliger 1 point de dégâts à n''importe quelle cible. (Vous pouvez le faire plusieurs fois par tour)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Rituel-du-vide.png', 'https://magenoir.com/collection/FR/air/Rituel_du_vide.html', 'fr', 'Rituel du vide'),
('rituel du vide', E'You become a Mage Noir. Your maximum hand size becomes 4. Discard right away to have 4 cards maximum in hand. During your turn, you may discard a card from your hand to inflict 1 damage to any target. (You may do this multiple times per turn.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Emptiness-ritual.png', 'https://magenoir.com/collection/EN/air/Emptiness-ritual.html', 'en', 'Emptiness ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel supraconducteur
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel supraconducteur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel supraconducteur', E'Vous passez Mage Noir.Les effets de dégâts des sorts que vous activez durant le tour de votre adversaire sont augmentés de 1.Durant votre tour, vos sorts ne peuvent pas infliger plus de 2 dégâts à la fois.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/rituel_supraconducteur.png', 'https://magenoir.com/collection/FR/air/Rituel-supraconducteur.html', 'fr', 'Rituel supraconducteur'),
('rituel supraconducteur', E'You become a Mage Noir.Damage from spells you activate during the opponent''s turn is increased by 1. During your turn, your spells cannot inflict more than 2 damage at once.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/supraconductor_ritual.png', 'https://magenoir.com/collection/EN/air/Superconductor-ritual.html', 'en', 'Superconductor ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Robe du hurleur
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Robe du hurleur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('robe du hurleur', E'Ne peut être préparé que par un Mage Noir. Les sorts Air que vous préparez coûtent 1 Mana Air de moins. Les dégâts des sorts Air que vous contrôlez sont augmentés de 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Robe-du-hurleur.png', 'https://magenoir.com/collection/FR/air/Robe_du_hurleur.html', 'fr', 'Robe du hurleur'),
('robe du hurleur', E'Can only be prepared by a Mage Noir Air spells you prepare cost 1 less Air Mana. Damage from Air spells you control is increased by 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Howlers-robe.png', 'https://magenoir.com/collection/EN/air/Howlers-robe.html', 'en', 'Howler''s robe')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rugissement de Raijin
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rugissement de Raijin
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rugissement de raijin', E'Si vous êtes Mage Noir, ce sort gagne : "Rapide". (Ce sort peut être activé à tout moment )Inflige 3 points de dégâts à n''importe quelle cible.Appliquez les effets d''un composant Foudre que vous contrôlez, puis défaussez-le.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/rugissement_de_raijin.png', 'https://magenoir.com/collection/FR/air/Rugissement-de-raijin.html', 'fr', 'Rugissement de Raijin'),
('rugissement de raijin', E'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Inflicts 3 damage to any target.Apply the effects of a Lightning component you control, then discard it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/raijin_s_roar.png', 'https://magenoir.com/collection/EN/air/Raijin-s-roar.html', 'en', 'Raijin''s roar')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Souffle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('souffle', E'Prenez jusqu''à 2 Mana Air dans l''Ether Disponible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Souffle.png', 'https://magenoir.com/collection/FR/air/Souffle.html', 'fr', 'Souffle'),
('souffle', E'Take up to 2 Air Mana from the Available Ether.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Breath.png', 'https://magenoir.com/collection/EN/air/Breath.html', 'en', 'Breath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Souffle de flammes
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Souffle de flammes
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('souffle de flammes', E'Inflige 3 points de dégâts à 1 Permanent. Ils ne peuvent pas être ignorés, réduits, ni redirigés. Après que ce sort est utilisé comme composant, défaussez-le. Vous pouvez payer 1 Mana Feu ou Air pour ne pas le défausser.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Souffle-de-flammes.png', 'https://magenoir.com/collection/FR/air/Souffle_de_flammes.html', 'fr', 'Souffle de flammes'),
('souffle de flammes', E'Inflicts 3 damage to any 1 Permanent. It cannot be ignored, reduced or redirected. After this spell is used as a component, discard it. You may pay 1 Fire or Air Mana to prevent it from being discarded.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Breath-of-flames.png', 'https://magenoir.com/collection/EN/air/Breath-of-flames.html', 'en', 'Breath of flames')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Souffle de la guérisseuse
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Souffle de la guérisseuse
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('souffle de la guerisseuse', E'Vous gagnez 1 Point de Vie puis piochez 1 carte. Si vous contrôlez un composant Souffle, gagnez à nouveau 1 Point de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Souffle-de-la-guerisseuse.png', 'https://magenoir.com/collection/FR/air/Souffle_de_la_guerisseuse.html', 'fr', 'Souffle de la guérisseuse'),
('souffle de la guerisseuse', E'You gain 1 Health Point and draw 1 card. If you control a Breath component, gain 1 HP again.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Healers-breath.png', 'https://magenoir.com/collection/EN/air/Healers-breath.html', 'en', 'Healer''s breath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Souffle étincelle
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Souffle étincelle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('souffle etincelle', E'Inflige 1 point de dégâts à 1 Permanent.Prenez 1 Mana Air dans l''Éther Disponible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/souffle_etincelle.png', 'https://magenoir.com/collection/FR/air/Souffle-etincelle.html', 'fr', 'Souffle étincelle'),
('souffle etincelle', E'Inflicts 1 damage to 1 Permanent.Take 1 Air Mana from the Available Ether.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/spark_breath.png', 'https://magenoir.com/collection/EN/air/Spark-breath.html', 'en', 'Spark breath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Souffle levant
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('souffle levant', 'mage_noir', '{
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
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Souffle levant
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('souffle levant', E'Si ce sort doit être placé en troisième position de votre deck, mettez-le au dessus de votre deck à la place (ou dans votre main si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/souffle_levant.png', 'https://magenoir.com/collection/FR/air/Souffle-levant.html', 'fr', 'Souffle levant'),
('souffle levant', E'If this spell would be put into your deck third from the top, put it on top of your deck instead (or in your hand if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/levantera_breath.png', 'https://magenoir.com/collection/EN/air/Levantera-breath.html', 'en', 'Levantera breath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Sublimation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sublimation', 'mage_noir', '{
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
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Sublimation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sublimation', E'Rapide Choisissez 1 autre sort en préparation. Son propriétaire peut le défausser ou le canaliser. S''il est défaussé, la Mana qu''il verrouillait va dans la réserve de son propriétaire et celui-ci pioche 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/sublimation.png', 'https://magenoir.com/collection/FR/air/Sublimation.html', 'fr', 'Sublimation'),
('sublimation', E'Quickcast Choose 1 other prepared spell. Its owner may discard or channel it. If it is discarded, the Mana it locked goes to its owner''s Mana reserve, and they draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/sublimation.png', 'https://magenoir.com/collection/EN/air/Sublimation.html', 'en', 'Sublimation')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Supraconductivité
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
    {"componentName": "Infiltration", "quantity": 1},
    {"componentName": "Glace", "quantity": 1}
  ],
  "extension": "Glace",
  "artwork": "Aurelien Segeat"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Supraconductivité
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('supraconductivite', E'Vos sorts qui ont Lent gagnent : "Rapide". (Ces sorts peuvent être activés à tout moment )(Un sort qui a Lent et Rapide peut être activé à tout moment, sauf le tour durant lequel il a été préparé.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/supraconductivite.png', 'https://magenoir.com/collection/FR/air/Supraconductivite.html', 'fr', 'Supraconductivité'),
('supraconductivite', E'Your spells with Slowcast gain: "Quickcast". (This spell can be activated at any time) (A spell with Slowcast and Quickcast can be activated at any time except the turn it was prepared.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/superconductivity.png', 'https://magenoir.com/collection/EN/air/Superconductivity.html', 'en', 'Superconductivity')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Symphonie d'Éole
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('symphonie d eole', 'mage_noir', '{
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
    {"componentName": "Zéphyr", "quantity": 1}
  ],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Symphonie d'Éole
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('symphonie d eole', E'Inflige 4 points de dégâts à n''importe quelle cible. Piochez 1 carte (ou 2 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/symphonie_d_eole.png', 'https://magenoir.com/collection/FR/air/Symphonie-d-eole.html', 'fr', 'Symphonie d''Éole'),
('symphonie d eole', E'Inflicts 4 damage to any target. Draw 1 card (or 2 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/aeolus_s_symphony.png', 'https://magenoir.com/collection/EN/air/Aeolus-s-symphony.html', 'en', 'Aeolus''s symphony')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Tonnerre Anticipé
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tonnerre anticipe', 'mage_noir', '{
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
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Tonnerre Anticipé
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('tonnerre anticipe', E'Inflige 3 points de dégâts à n''importe quelle cible (ou 4 si vous êtes Mage Noir). Si le sort du dessus de votre défausse est une Foudre, ces dégâts sont augmentés de 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/tonnerre_anticipe.png', 'https://magenoir.com/collection/FR/air/Tonnerre-anticipe.html', 'fr', 'Tonnerre Anticipé'),
('tonnerre anticipe', E'Inflicts 3 damage to any target (or 4 if you''re a Mage Noir). If a Lightning spell is on top of your discard pile, this damage is increased by 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/expected_thunder.png', 'https://magenoir.com/collection/EN/air/Expected-thunder.html', 'en', 'Expected thunder')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Tonnerre de zeus
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Tonnerre de zeus
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('tonnerre de zeus', E'Ne peut être préparé que par un Mage Noir.Rapide (Ce sort peut être activé à tout moment)Inflige 5 points de dégâts à l''adversaire.Jusqu''au début de votre prochain tour, l''adversaire ne peut gagner des cartes en main que durant sa phase de pioche.(Les effets annulés ainsi sont ignorés.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/tonnerre_de_zeus.png', 'https://magenoir.com/collection/FR/air/Tonnerre-de-zeus.html', 'fr', 'Tonnerre de zeus'),
('tonnerre de zeus', E'Can only be prepared by a Mage Noir.Quickcast (This spell can be activated at any time)Inflicts 5 damage to the opponent.Until the beginning of your next turn, the opponent can only add cards to their hand during their draw phase. (Effects negated this way are ignored)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/zeus_s_thunder.png', 'https://magenoir.com/collection/EN/air/Zeus-s-thunder.html', 'en', 'Zeus''s thunder')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Tonnerre étourdissant
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Tonnerre étourdissant
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('tonnerre etourdissant', E'Rapide (Ce sort peut être activé à tout moment )Jusqu''au début de votre prochain tour, TOUS les sorts gagnent : "Lent". (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/tonnerre_etourdissant.png', 'https://magenoir.com/collection/FR/air/Tonnerre-etourdissant.html', 'fr', 'Tonnerre étourdissant'),
('tonnerre etourdissant', E'Quickcast (This spell can be activated at any time)Until the beginning of your next turn, ALL spells gain: "Slowcast". (This spell can''t be activated on the turn it was prepared)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/stunning_thunder.png', 'https://magenoir.com/collection/EN/air/Stunning-thunder.html', 'en', 'Stunning thunder')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Tornade
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('tornade', E'Inflige 4 points de dégâts à n''importe quelle cible.Appliquez les effets d''1 composant Vent que vous contrôlez, puis renvoyez-le dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Tornade.png', 'https://magenoir.com/collection/FR/air/Tornade.html', 'fr', 'Tornade'),
('tornade', E'Inflicts 4 damage to any target.Apply the effects of 1 Wind component you control, then put that component back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Tornado.png', 'https://magenoir.com/collection/EN/air/Tornado.html', 'en', 'Tornado')
ON CONFLICT (card_id, locale) DO NOTHING;

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
    {"componentName": "Vent", "quantity": 1},
    {"componentName": "Vague", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Typhon
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('typhon', E'Inflige 6 points de dégâts à n''importe quelle cible.Défausse jusqu''à 3 sorts en préparation de l''adversaire.Renvoyez 1 composant Vent que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Typhon.png', 'https://magenoir.com/collection/FR/air/Typhon.html', 'fr', 'Typhon'),
('typhon', E'Inflicts 6 damage to any target.Discard up to 3 of the opponent''s prepared spells.Put 1 Wind component you control back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Typhoon.png', 'https://magenoir.com/collection/EN/air/Typhoon.html', 'en', 'Typhoon')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vague de foudre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vague de foudre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vague de foudre', E'Inflige 1 point de dégâts à n''importe quelle cible.Votre prochain sort Eau qui applique ses effets ce tour-ci gagne les effets de Vague de foudre, ajoutés après ses propres effets.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/vague_de_foudre.png', 'https://magenoir.com/collection/FR/air/Vague-de-foudre.html', 'fr', 'Vague de foudre'),
('vague de foudre', E'Inflicts 1 damage to any target.Your next Water spell to apply its effects this turn gains the effects of Wave of Lightning, added after its own effects.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/wave_of_lightning.png', 'https://magenoir.com/collection/EN/air/Wave-of-lightning.html', 'en', 'Wave of lightning')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vent du meltem
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vent du meltem', 'mage_noir', '{
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
    {"componentName": "Souffle", "quantity": 1}
  ],
  "extension": "Le Corbeau et l''Érudite",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vent du meltem
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vent du meltem', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Air de moins à préparer. Appliquez les effets d''1 composant Souffle que vous contrôlez, puis renvoyez-le dans votre deck en troisième position à partir du dessus. Piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/vent_du_meltem.png', 'https://magenoir.com/collection/FR/air/Vent-du-meltem.html', 'fr', 'Vent du meltem'),
('vent du meltem', E'This spells costs 1 less Air Mana to prepare if you''re a Mage Noir. Apply the effects of 1 Breath component you control, then put that component back into your deck, third from the top. Draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/meltem_wind.png', 'https://magenoir.com/collection/EN/air/Meltem-wind.html', 'en', 'Meltem wind')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vent tourbillonnant
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vent tourbillonnant
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vent tourbillonnant', E'Renvoyez 1 sort en préparation au-dessus du deck de son propriétaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Vent-tourbillonnant.png', 'https://magenoir.com/collection/FR/air/Vent_tourbillonnant.html', 'fr', 'Vent tourbillonnant'),
('vent tourbillonnant', E'Return 1 prepared spell on top of its owner''s deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Whirling-wind.png', 'https://magenoir.com/collection/EN/air/Whirling-wind.html', 'en', 'Whirling winds')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vent violent
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vent violent
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vent violent', E'Inflige 4 points de dégâts à n''importe quelle cible. Si vous êtes Mage Noir, les dégâts infligés sont augmentés de 1 par composant Souffle que vous contrôlez. Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Vent-violent.png', 'https://magenoir.com/collection/FR/air/Vent_violent.html', 'fr', 'Vent violent'),
('vent violent', E'Inflicts 4 damage to any target. If you''re a Mage Noir, the damage inflicted is augmented by 1 for each Breath component you control. Put 1 Breath component you control back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Violent-wind.png', 'https://magenoir.com/collection/EN/air/Violent-wind.html', 'en', 'Violent wind')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vents favorables
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vents favorables
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vents favorables', E'Ce tour-ci, vous pouvez échanger la Mana Air à 1 pour 1 dans les deux sens. Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Vents-favorables.png', 'https://magenoir.com/collection/FR/air/Vents_favorables.html', 'fr', 'Vents favorables'),
('vents favorables', E'This turn, you may trade Air Mana at a rate of 1 for 1 in either direction. Put 1 Breath component you control back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Favorable-winds.png', 'https://magenoir.com/collection/EN/air/Favorable-winds.html', 'en', 'Favorable winds')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Zap
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('zap', E'Si vous êtes Mage Noir, ce sort gagne : "Rapide" (Ce sort peut être activé à tout moment). Inflige 1 point de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/zap.png', 'https://magenoir.com/collection/FR/air/Zap.html', 'fr', 'Zap'),
('zap', E'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/zap.png', 'https://magenoir.com/collection/EN/air/Zap.html', 'en', 'Zap')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Zéphyr
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Zéphyr
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('zephyr', E'Inflige 2 points de dégâts à n''importe quelle cible.Piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Zephyr.png', 'https://magenoir.com/collection/FR/air/Zephyr.html', 'fr', 'Zéphyr'),
('zephyr', E'Inflicts 2 damage to any target.Draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Zephyr.png', 'https://magenoir.com/collection/EN/air/Zephyr.html', 'en', 'Zephyr')
ON CONFLICT (card_id, locale) DO NOTHING;

-- Nombre de cartes pour Air: 50

--========================================================================================================================
-- Arcane
--========================================================================================================================

--========================================================================================================================
-- Accélération du temps
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Accélération du temps
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('acceleration du temps', E'Tout sort utilisant ce sort comme composant gagne l''effet : "Défaussez 1 carte du dessus de votre deck."', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Acceleration-du-temps.png', 'https://magenoir.com/collection/FR/arcane/Acceleration-du-temps.html', 'fr', 'Accélération du temps'),
('acceleration du temps', E'Any spell using this as a component gains: "Discard 1 card from the top of your deck."', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Time-acceleration.png', 'https://magenoir.com/collection/EN/arcane/Time-acceleration.html', 'en', 'Time acceleration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Accélération forcée
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Accélération forcée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('acceleration forcee', E'Votre adversaire pioche 7 cartes (ou 3 s''il est Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/acceleration_forcee.png', 'https://magenoir.com/collection/FR/arcane/Acceleration-forcee.html', 'fr', 'Accélération forcée'),
('acceleration forcee', E'The opponent draws 7 cards (or 3 if they''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/forced_acceleration.png', 'https://magenoir.com/collection/EN/arcane/Forced-acceleration.html', 'en', 'Forced acceleration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Alteration du passé
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Alteration du passé
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('alteration du passe', E'Échangez les positions de deux sorts dans la défausse du joueur de votre choix.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/alteration_du_passe.png', 'https://magenoir.com/collection/FR/arcane/Alteration-du-passe.html', 'fr', 'Alteration du passé'),
('alteration du passe', E'Swap the positions of two spells in the discard pile of any player.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/alteration_of_the_past.png', 'https://magenoir.com/collection/EN/arcane/Alteration-of-the-past.html', 'en', 'Alteration of the past')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Antimatière
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Antimatière
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('antimatiere', E'Payez le coût en Mana d''1 Permanent pour le détruire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/antimatiere.png', 'https://magenoir.com/collection/FR/arcane/Antimatiere.html', 'fr', 'Antimatière'),
('antimatiere', E'Pay the Mana cost of 1 Permanent to destroy it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/antimatter.png', 'https://magenoir.com/collection/EN/arcane/Antimatter.html', 'en', 'Antimatter')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Aperçu du futur
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Aperçu du futur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('apercu du futur', E'Déphase 1 le joueur de votre choix (Défausse 1 carte du dessous de son deck).Puis ce joueur pioche 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/apercu_du_futur.png', 'https://magenoir.com/collection/FR/arcane/Apercu-du-futur.html', 'fr', 'Aperçu du futur'),
('apercu du futur', E'Phase out any player by 1. (Discard 1 card from the bottom of their deck)Then that player draws 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/glimpse_of_the_future.png', 'https://magenoir.com/collection/EN/arcane/Glimpse-of-the-future.html', 'en', 'Glimpse of the future')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Avance rapide
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Avance rapide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('avance rapide', E'Défaussez 1 composant Temps que vous contrôlez. Piochez 1 carte. Inflige 2 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Avance-rapide.png', 'https://magenoir.com/collection/FR/arcane/Avance-rapide.html', 'fr', 'Avance rapide'),
('avance rapide', E'Discard 1 Time component you control. Draw 1 card. Inflicts 2 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Fast-forward.png', 'https://magenoir.com/collection/EN/arcane/Fast-forward.html', 'en', 'Fast forward')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Blast temporel
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Blast temporel
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('blast temporel', E'Vous pouvez préparer ce sort depuis votre défausse tant qu''il n''est pas au dessus de celle-ci. Lorsque vous préparez ce sort, défaussez le composant Temps utilisé. Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Blast-temporel.png', 'https://magenoir.com/collection/FR/arcane/Blast-temporel.html', 'fr', 'Blast temporel'),
('blast temporel', E'You may prepare this spell from your discard pile as long as it isn''t on top of it. When you prepare this spell, discard the Time component used. Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Temporal-blast.png', 'https://magenoir.com/collection/EN/arcane/Temporal-blast.html', 'en', 'Temporal blast')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Bottes galactiques
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('bottes galactiques', 'mage_noir', '{
  "type": "Équipement : Pieds",
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
  "componentCost": [],
  "extension": "Le Chat et l''Astronome",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Bottes galactiques
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('bottes galactiques', E'Ne peut être préparé que par un Mage Noir. Au début de votre tour, regardez les 2 cartes du dessus de votre deck. Défaussez-en 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/bottes_galactiques.png', 'https://magenoir.com/collection/FR/arcane/Bottes-galactiques.html', 'fr', 'Bottes galactiques'),
('bottes galactiques', E'Can only be prepared by a Mage Noir. At the beginning of your turn, look at the top 2 cards of your deck. Discard 1 of them.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/galactic_boots.png', 'https://magenoir.com/collection/EN/arcane/Galactic-boots.html', 'en', 'Galactic boots')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Cape galactique
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Cape galactique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('cape galactique', E'Ne peut être préparé que par un Mage Noir. Lorsque vous devriez piocher lors de votre phase de pioche, à la place choisissez une carte dans votre défausse et mettez-la dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Cape-galactique.png', 'https://magenoir.com/collection/FR/arcane/Cape-galactique.html', 'fr', 'Cape galactique'),
('cape galactique', E'Can only be prepared by a Mage Noir. When you would draw during your draw phase, return a spell from your discard pile to your hand instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Galactic-mantle.png', 'https://magenoir.com/collection/EN/arcane/Galactic-mantle.html', 'en', 'Galactic mantle')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Chaos
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('chaos', E'Regardez la carte du dessus de votre deck. Si c''est un Équipement, un Permanent, ou un Rituel, mettez-la à la défausse. Autrement, appliquez ses effets et défaussez-la. Puis l''adversaire fait de même. Si aucun joueur n''a perdu de Point de Vie, relancez les effets de ce sort.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Chaos.png', 'https://magenoir.com/collection/FR/arcane/Chaos.html', 'fr', 'Chaos'),
('chaos', E'Look at the top card of your deck. If it''s Equipment, a Permanent or a Ritual, put it in your discard pile. Else, apply its effects and discard it. Then the opponent does the same. If no player lost any Health Points, apply the effects of this spell again.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Chaos.png', 'https://magenoir.com/collection/EN/arcane/Chaos.html', 'en', 'Chaos')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Chat
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('chat', 'mage_noir', '{
  "type": "Animal",
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
  "extension": "Le Chat et l''Astronome",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Chat
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('chat', E'Mettez 1 sort canalisé que vous contrôlez en préparation. Si vous êtes Mage Noir, échangez la place d''1 sort de votre main avec 1 sort de votre défausse.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/chat.png', 'https://magenoir.com/collection/FR/arcane/Chat.html', 'fr', 'Chat'),
('chat', E'Put 1 channeled spell you control in preparation. If you''re a Mage Noir, swap 1 spell from your hand with 1 in your discard pile, keeping its position.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/cat.png', 'https://magenoir.com/collection/EN/arcane/Cat.html', 'en', 'Cat')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Connaissance de l'Histoire
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Connaissance de l'Histoire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('connaissance de l histoire', E'Activez les effets d''1 sort de votre défausse. Si vous êtes Mage Noir, les effets du composant Temps utilisé pour Connaissance de l''Histoire s''appliquent aussi à ce sort. Si Connaissance de l''Histoire est activé depuis votre défausse, il ne peut cibler que les sorts situés en-dessous de celui-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Connaisance-de-l-histoire.png', 'https://magenoir.com/collection/FR/arcane/Connaissance-de-l-histoire.html', 'fr', 'Connaissance de l''Histoire'),
('connaissance de l histoire', E'Apply the effects of 1 spell in your discard pile. If you''re a Mage Noir, the effects of the Time component used to prepare Knowledge of history are also applied to this spell. If Knowledge of history is activated from your discard pile, it can only target spells that are located underneath it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Knowledge-of-history.png', 'https://magenoir.com/collection/EN/arcane/Knowledge-of-history.html', 'en', 'Knowledge of history')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Constellation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('constellation', 'mage_noir', '{
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
    {"componentName": "Étoile", "quantity": 1}
  ],
  "extension": "Le Chat et l''Astronome",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Constellation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('constellation', E'Exilez 1 composant Étoile que vous contrôlez. Exilez 1 Étoile en préparation que vous contrôlez. Exilez 1 Étoile de votre défausse. Appliquez les effets de toutes vos Étoiles exilées.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/constellation.png', 'https://magenoir.com/collection/FR/arcane/Constellation.html', 'fr', 'Constellation'),
('constellation', E'Exile 1 Star component you control. Exile 1 prepared Star you control. Exile 1 Star from your discard pile. Apply the effects of all your exiled Stars.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/constellation.png', 'https://magenoir.com/collection/EN/arcane/Constellation.html', 'en', 'Constellation')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Destin différé
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Destin différé
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('destin differe', E'Vous pouvez utiliser 1 composant Temps supplémentaire pour le prochain sort que vous préparez ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Destin-differe.png', 'https://magenoir.com/collection/FR/arcane/Destin-differe.html', 'fr', 'Destin différé'),
('destin differe', E'You may use 1 additional Time component for the next spell you prepare this turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Delayed-fate.png', 'https://magenoir.com/collection/EN/arcane/Delayed-fate.html', 'en', 'Delayed fate')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Écho
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('echo', 'mage_noir', '{
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
  "extension": "Le Chat et l''Astronome",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Écho
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('echo', E'Payez le coût en Mana d''1 sort en préparation que vous contrôlez pour appliquer ses effets. Exilez Écho.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/echo.png', 'https://magenoir.com/collection/FR/arcane/Echo.html', 'fr', 'Écho'),
('echo', E'Pay the Mana cost of 1 prepared spell you control to apply its effects. Exile Echo.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/echo.png', 'https://magenoir.com/collection/EN/arcane/Echo.html', 'en', 'Echo')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Étoile filante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('etoile filante', 'mage_noir', '{
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
  "extension": "Le Chat et l''Astronome",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Étoile filante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('etoile filante', E'À la fin de votre tour, activez ce sort (même s''il est canalisé). Inflige 2 points de dégâts à n''importe quelle cible (ou 3 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/etoile_filante.png', 'https://magenoir.com/collection/FR/arcane/Etoile-filante.html', 'fr', 'Étoile filante'),
('etoile filante', E'At the end of your turn, activate this spell (even if it is channeled). Inflicts 2 damage to any target (or 3 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/shooting_star.png', 'https://magenoir.com/collection/EN/arcane/Shooting-star.html', 'en', 'Shooting star')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Étoile lointaine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('etoile lointaine', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Étoile", "quantity": 1}
  ],
  "extension": "Le Chat et l''Astronome",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Étoile lointaine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('etoile lointaine', E'Lorsque ce sort devrait être défaussé, canalisez-le à la place. Inflige 1 point de dégâts à n''importe quelle cible. Si vous êtes Mage Noir, piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/etoile_lointaine.png', 'https://magenoir.com/collection/FR/arcane/Etoile-lointaine.html', 'fr', 'Étoile lointaine'),
('etoile lointaine', E'When this spell should be discarded, channel it instead. Inflicts 1 damage to any target. If you''re a Mage Noir, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/faraway_star.png', 'https://magenoir.com/collection/EN/arcane/Faraway-star.html', 'en', 'Faraway star')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Étoile supergéante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('etoile supergeante', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [],
  "extension": "Le Chat et l''Astronome",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Étoile supergéante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('etoile supergeante', E'Ce sort ne peut pas être activé. Ce sort ne peut pas être canalisé. Inflige 5 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/etoile_supergeante.png', 'https://magenoir.com/collection/FR/arcane/Etoile-supergeante.html', 'fr', 'Étoile supergéante'),
('etoile supergeante', E'This spell cannot be activated. This spell cannot be channeled. Inflicts 5 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/supergiant_star.png', 'https://magenoir.com/collection/EN/arcane/Supergiant-star.html', 'en', 'Supergiant star')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Fractale stellaire
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fractale stellaire', 'mage_noir', '{
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
  "extension": "Le Chat et l''Astronome",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Fractale stellaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fractale stellaire', E'Ne peut être préparé que par un Mage Noir. Mettez le sort du dessus de votre défausse dans votre main. Lorsqu''il va à la défausse, Fractale Stellaire va en dessous de celle-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/fractale_stellaire.png', 'https://magenoir.com/collection/FR/arcane/Fractale-stellaire.html', 'fr', 'Fractale stellaire'),
('fractale stellaire', E'Can only be prepared by a Mage Noir. Put the top spell of your discard pile into your hand. When Stellar fractal goes to the discard pile, put it on the bottom of it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/stellar_fractal.png', 'https://magenoir.com/collection/EN/arcane/Stellar-fractal.html', 'en', 'Stellar fractal')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Heaume galactique
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Heaume galactique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('heaume galactique', E'Lorsque vous préparez un sort dont le coût en Mana Arcane est supérieur ou égal à 3, celui-ci coûte 1 Mana Arcane de moins (ou 2 de moins si vous êtes Mage Noir).À tout moment, vous pouvez regarder la carte du dessous de votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/heaume_galactique.png', 'https://magenoir.com/collection/FR/arcane/Heaume-galactique.html', 'fr', 'Heaume galactique'),
('heaume galactique', E'Spells with an Arcane Mana cost of 3 or greater cost 1 less Arcane Mana to prepare (or 2 if you''re a Mage Noir).At any time, you may look at the bottom card of your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/galactic_helm.png', 'https://magenoir.com/collection/EN/arcane/Galactic-helm.html', 'en', 'Galactic helm')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Immensité de l'espace
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('immensite de l espace', 'mage_noir', '{
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
    {"componentName": "Tardigrade", "quantity": 1}
  ],
  "extension": "Le Chat et l''Astronome",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Immensité de l'espace
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('immensite de l espace', E'Reprenez 2 sorts exilés dont vous êtes le propriétaire dans votre main. Exilez votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/immensite_de_l_espace.png', 'https://magenoir.com/collection/FR/arcane/Immensite-de-l-espace.html', 'fr', 'Immensité de l''espace'),
('immensite de l espace', E'Return 2 exiled spells you own to your hand. Exile your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/vastness_of_space.png', 'https://magenoir.com/collection/EN/arcane/Vastness-of-space.html', 'en', 'Vastness of space')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Inception
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('inception', E'Renvoyez 1 sort de la défausse de l''adversaire dans sa main.Si vous êtes Mage Noir, et s''il est canalisable, vous pouvez décider de le renvoyer en jeu canalisé pour votre adversaire à la place. (Équipements, Permanents, et Rituels ne sont pas canalisables)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/inception.png', 'https://magenoir.com/collection/FR/arcane/Inception.html', 'fr', 'Inception'),
('inception', E'Return 1 spell from the opponent''s discard pile to their hand.If you''re a Mage Noir, and if it can be channeled, you may put it in play channeled as a component instead (Equipement, Permanents, and Rituals cannot be channeled).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/inception.png', 'https://magenoir.com/collection/EN/arcane/Inception.html', 'en', 'Inception')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Infiltration temporelle
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Infiltration temporelle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('infiltration temporelle', E'Déphase 3 l''adversaire.(Défausse 3 cartes du dessous de son deck )Si vous êtes Mage Noir, Déphase 3 le joueur de votre choix à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/infiltration_temporelle.png', 'https://magenoir.com/collection/FR/arcane/Infiltration-temporelle.html', 'fr', 'Infiltration temporelle'),
('infiltration temporelle', E'Phase out the opponent by 3. (Discard 3 cards from the bottom of their deck)If you''re a Mage Noir, phase out any player by 3 instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/temporal_infiltration.png', 'https://magenoir.com/collection/EN/arcane/Temporal-infiltration.html', 'en', 'Temporal infiltration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Inspiration brillante
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Inspiration brillante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('inspiration brillante', E'Piochez 2 cartes, puis défaussez-vous d''1 carte en main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Inspiration-brillante.png', 'https://magenoir.com/collection/FR/arcane/Inspiration-brillante.html', 'fr', 'Inspiration brillante'),
('inspiration brillante', E'Draw 2 cards, then discard 1 card from hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Brilliant-inspiration.png', 'https://magenoir.com/collection/EN/arcane/Brilliant-inspiration.html', 'en', 'Brilliant inspiration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Mépris cosmique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('mepris cosmique', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Chat", "quantity": 1}
  ],
  "extension": "Le Chat et l''Astronome",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Mépris cosmique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('mepris cosmique', E'Rapide (Ce sort peut être activé à tout moment.) Exilez 1 sort non-Rituel. Exilez votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/mepris_cosmique.png', 'https://magenoir.com/collection/FR/arcane/Mepris-cosmique.html', 'fr', 'Mépris cosmique'),
('mepris cosmique', E'Quickcast (This spell can be activated at any time.) Exile 1 non-Ritual spell. Exile your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/cosmic_disdain.png', 'https://magenoir.com/collection/EN/arcane/Cosmic-disdain.html', 'en', 'Cosmic disdain')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Millénaire
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Millénaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('millenaire', E'Transmutable : TempsVous ne pouvez pas contrôler ce sort si votre deck contient plus de 4 cartes. Si votre deck contient plus de 4 cartes tandis que Millénaire est en jeu, défaussez-le.Ajoutez 10 à chaque nombre présent dans l''effet de tout sort utilisant ce composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/millenaire.png', 'https://magenoir.com/collection/FR/arcane/Millenaire.html', 'fr', 'Millénaire'),
('millenaire', E'Transmutable : TimeYou cannot control this spell if there are more than 4 cards in your deck.If there are more than 4 cards in your deck while this is in play, discard it right away.Add 10 to every number in the effect of any spell using this as a component.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/millenium.png', 'https://magenoir.com/collection/EN/arcane/Millennium.html', 'en', 'Millennium')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Milliseconde
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('milliseconde', E'Transmutable : Temps Réduisez de 1 chaque nombre présent dans l''effet de tout sort utilisant ce composant (0 si vous êtes Mage Noir).Tout sort utilisant ce sort comme composant gagne : "Rapide" ( Vous pouvez activer ce sort à tout moment )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/milliseconde.png', 'https://magenoir.com/collection/FR/arcane/Milliseconde.html', 'fr', 'Milliseconde'),
('milliseconde', E'Transmutable : TimeReduce every number in the effect of any spell using this as a component by 1 (0 if you''re a Mage Noir). Any spell using this as a component gains: "Quickcast". (This spell can be activated at any time)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/millisecond.png', 'https://magenoir.com/collection/EN/arcane/Millisecond.html', 'en', 'Millisecond')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Montre de Nikola
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Montre de Nikola
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('montre de nikola', E'Lorsque vous piochez une carte, Déphase 1 l''adversaire (Défausse 1 carte du dessous de son deck ).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/montre_de_nikola.png', 'https://magenoir.com/collection/FR/arcane/Montre-de-nikola.html', 'fr', 'Montre de Nikola'),
('montre de nikola', E'Whenever you draw a card, phase out the opponent by 1. (Discard 1 card from the bottom of their deck)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/nikola_s_watch.png', 'https://magenoir.com/collection/EN/arcane/Nikola-s-watch.html', 'en', 'Nikola''s watch')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Paradoxe temporel
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Paradoxe temporel
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('paradoxe temporel', E'Inflige 0 points de dégâts à n''importe quelle cible. Si vous êtes Mage Noir, vous pouvez préparer cette carte depuis votre défausse une fois par tour.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Paradoxe-temporel.png', 'https://magenoir.com/collection/FR/arcane/Paradoxe-temporel.html', 'fr', 'Paradoxe temporel'),
('paradoxe temporel', E'Inflicts 0 damage to any target. If you''re a Mage Noir, you may play this card from your discard pile once per turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Temporal-paradox.png', 'https://magenoir.com/collection/EN/arcane/Temporal-paradox.html', 'en', 'Temporal paradox')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rappel au présent
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rappel au présent
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rappel au present', E'Inflige 1 point de dégâts à n''importe quelle cible pour chaque composant Temps dans votre défausse. Défaussez TOUS les sorts en jeu ne verrouillant aucune Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Rappel-au-present.png', 'https://magenoir.com/collection/FR/arcane/Rappel-au-present.html', 'fr', 'Rappel au présent'),
('rappel au present', E'Inflicts 1 damage to any target for every Time component in your discard pile. Discard EVERY spell in play without Mana locked under it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Callback-to-present.png', 'https://magenoir.com/collection/EN/arcane/Callback-to-present.html', 'en', 'Callback to present')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Récupération temporelle
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Récupération temporelle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('recuperation temporelle', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Eau de moins à préparer. Choisissez jusqu''à 3 composants Temps dans votre défausse et mettez-les en jeu, canalisés comme composants.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Recuperation-temporelle.png', 'https://magenoir.com/collection/FR/arcane/Recuperation-temporelle.html', 'fr', 'Récupération temporelle'),
('recuperation temporelle', E'If you''re a Mage Noir, this spell costs 1 less Water Mana to prepare. Put up to 3 Time components from your discard pile into play channeled as components.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Temporal-salvage.png', 'https://magenoir.com/collection/EN/arcane/Temporal-salvage.html', 'en', 'Temporal salvage')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Réflexion abstruse
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Réflexion abstruse
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('reflexion abstruse', E'Déphase 0 l''adversaire. (Défausse 0 cartes du dessous de son deck )Déphase 0 l''adversaire. (Défausse 0 cartes du dessous de son deck )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/reflexion_abstruse.png', 'https://magenoir.com/collection/FR/arcane/Reflexion-abstruse.html', 'fr', 'Réflexion abstruse'),
('reflexion abstruse', E'Phase out any player by 0. (Discard 0 cards from the bottom of their deck)Phase out any player by 0. (Discard 0 cards from the bottom of their deck)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/abstruse_reflection.png', 'https://magenoir.com/collection/EN/arcane/Abstruse-reflection.html', 'en', 'Abstruse reflection')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Retour à l'origine
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Retour à l'origine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('retour a l origine', E'Le joueur de votre choix renvoie les 10 cartes du dessus de sa défausse dans son deck, puis le mélange. Tant que ce sort est dans votre défausse, si vous êtes Mage Noir, vous pouvez payer 2 Mana Arcane pour renvoyer ce sort dans votre deck, puis mélanger votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/retour_a_l_origine.png', 'https://magenoir.com/collection/FR/arcane/Retour-a-l-origine.html', 'fr', 'Retour à l''origine'),
('retour a l origine', E'Return the top 10 cards of any player''s discard pile to their deck, then they shuffle their deck.While this spell is in your discard pile, if you''re a Mage Noir, you may pay 2 Arcane Mana to return this card to your deck, then shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/return_to_the_origin.png', 'https://magenoir.com/collection/EN/arcane/Return-to-the-origin.html', 'en', 'Return to the origin')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Révocation
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Révocation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('revocation', E'Ne peut être préparé que par un Mage Noir.Rapide (Ce sort peut être activé à tout moment)Défaussez 1 sort en préparation.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/revocation.png', 'https://magenoir.com/collection/FR/arcane/Revocation.html', 'fr', 'Révocation'),
('revocation', E'Can only be prepared by a Mage Noir.Quickcast (This spell can be activated at any time)Discard 1 prepared spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/revocation.png', 'https://magenoir.com/collection/EN/arcane/Revocation.html', 'en', 'Revocation')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rite de passage
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rite de passage
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rite de passage', E'Vous passez Mage Noir.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Rite-de-passage.png', 'https://magenoir.com/collection/FR/arcane/Rite-de-passage.html', 'fr', 'Rite de passage'),
('rite de passage', E'You become a Mage Noir.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Rite-of-passage.png', 'https://magenoir.com/collection/EN/arcane/Rite-of-passage.html', 'en', 'Rite of passage')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rite de Phase
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rite de Phase
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rite de phase', E'Vous passez Mage Noir.Lorsque ce sort arrive en jeu, votre adversaire met sa défausse dans son deck et le mélange.Vos effets de Déphase sont augmentés de 1.Lorsque vous déphasez votre adversaire, infligez-lui 1 point de dégâts.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/rite_de_phase.png', 'https://magenoir.com/collection/FR/arcane/Rite-de-phase.html', 'fr', 'Rite de Phase'),
('rite de phase', E'You become a Mage Noir.When put into play, the opponent puts their discard pile into their deck and shuffles it.Your Phase out effects are increased by 1.When you phase out the opponent, inflict 1 damage to them.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/rite_of_phase.png', 'https://magenoir.com/collection/EN/arcane/Rite-of-phase.html', 'en', 'Rite of phase')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel du pulsar
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du pulsar', 'mage_noir', '{
  "type": "Rituel",
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
  "extension": "Le Chat et l''Astronome",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel du pulsar
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du pulsar', E'Vous êtes Mage Noir tant que vous contrôlez ce Rituel. À la fin de votre tour, piochez 1 carte puis renvoyez ce Rituel au-dessus de votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/rituel_du_pulsar.png', 'https://magenoir.com/collection/FR/arcane/Rituel-du-pulsar.html', 'fr', 'Rituel du pulsar'),
('rituel du pulsar', E'You''re a Mage Noir as long as you control this Ritual. At the end of your turn, draw 1 card and put this Ritual on top of your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/pulsar_ritual.png', 'https://magenoir.com/collection/EN/arcane/Pulsar-ritual.html', 'en', 'Pulsar ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel du savoir
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel du savoir
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du savoir', E'Vous passez Mage Noir. Au début de votre tour, défaussez la carte du dessus de votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Rituel-du-savoir.png', 'https://magenoir.com/collection/FR/arcane/Rituel-du-savoir.html', 'fr', 'Rituel du savoir'),
('rituel du savoir', E'You become a Mage Noir. At the beginning of your turn, discard the top card of your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Knowledge-ritual.png', 'https://magenoir.com/collection/EN/arcane/Knowledge-ritual.html', 'en', 'Knowledge ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Ronces temporelles
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Ronces temporelles
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ronces temporelles', E'Déphase 2 l''adversaire (Défausse 2 cartes du dessous de son deck).S''il est Mage Noir, il peut choisir de perdre 4 Points de Vie à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/ronces_temporelles.png', 'https://magenoir.com/collection/FR/arcane/Ronces-temporelles.html', 'fr', 'Ronces temporelles'),
('ronces temporelles', E'Phase out the opponent by 2. (Discard 2 cards from the bottom of their deck)If they are a Mage Noir, they may choose to lose 4 HP instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/temporal_brambles.png', 'https://magenoir.com/collection/EN/arcane/Temporal-brambles.html', 'en', 'Temporal brambles')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Sagesse ancienne
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sagesse ancienne', 'mage_noir', '{
  "type": "Permanent",
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
  "extension": "Le Chat et l''Astronome",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Sagesse ancienne
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sagesse ancienne', E'Les nombres dans les effets de votre Animal sont augmentés de 0.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/sagesse_ancienne.png', 'https://magenoir.com/collection/FR/arcane/Sagesse-ancienne.html', 'fr', 'Sagesse ancienne'),
('sagesse ancienne', E'Numbers in the effects of your Animal are increased by 0.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/ancient_wisdom.png', 'https://magenoir.com/collection/EN/arcane/Ancient-wisdom.html', 'en', 'Ancient wisdom')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Saut dans le temps
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Saut dans le temps
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('saut dans le temps', E'Déphase 1 n''importe quel joueur. (Défausse 1 carte du dessous de son deck )Ajoutez dans l''Éther Disponible la Mana correspondant au coût des cartes ainsi déphasées (cette Mana provient de l''Éther Infini).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/saut_dans_le_temps.png', 'https://magenoir.com/collection/FR/arcane/Saut-dans-le-temps.html', 'fr', 'Saut dans le temps'),
('saut dans le temps', E'Phase out the opponent by 1.(Discard 1 card from the bottom of their deck)Take the Mana cost of any cards phased out this way from the Infinite Ether and add it to the Available Ether.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/leap_in_time.png', 'https://magenoir.com/collection/EN/arcane/Leap-in-time.html', 'en', 'Leap in time')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Sceptre galactique
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Sceptre galactique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sceptre galactique', E'Au début de votre tour, inflige 1 point de dégâts à n''importe quelle cible. Vous pouvez détruire cet Équipement pour aller chercher 1 Équipement Galactique dans votre deck, le montrer à l''adversaire, le mettre dans votre main et mélanger votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Sceptre-galactique.png', 'https://magenoir.com/collection/FR/arcane/Sceptre-galactique.html', 'fr', 'Sceptre galactique'),
('sceptre galactique', E'At the beginning of your turn, inflicts 1 damage to any target. You may destroy this Equipment from play to take 1 Galactic Equipment card from your deck, show it to the opponent, put it in your hand and shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Galactic-scepter.png', 'https://magenoir.com/collection/EN/arcane/Galactic-scepter.html', 'en', 'Galactic scepter')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Seconde divisée
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Seconde divisée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('seconde divisee', E'Transmutable : Temps (Ce sort est utilisable comme composant Temps.) Soustrayez 1 à chaque chiffre présent dans l''effet de tout sort utilisant ce composant. Si vous êtes Mage Noir, ajoutez 1 à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Seconde-divisee.png', 'https://magenoir.com/collection/FR/arcane/Seconde-divisee.html', 'fr', 'Seconde divisée'),
('seconde divisee', E'Transmutable : Time (This spell can be used as a Time component.) Subtract 1 from every number in the effect of any spell using this as a component. If you''re a Mage Noir, add 1 instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Split-second.png', 'https://magenoir.com/collection/EN/arcane/Split-second.html', 'en', 'Split second')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Siècle
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Siècle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('siecle', E'Transmutable : Temps (Ce sort est utilisable comme composant Temps.) Après que ce sort est utilisé comme composant, défaussez-le. Doublez chaque chiffre présent dans l''effet de tout sort utilisant ce composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Siecle.png', 'https://magenoir.com/collection/FR/arcane/Siecle.html', 'fr', 'Siècle'),
('siecle', E'Transmutable : Time (This spell can be used as a Time component.) After this spell is used as a component, discard it. Double every number in the effect of any spell using this as a component.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Century.png', 'https://magenoir.com/collection/EN/arcane/Century.html', 'en', 'Century')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Supernova
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('supernova', 'mage_noir', '{
  "type": "Sort",
  "element": "Arcane",
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
  "componentCost": [
    {"componentName": "Étoile", "quantity": 1}
  ],
  "extension": "Le Chat et l''Astronome",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Supernova
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('supernova', E'Si le sort sur le dessus de votre défausse est une Étoile, appliquez ses effets. Inflige 3 points de dégâts à TOUS les joueurs.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/supernova.png', 'https://magenoir.com/collection/FR/arcane/Supernova.html', 'fr', 'Supernova'),
('supernova', E'If the top spell of your discard pile is a Star, apply its effects. Inflicts 3 damage to ALL players.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/supernova.png', 'https://magenoir.com/collection/EN/arcane/Supernova.html', 'en', 'Supernova')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Suppression dimensionnelle
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Suppression dimensionnelle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('suppression dimensionnelle', E'Défaussez 1 sort en préparation.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Suppression-dimensionnelle.png', 'https://magenoir.com/collection/FR/arcane/Suppression-dimensionnelle.html', 'fr', 'Suppression dimensionnelle'),
('suppression dimensionnelle', E'Discard 1 prepared spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/dimensional-deletion.png', 'https://magenoir.com/collection/EN/arcane/Dimensional-deletion.html', 'en', 'Dimentional deletion')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Suppression du temps
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('suppression du temps', 'mage_noir', '{
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
  "extension": "Le Chat et l''Astronome",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Suppression du temps
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('suppression du temps', E'Vous pouvez réduire le coût de préparation de ce sort de 1 Mana Arcane, en exilant 1 carte de votre main. Ajoutez 1 à chaque nombre présent dans l''effet de tout sort utilisant ce composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/suppression_du_temps.png', 'https://magenoir.com/collection/FR/arcane/Suppression-du-temps.html', 'fr', 'Suppression du temps'),
('suppression du temps', E'You may reduce this spell''s preparation cost by 1 Arcane Mana by exiling 1 card from your hand. Add 1 to every number in the effect of any spell using this as a component.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/time_deletion.png', 'https://magenoir.com/collection/EN/arcane/Time-deletion.html', 'en', 'Time deletion')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Tardigrade
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tardigrade', 'mage_noir', '{
  "type": "Animal",
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
  "extension": "Le Chat et l''Astronome",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Tardigrade
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('tardigrade', E'Rapide si vous êtes Mage Noir. Choisissez 1 sort contrôlé par l''adversaire. Il reprend ses effets d''origine exactement comme ils sont écrits sur sa carte. Exilez 1 sort de la défausse d''1 joueur.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/tardigrade.png', 'https://magenoir.com/collection/FR/arcane/Tardigrade.html', 'fr', 'Tardigrade'),
('tardigrade', E'Quickcast if you''re a Mage Noir. Choose 1 spell the opponent controls. Reverse its original effects, exactly as written on the card. Exile 1 spell from 1 player''s discard pile.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/tardigrade.png', 'https://magenoir.com/collection/EN/arcane/Tardigrade.html', 'en', 'Tardigrade')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Temps déstructuré
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Temps déstructuré
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('temps destructure', E'Tout sort utilisant ce sort comme composant gagne l''effet :"Déphase 1 l''adversaire (Défausse 1 carte du dessous de son deck )"', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/temps_destructure.png', 'https://magenoir.com/collection/FR/arcane/Temps-destructure.html', 'fr', 'Temps déstructuré'),
('temps destructure', E'Any spell using this as a component gains: "Phase out the opponent by 1". (Discard 1 card from the bottom of their deck)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/unstructured_time.png', 'https://magenoir.com/collection/EN/arcane/Unstructured-time.html', 'en', 'Unstructured time')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vitesse lumière
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('vitesse lumiere', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Galactique", "quantity": 3},
    {"componentName": "Étoile", "quantity": 2}
  ],
  "extension": "Le Chat et l''Astronome",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vitesse lumière
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vitesse lumiere', E'Piochez votre deck. Puis piochez 1 carte pour chaque Vitesse lumière dans votre défausse.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/vitesse_lumiere.png', 'https://magenoir.com/collection/FR/arcane/Vitesse-lumiere.html', 'fr', 'Vitesse lumière'),
('vitesse lumiere', E'Draw your deck. Then, draw 1 card for each Light speed in your discard pile.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/light_speed.png', 'https://magenoir.com/collection/EN/arcane/Light-speed.html', 'en', 'Light speed')
ON CONFLICT (card_id, locale) DO NOTHING;

-- Nombre de cartes pour Arcane: 50

--========================================================================================================================
-- Eau
--========================================================================================================================

--========================================================================================================================
-- Adaptation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('adaptation', 'mage_noir', '{
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
  "extension": "Le Dauphin et le Marin",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Adaptation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('adaptation', E'Les coûts en Mana des capacités de votre Animal peuvent être payés avec de la Mana de n''importe quel élément. Pendant votre phase principale, vous pouvez détruire ce Permanent pour régénérer votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/adaptation.png', 'https://magenoir.com/collection/FR/water/Adaptation.html', 'fr', 'Adaptation'),
('adaptation', E'Mana costs for your Animal''s abilities can be paid with Mana of any element. During your main phase, you may destroy this Permanent to rest your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/adaptation.png', 'https://magenoir.com/collection/EN/water/Adaptation.html', 'en', 'Adaptation')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Anneau d'azur
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Anneau d'azur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('anneau d azur', E'Au début de votre tour, choississez 1 option : - Vous gagnez 1 Point de Vie. - Si vous êtes Mage Noir, vous pouvez placer 1 Mana de votre réserve sous 1 sort que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Anneau-d-azur.png', 'https://magenoir.com/collection/FR/water/Anneau-d-azur.html', 'fr', 'Anneau d''azur'),
('anneau d azur', E'At the beginning of your turn, choose 1 option: - You gain 1 Health Point. - If you''re a Mage Noir, you may put 1 Mana from your Mana reserve under 1 spell you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Azure-ring.png', 'https://magenoir.com/collection/EN/water/Azure-ring.html', 'en', 'Azure ring')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Arbre de glace
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Arbre de glace
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('arbre de glace', E'Au début de votre tour, choisissez 1 Permanent ou Équipement : il n''applique pas ses effets jusqu''au début de votre prochain tour.Puis, Arbre de glace perd 1 PV.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/arbre_de_glace.png', 'https://magenoir.com/collection/FR/water/Arbre-de-glace.html', 'fr', 'Arbre de glace'),
('arbre de glace', E'At the beginning of your turn, choose 1 Permanent or piece of Equipment. It stops applying its effects until the beginning of your next turn.Then, Ice tree loses 1 HP.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ice_tree.png', 'https://magenoir.com/collection/EN/water/Ice-tree.html', 'en', 'Ice tree')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Aura gelée
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('aura gelee', 'mage_noir', '{
  "type": "Permanent",
  "element": "Eau",
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
    {"componentName": "Glace", "quantity": 1}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Aura gelée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('aura gelee', E'Lorsqu''un sort que vous contrôlez devrait libérer de la Mana Eau, vous pouvez la libérer d''Aura Gelée à la place. Détruisez Aura gelée dès qu''elle ne verrouille plus de Mana Eau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/aura_gelee.png', 'https://magenoir.com/collection/FR/water/Aura-gelee.html', 'fr', 'Aura gelée'),
('aura gelee', E'When a spell you control should release Water Mana, you may release it from Frozen aura instead. Destroy Frozen aura as soon as there''s no Water Mana locked under it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/frozen_aura.png', 'https://magenoir.com/collection/EN/water/Frozen-aura.html', 'en', 'Frozen aura')
ON CONFLICT (card_id, locale) DO NOTHING;

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
    {"componentName": "Maelström", "quantity": 1},
    {"componentName": "Glace", "quantity": 1}
  ],
  "extension": "Glace",
  "artwork": "Aurelien Segeat"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Brinicle
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('brinicle', E'À la fin du tour de l''adversaire, Brinicle lui inflige 1 point de dégâts par Mana Eau dans sa réserve de Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/brinicle.png', 'https://magenoir.com/collection/FR/water/Brinicle.html', 'fr', 'Brinicle'),
('brinicle', E'At the end of the opponent''s turn, Brinicle inflicts 1 damage to them for each Water Mana in their Mana reserve.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/brinicle.png', 'https://magenoir.com/collection/EN/water/Brinicle.html', 'en', 'Acceleration')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Condensation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('condensation', E'Tant que ce sort est en préparation, au début de votre tour, mettez 1 Mana Eau de l''Éther Infini sous ce sort. Lorsque vous l''activez, répartissez la Mana verrouillée sous Condensation entre votre réserve de Mana et vos sorts.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Condensation.png', 'https://magenoir.com/collection/FR/water/Condensation.html', 'fr', 'Condensation'),
('condensation', E'While in preparation: At the start of your turn, lock 1 Water Mana from the Infinite Ether under this spell. When activated, distribute the Mana locked under this spell between your Mana reserve and your spells.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Condensation.png', 'https://magenoir.com/collection/EN/water/Condensation.html', 'en', 'Condensation')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Conduit marin
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('conduit marin', 'mage_noir', '{
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
  "extension": "Le Dauphin et le Marin",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Conduit marin
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('conduit marin', E'Payez X Mana pour que l''adversaire paye X Mana de son choix. Au début de votre tour, activez ce sort.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/conduit_marin.png', 'https://magenoir.com/collection/FR/water/Conduit-marin.html', 'fr', 'Conduit marin'),
('conduit marin', E'Pay X Mana to have the opponent pay X Mana of their choice. At the start of your turn, activate this spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/marine_conduit.png', 'https://magenoir.com/collection/EN/water/Marine-conduit.html', 'en', 'Marine conduit')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Dauphin
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('dauphin', 'mage_noir', '{
  "type": "Animal",
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
  "extension": "Le Dauphin et le Marin",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Dauphin
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('dauphin', E'Regardez X cartes du dessus de votre deck, où X est votre nombre de composants Eau. Mettez-en 1 au dessus de votre deck, le reste en dessous. Déplacez 1 Mana Eau d''un sort que vous contrôlez sous un autre.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/dauphin.png', 'https://magenoir.com/collection/FR/water/Dauphin.html', 'fr', 'Dauphin'),
('dauphin', E'Look at the top X cards of your deck, where X is the amount of Water components you control. Put 1 card on top of it, and the rest at the bottom. Put 1 Water Mana locked under a spell you control under another.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/dolphin.png', 'https://magenoir.com/collection/EN/water/Dolphin.html', 'en', 'Dolphin')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Déferlement tourbillonnant
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('deferlement tourbillonnant', 'mage_noir', '{
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
    {"componentName": "Marée", "quantity": 1}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Déferlement tourbillonnant
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('deferlement tourbillonnant', E'Inflige 6 points de dégâts à n''importe quelle cible. Vous ne pouvez activer ce sort que s''il verrouille au moins 6 Mana (ou 5 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/deferlement_tourbillonnant.png', 'https://magenoir.com/collection/FR/water/Deferlement-tourbillonnant.html', 'fr', 'Déferlement tourbillonnant'),
('deferlement tourbillonnant', E'Inflicts 6 damage to any target. You may only activate this spell if it locks at least 6 Mana (or 5 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/swirling_surge.png', 'https://magenoir.com/collection/EN/water/Swirling-surge.html', 'en', 'Swirling surge')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Écharde de glace
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Écharde de glace
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('echarde de glace', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Inflige 2 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/echarde_de_glace.png', 'https://magenoir.com/collection/FR/water/Echarde-de-glace.html', 'fr', 'Écharde de glace'),
('echarde de glace', E'Slowcast (This spell can''t be activated on the turn it was prepared) Inflicts 2 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ice_shard.png', 'https://magenoir.com/collection/EN/water/Ice-shard.html', 'en', 'Ice shard')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Engloutissement
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('engloutissement', E'Détruisez 1 Permanent ou 1 Équipement.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Engloutissement.png', 'https://magenoir.com/collection/FR/water/Engloutissement.html', 'fr', 'Engloutissement'),
('engloutissement', E'Destroy 1 Permanent or 1 piece of Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Engulfment.png', 'https://magenoir.com/collection/EN/water/Engulfment.html', 'en', 'Engulfment')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Ère glaciaire
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
    {"componentName": "Glace", "quantity": 2},
    {"componentName": "Temps", "quantity": 1}
  ],
  "extension": "Glace",
  "artwork": "Geoffrey Amesse"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Ère glaciaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ere glaciaire', E'Ne peut être préparé que par un Mage Noir.Vous pouvez préparer ce sort sans le composant Temps requis.Les effets de dégâts de vos sorts Eau sont augmentés de 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/ere_glaciaire.png', 'https://magenoir.com/collection/FR/water/Ere-glaciaire.html', 'fr', 'Ère glaciaire'),
('ere glaciaire', E'Can only be prepared by a Mage Noir.You may prepare this spell without the required Time component.Damage from Water spells you control is increased by 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/glacial_age.png', 'https://magenoir.com/collection/EN/water/Glacial-age.html', 'en', 'Glacial age')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flèche mordante
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flèche mordante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleche mordante', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Inflige 1 point de dégâts à n''importe quelle cible.Lorsque ce sort doit aller depuis le plateau vers la défausse, vous pouvez payer 1 Mana Eau pour le renvoyer dans votre main à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/fleche_mordante.png', 'https://magenoir.com/collection/FR/water/Fleche-mordante.html', 'fr', 'Flèche mordante'),
('fleche mordante', E'Slowcast (This spell can''t be activated on the turn it was prepared) Inflicts 1 damage to any target.If this spell would be discarded from play, you may pay 1 Water Mana to return it to your hand instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/biting_arrow.png', 'https://magenoir.com/collection/EN/water/Biting-arrow.html', 'en', 'Biting arrow')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flocon de neige
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flocon de neige
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('flocon de neige', E'Transmutable : Glace, GoutteMettez 1 Mana Eau verrouillée par ce sort sous un autre sort que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/flocon_de_neige_1.png', 'https://magenoir.com/collection/FR/water/Flocon-de-neige.html', 'fr', 'Flocon de neige'),
('flocon de neige', E'Transmutable : Ice, DropPut 1 Water Mana locked under this spell under another spell you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/snowflake_1.png', 'https://magenoir.com/collection/EN/water/Snowflake.html', 'en', 'Snowflake')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Goutte d'eau
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Goutte d'eau
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('goutte d eau', E'Tant que ce sort est canalisé comme composant, une fois par tour, peut être considéré par un autre sort comme étant 2 composants Goutte. Si vous êtes Mage Noir, compte toujours comme 2 composants Goutte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Goutte-d-eau.png', 'https://magenoir.com/collection/FR/water/Goutte-d-eau.html', 'fr', 'Goutte d''eau'),
('goutte d eau', E'When channeled, once per turn, may be counted by another spell as 2 Drop components. If you''re a Mage Noir, it is always counted as 2 Drop components.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Water-drop.png', 'https://magenoir.com/collection/EN/water/Water-drop.html', 'en', 'Water drop')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Goutte de rosée
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('goutte de rosee', 'mage_noir', '{
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
  "extension": "Le Dauphin et le Marin",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Goutte de rosée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('goutte de rosee', E'Si ce sort est le premier sort préparé ce tour-ci, lorsqu''il arrive en jeu, gagnez 1 Point de Vie et libérez la Mana Eau de ce sort.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/goutte_de_rosee.png', 'https://magenoir.com/collection/FR/water/Goutte-de-rosee.html', 'fr', 'Goutte de rosée'),
('goutte de rosee', E'If this is the first spell prepared this turn, when it comes into play, gain 1 Health Point and release this spell''s Water Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/dew_drop.png', 'https://magenoir.com/collection/EN/water/Dew-drop.html', 'en', 'Dew drop')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Gouttelette
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('gouttelette', E'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Gouttelette.png', 'https://magenoir.com/collection/FR/water/Gouttelette.html', 'fr', 'Gouttelette'),
('gouttelette', E'Transmutable : Drop (This spell can be used as a Drop component.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Droplet.png', 'https://magenoir.com/collection/EN/water/Droplet.html', 'en', 'Droplet')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Grandes eaux
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Grandes eaux
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('grandes eaux', E'Inflige 1 point de dégâts à n''importe quelle cible par composant Eau actuellement sur le plateau (Permanents et Équipements exclus).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Grandes-eaux.png', 'https://magenoir.com/collection/FR/water/Grandes-eaux.html', 'fr', 'Grandes eaux'),
('grandes eaux', E'Inflicts 1 damage to any target for each Water component in play (Permanents and Equipment excluded).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Great-waters.png', 'https://magenoir.com/collection/EN/water/Great-waters.html', 'en', 'Great waters')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Haute pression
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Haute pression
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('haute pression', E'Inflige X points de dégâts à n''importe quelle cible. X est égal au nombre de Mana verrouillées sous un composant Condensation que vous contrôlez. Ce composant Condensation retourne dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Haute-pression.png', 'https://magenoir.com/collection/FR/water/Haute-pression.html', 'fr', 'Haute pression'),
('haute pression', E'Inflicts X damage to any target, where X is the amount of Mana locked under a Condensation component you control. Return that component to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/High-pressure.png', 'https://magenoir.com/collection/EN/water/High-pressure.html', 'en', 'High pressure')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Hermine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('hermine', 'mage_noir', '{
  "type": "Animal",
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
  "extension": "Le Dauphin et le Marin",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Hermine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('hermine', E'Ce tour-ci, l''élément d''un sort que vous contrôlez est l''élément de la Mana que vous avez utilisé pour payer cette capacité. Faites 1 échange de Mana à 1 pour 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/hermine.png', 'https://magenoir.com/collection/FR/water/Hermine.html', 'fr', 'Hermine'),
('hermine', E'For this turn only, change the element of one spell you control to the Element of the Mana paid for this ability. Make 1 Mana trade at a rate of 1 for 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ermine.png', 'https://magenoir.com/collection/EN/water/Ermine.html', 'en', 'Ermine')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Hiver perçant
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Hiver perçant
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('hiver percant', E'Pour chaque carte que votre adversaire pioche, cet Équipement lui inflige 1 point de dégâts.Au début de votre tour, Hiver perçant libère 1 Mana Eau.Détruisez cet Équipement dès qu''il ne verrouille plus de Mana Eau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/hiver_percant.png', 'https://magenoir.com/collection/FR/water/Hiver-percant.html', 'fr', 'Hiver perçant'),
('hiver percant', E'Inflicts 1 damage to the opponent every time they draw a card.At the beginning of your turn, releases 1 Water Mana.Discard Piercing winter as soon as there''s no Water Mana locked under it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/piercing_winter.png', 'https://magenoir.com/collection/EN/water/Piercing-winter.html', 'en', 'Piercing winter')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Infiltration glaciale
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Infiltration glaciale
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('infiltration glaciale', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Ce tour-ci, les dégâts des sorts Eau que vous contrôlez sont réduits de 1.Ces dégâts ne peuvent pas être ignorés, réduits, ni redirigés ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/infiltration_glaciale.png', 'https://magenoir.com/collection/FR/water/Infiltration-glaciale.html', 'fr', 'Infiltration glaciale'),
('infiltration glaciale', E'Slowcast (This spell can''t be activated on the turn it was prepared) This turn, damage from Water spells you control is reduced by 1.This damage can''t be ignored, reduced or redirected this turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/icy_infiltration.png', 'https://magenoir.com/collection/EN/water/Icy-infiltration.html', 'en', 'Icy infiltration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Infiltration marine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('infiltration marine', 'mage_noir', '{
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
    {"componentName": "Marée", "quantity": 1}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Infiltration marine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('infiltration marine', E'Choisissez 2 options : - Inflige 2 points de dégâts à n''importe quelle cible. - La cible de votre choix gagne 2 PV. - Si vous êtes Mage Noir, 1 Marée canalisée est remise en préparation.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/infiltration_marine.png', 'https://magenoir.com/collection/FR/water/Infiltration-marine.html', 'fr', 'Infiltration marine'),
('infiltration marine', E'Choose 2: - Inflicts 2 damage to any target. - Any target gains 2 Health Points. - If you''re a Mage Noir, put 1 channeled Tide back in preparation.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/marine_infiltration.png', 'https://magenoir.com/collection/EN/water/Marine-infiltration.html', 'en', 'Marine infiltration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Infiltration-subtile
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Infiltration-subtile
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('infiltration subtile', E'A chaque fois que vous échangez de la Mana Eau avec l''Ether Disponible, inflige 1 point de dégâts à l''adversaire, puis libère 1 Mana verrouillée par ce sort. Dès qu''il ne verrouille plus de Mana, détruisez ce sort, puis vous pouvez prendre jusqu''à 2 Mana Eau dans l''Ether disponible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Infiltration-subtile.png', 'https://magenoir.com/collection/FR/water/Infiltration-subtile.html', 'fr', 'Infiltration-subtile'),
('infiltration subtile', E'Every time you trade Water Mana with the Available Ether, inflict 1 damage to the opponent and release 1 Mana locked under this spell. Discard this Permanent as soon as there''s no Mana locked under it, then you may take up to 2 Water Mana from the Available Ether.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Subtle-infiltration.png', 'https://magenoir.com/collection/EN/water/Subtle-infiltration.html', 'en', 'Subtle infiltration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- La guérisseuse de l'eau
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour La guérisseuse de l'eau
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('la guerisseuse de l eau', E'La cible de votre choix gagne 3 Points de Vie. Reprenez 1 sort de votre défausse dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/La-guerisseuse-de-l-eau.png', 'https://magenoir.com/collection/FR/water/La-guerisseuse-de-l-eau.html', 'fr', 'La guérisseuse de l''eau'),
('la guerisseuse de l eau', E'Any target gains 3 Health Points. Return 1 spell from your discard pile to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/The-water-healer.png', 'https://magenoir.com/collection/EN/water/The-water-healer.html', 'en', 'The water healer')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lame de fond
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lame de fond', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Vague", "quantity": 1}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lame de fond
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lame de fond', E'Lent (Ce sort ne peut pas être activé le tour où il a été préparé.) Inflige 4 points de dégâts à l''adversaire s''il a de la Mana Eau dans sa réserve.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/lame_de_fond.png', 'https://magenoir.com/collection/FR/water/Lame-de-fond.html', 'fr', 'Lame de fond'),
('lame de fond', E'Slowcast (This spell can''t be activated on the turn it was prepared.) Inflicts 4 damage to the opponent if they have Water Mana in their reserve.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/depth_blade.png', 'https://magenoir.com/collection/EN/water/Depth-blade.html', 'en', 'Depth blade')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lances de l'hiver
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lances de l'hiver
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lances de l hiver', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Ne peut jamais être Lent tant que vous êtes Mage Noir.Ce sort libère 2 Mana Eau.Inflige 3 points de dégâts à n''importe quelle cible (ou 5 si ce sort verrouille au moins 1 Mana Eau).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/lances_de_l_hiver.png', 'https://magenoir.com/collection/FR/water/Lances-de-l-hiver.html', 'fr', 'Lances de l''hiver'),
('lances de l hiver', E'Slowcast (This spell can''t be activated on the turn it was prepared) This spell can never have Slowcast as long as you''re a Mage Noir.Releases 2 Water Mana.Inflicts 3 damage to any target (or 5 if this spell locks at least 1 Water Mana).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/winter_spears.png', 'https://magenoir.com/collection/EN/water/Winter-spears.html', 'en', 'Winter spears')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Maelström
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Maelström
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('maelstrom', E'À la fin de leur tour, les joueurs mettent la Mana de leur réserve de Mana dans l''Ether Disponible. Au début de votre tour, détruisez Maelström.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Maelstrom.png', 'https://magenoir.com/collection/FR/water/Maelstrom.html', 'fr', 'Maelström'),
('maelstrom', E'At the end of their turns, players put all the Mana from their Mana reserve into the Available Ether. At the beginning of your turn, destroy Maelström.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Maelstrom.png', 'https://magenoir.com/collection/EN/water/Maelstrom.html', 'en', 'Maelström')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Marée
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Marée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('maree', E'Piochez 1 carte, puis défaussez-vous d''1 carte en main. Mettez la Mana verrouillée par ce sort sous un autre sort que vous contrôlez. Puis vous pouvez payer 1 Mana Eau pour aller chercher 1 carte Marée dans votre défausse, et la mettre dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Maree.png', 'https://magenoir.com/collection/FR/water/Maree.html', 'fr', 'Marée'),
('maree', E'Draw 1 card, then discard 1 card from hand. Put the Mana locked under this spell under another spell you control. Then you may pay 1 Water Mana to return 1 Tide spell from your discard pile to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Tide.png', 'https://magenoir.com/collection/EN/water/Tide.html', 'en', 'Tide')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Marée fractale
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('maree fractale', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
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
  "componentCost": [
    {"componentName": "Goutte", "quantity": 2}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Marée fractale
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('maree fractale', E'Inflige 2 points de dégâts à l''adversaire. Si vous êtes Mage Noir, choisissez 1 Marée dans votre défausse et mettez-la dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/maree_fractale.png', 'https://magenoir.com/collection/FR/water/Maree-fractale.html', 'fr', 'Marée fractale'),
('maree fractale', E'Inflicts 2 damage to the opponent. If you''re a Mage Noir, return 1 Tide spell from your discard pile to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/fractal_tide.png', 'https://magenoir.com/collection/EN/water/Fractal-tide.html', 'en', 'Fractal tide')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Météore de cristal
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Météore de cristal
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('meteore de cristal', E'Inflige 2 points de dégâts à n''importe quelle cible.Les dégâts infligés sont augmentés de 1 par composant Glace que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/meteore_de_cristal.png', 'https://magenoir.com/collection/FR/water/Meteore-de-cristal.html', 'fr', 'Météore de cristal'),
('meteore de cristal', E'Inflicts 2 damage to any target.This damage is increased by 1 for each Ice component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/crystal_meteor.png', 'https://magenoir.com/collection/EN/water/Crystal-meteor.html', 'en', 'Crystal meteor')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Mur de glace
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Mur de glace
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('mur de glace', E'Ce Permanent a Protecteur tant qu''il verrouille de la Mana Eau.Au début de votre tour, libère 1 Mana Eau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/mur_de_glace.png', 'https://magenoir.com/collection/FR/water/Mur-de-glace.html', 'fr', 'Mur de glace'),
('mur de glace', E'As long as it locks Water Mana, this Permanent has Protector.At the beginning of your turn, releases 1 Water Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ice_wall.png', 'https://magenoir.com/collection/EN/water/Ice-wall.html', 'en', 'Ice wall')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Océan déchaîné
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Océan déchaîné
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ocean dechaine', E'Au début de votre tour, vos composants Vague appliquent leurs effets. Puis, ce sort libère 1 Mana Eau pour chaque composant Vague que vous contrôlez. Détruisez ce sort dès qu''il ne verrouille plus de Mana Eau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Ocean-dechaine.png', 'https://magenoir.com/collection/FR/water/Ocean-dechaine.html', 'fr', 'Océan déchaîné'),
('ocean dechaine', E'At the beginning of your turn, your Wave components apply their effects. Then, this spell releases 1 Water Mana for each Wave component you control. Discard this Permanent as soon as there''s no Water Mana locked under it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Unleashed-ocean.png', 'https://magenoir.com/collection/EN/water/Unleashed-ocean.html', 'en', 'Unleashed ocean')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Pression écrasante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('pression ecrasante', 'mage_noir', '{
  "type": "Permanent",
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
    {"componentName": "Source", "quantity": 1}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Pression écrasante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('pression ecrasante', E'Lorsqu''un sort Eau entre en jeu, inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/pression_ecrasante.png', 'https://magenoir.com/collection/FR/water/Pression-ecrasante.html', 'fr', 'Pression écrasante'),
('pression ecrasante', E'Whenever a Water spell comes into play, inflicts 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/crushing_pressure.png', 'https://magenoir.com/collection/EN/water/Crushing-pressure.html', 'en', 'Crushing pressure')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Pulvérisation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('pulverisation', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Goutte", "quantity": 3}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Pulvérisation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('pulverisation', E'Si vous êtes Mage Noir, vous pouvez préparer ce sort sans les composants requis. Détruisez 1 Permanent sans PV, ou 1 Équipement. La Mana verrouillée sous le sort détruit va dans la réserve de son propriétaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/pulverisation.png', 'https://magenoir.com/collection/FR/water/Pulverisation.html', 'fr', 'Pulvérisation'),
('pulverisation', E'If you''re a Mage Noir, you may prepare this spell without the required components. Destroy 1 Permanent without HP or 1 piece of Equipment. The Mana locked under the destroyed spell goes to its owner''s Mana reserve.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/pulverization.png', 'https://magenoir.com/collection/EN/water/Pulverization.html', 'en', 'Pulverization')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Réserves d'hiver
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('reserves d hiver', 'mage_noir', '{
  "type": "Permanent",
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
  "componentCost": [
    {"componentName": "Hermine", "quantity": 1}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Réserves d'hiver
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('reserves d hiver', E'Lorsque ce Permanent arrive en jeu sous votre contrôle, exilez votre Animal. Durant votre tour, les deux piles de Mana de l''Éther Disponible sont toujours considérées comme de tailles égales.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/reserves_d_hiver.png', 'https://magenoir.com/collection/FR/water/Reserves-d-hiver.html', 'fr', 'Réserves d''hiver'),
('reserves d hiver', E'When put into play under your control, exile your Animal. During your turn, both Mana piles in the Available Ether are considered to have the same amount of Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/winter_stocks.png', 'https://magenoir.com/collection/EN/water/Winter-stocks.html', 'en', 'Winter stocks')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel des reflets
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel des reflets', 'mage_noir', '{
  "type": "Rituel",
  "element": "Eau",
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
  "extension": "Le Dauphin et le Marin",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel des reflets
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel des reflets', E'Vous passez Mage Noir. Tant que vous contrôlez au moins 1 sort en préparation, vous ne pouvez pas préparer de sort. Vous pouvez exiler 1 sort en préparation que vous contrôlez, pour appliquer les effets d''un sort Eau sur le plateau avec qui il partage un nom de composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/rituel_des_reflets.png', 'https://magenoir.com/collection/FR/water/Rituel-des-reflets.html', 'fr', 'Rituel des reflets'),
('rituel des reflets', E'You become a Mage Noir. As long as you control at least 1 prepared spell, you cannot prepare spells. You may exile 1 prepared spell you control to apply the effects of a Water spell in play that shares a component name with it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ritual_of_reflections.png', 'https://magenoir.com/collection/EN/water/Ritual-of-reflections.html', 'en', 'Ritual of reflections')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel du Mélange
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel du Mélange
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du melange', E'Vous passez Mage Noir. Lorsque vous ajoutez de la Mana à l''Éther disponible durant votre phase de récupération de Mana, ajoutez 1 Mana de moins. Durant votre phase principale, vous pouvez échanger la Mana verrouillée sous vos sorts Eau et celle de votre réserve de Mana à 1 pour 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Rituel-du-melange.png', 'https://magenoir.com/collection/FR/water/Rituel-du-melange.html', 'fr', 'Rituel du Mélange'),
('rituel du melange', E'You become a Mage Noir. When you add Mana to the Available Ether during your Mana gathering phase, add 1 less Mana. During your main phase, you may trade Mana between your Mana reserve and your Water spells at a rate of 1 for 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Ritual-of-melange.png', 'https://magenoir.com/collection/EN/water/Ritual-of-melange.html', 'en', 'Ritual of Mélange')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel du zéro absolu
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel du zéro absolu
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du zero absolu', E'Vous passez Mage Noir.TOUS les sorts gagnent : "Lent" (Ces sort ne peuvent pas être activés le tour durant lequel ils ont été préparés ).TOUS les sorts peuvent être préparés pour 1 Mana Eau supplémentaire afin qu''ils n''aient pas Lent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/rituel_du_zero_absolu.png', 'https://magenoir.com/collection/FR/water/Rituel-du-zero-absolu.html', 'fr', 'Rituel du zéro absolu'),
('rituel du zero absolu', E'You become a Mage Noir.ALL spells gain: "Slowcast". (You cannot activate these spells on the same turn they were prepared)ALL spells can be prepared for 1 additional Water Mana so that they don''t have Slowcast.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ritual_of_absolute_zero.png', 'https://magenoir.com/collection/EN/water/Ritual-of-absolute-zero.html', 'en', 'Ritual of absolute zero')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Robe de Yuki-Onna
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Robe de Yuki-Onna
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('robe de yuki onna', E'Pour chaque carte que votre adversaire pioche, il paye 1 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/robe_de_yuki_onna.png', 'https://magenoir.com/collection/FR/water/Robe-de-yuki-onna.html', 'fr', 'Robe de Yuki-Onna'),
('robe de yuki onna', E'Each time the opponent draws a card, they pay 1 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/yuki_onna_s_robe.png', 'https://magenoir.com/collection/EN/water/Yuki-onna-s-robe.html', 'en', 'Yuki-Onna''s robe')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Sonar
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sonar', 'mage_noir', '{
  "type": "Sort",
  "element": "Eau",
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
  "componentCost": [
    {"componentName": "Dauphin", "quantity": 1},
    {"componentName": "Goutte", "quantity": 3}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Sonar
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sonar', E'Lent, sauf si vous êtes Mage Noir. Allez chercher 2 cartes dans votre deck et mettez-les dans votre main. Mélangez votre deck. Exilez votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/sonar.png', 'https://magenoir.com/collection/FR/water/Sonar.html', 'fr', 'Sonar'),
('sonar', E'Slowcast, unless you''re a Mage Noir. Search your deck for 2 cards and put them into your hand. Shuffle your deck. Exile your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/sonar.png', 'https://magenoir.com/collection/EN/water/Sonar.html', 'en', 'Sonar')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Souffle brume
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Souffle brume
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('souffle brume', E'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.) Renvoyez 3 cartes de votre défausse dans votre deck, puis mélangez votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Souffle-brume.png', 'https://magenoir.com/collection/FR/water/Souffle-brume.html', 'fr', 'Souffle brume'),
('souffle brume', E'Transmutable : Drop (This spell can be used as a Drop component.) Return 3 cards from your discard pile to your deck, then shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Mist-breath.png', 'https://magenoir.com/collection/EN/water/Mist-breath.html', 'en', 'Mist breath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Souffle de glace
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Souffle de glace
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('souffle de glace', E'Jusqu''au début de votre prochain tour, les sorts du joueur ciblé coûtent 1 Mana Eau supplémentaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/souffle_de_glace.png', 'https://magenoir.com/collection/FR/water/Souffle-de-glace.html', 'fr', 'Souffle de glace'),
('souffle de glace', E'Until the beginning of your next turn, target player''s spells cost 1 more Water Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ice_breath.png', 'https://magenoir.com/collection/EN/water/Ice-breath.html', 'en', 'Ice breath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Source marine
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('source marine', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Goutte", "quantity": 2}
  ],
  "extension": "Le Dauphin et le Marin",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Source marine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('source marine', E'Mettez X Mana Eau de l''Éther Infini sous un sort, où X est le nombre de composants Gouttes que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/source_marine.png', 'https://magenoir.com/collection/FR/water/Source-marine.html', 'fr', 'Source marine'),
('source marine', E'Put X Water Mana from the Infinite Ether under a spell, where X is the amount of Drop components you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/marine_source.png', 'https://magenoir.com/collection/EN/water/Marine-source.html', 'en', 'Marine source')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Source prodigieuse
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Source prodigieuse
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('source prodigieuse', E'Vos composants Eau sont comptés 1 fois de plus (Permanents exclus).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Source-prodigieuse.png', 'https://magenoir.com/collection/FR/water/Source-prodigieuse.html', 'fr', 'Source prodigieuse'),
('source prodigieuse', E'Each of your Water components counts as 1 additional instance of that component (Permanents excluded).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Prodigious-source.png', 'https://magenoir.com/collection/EN/water/Prodigious-source.html', 'en', 'Prodigious source')
ON CONFLICT (card_id, locale) DO NOTHING;

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
    {"componentName": "Océan", "quantity": 1},
    {"componentName": "Séisme", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Camille Fourcade"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Tsunami
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('tsunami', E'Détruisez tous les Permanents de l''adversaire.Inflige 8 points de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Tsunami.png', 'https://magenoir.com/collection/FR/water/Tsunami.html', 'fr', 'Tsunami'),
('tsunami', E'Destroy all of the opponent''s PermanentsInflicts 8 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Tsunami.png', 'https://magenoir.com/collection/EN/water/Tsunami.html', 'en', 'Tsunami')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vague déferlante
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vague déferlante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vague deferlante', E'Inflige 3 points de dégâts à n''importe quelle cible (ou 4 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Vague-deferlante.png', 'https://magenoir.com/collection/FR/water/Vague-deferlante.html', 'fr', 'Vague déferlante'),
('vague deferlante', E'Inflicts 3 damage to any target (or 4 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Surging-wave.png', 'https://magenoir.com/collection/EN/water/Surging-wave.html', 'en', 'Surging wave')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vague écho
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vague écho
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vague echo', E'Applique les effets d''1 composant Vague que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Vague-echo.png', 'https://magenoir.com/collection/FR/water/Vague-echo.html', 'fr', 'Vague écho'),
('vague echo', E'Apply the effects of 1 Wave component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Wave-echo.png', 'https://magenoir.com/collection/EN/water/Wave-echo.html', 'en', 'Wave echo')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vague mordante
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vague mordante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vague mordante', E'Inflige 2 points de dégâts à n''importe quelle cible.Si vous êtes Mage Noir, verrouillez la Mana Eau de ce sort sous un autre sort que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/vague_mordante.png', 'https://magenoir.com/collection/FR/water/Vague-mordante.html', 'fr', 'Vague mordante'),
('vague mordante', E'Inflicts 2 damage to any target.If you''re a Mage Noir, put the Mana locked under this spell under another spell you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/biting_wave.png', 'https://magenoir.com/collection/EN/water/Biting-wave.html', 'en', 'Biting wave')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vague purificatrice
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vague purificatrice
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vague purificatrice', E'La cible de votre choix gagne 2 Points de Vie (ou 3 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Vague-purificatrice.png', 'https://magenoir.com/collection/FR/water/Vague-purificatrice.html', 'fr', 'Vague purificatrice'),
('vague purificatrice', E'Any target gains 2 Health Points (or 3 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Purifying-wave.png', 'https://magenoir.com/collection/EN/water/Purifying-wave.html', 'en', 'Purifying wave')
ON CONFLICT (card_id, locale) DO NOTHING;

-- Nombre de cartes pour Eau: 50

--========================================================================================================================
-- Feu
--========================================================================================================================

--========================================================================================================================
-- Âme flamboyante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ame flamboyante', 'mage_noir', '{
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
    {"componentName": "Flamme", "quantity": 2}
  ],
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Âme flamboyante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ame flamboyante', E'Activez une capacité de votre Animal sans payer ses coûts, même si celui-ci est épuisé. Si vous êtes Mage Noir, inflige 3 points de dégâts à l''adversaire. Exilez votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/ame_flamboyante.png', 'https://magenoir.com/collection/FR/fire/Ame-flamboyante.html', 'fr', 'Âme flamboyante'),
('ame flamboyante', E'Activate one of your Animal''s abilities without paying its costs, even if it is exhausted. If you''re a Mage Noir, inflicts 3 damage to the opponent. Exile your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/blazing_soul.png', 'https://magenoir.com/collection/EN/fire/Blazing-soul.html', 'en', 'Blazing soul')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Anneau pourpre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Anneau pourpre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('anneau pourpre', E'Lorsque vous perdez des Points de Vie ou que des dégâts vous sont infligés, vous pouvez payer 1 Mana Feu pour infliger 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Anneau-pourpre.png', 'https://magenoir.com/collection/FR/fire/Anneau-pourpre.html', 'fr', 'Anneau pourpre'),
('anneau pourpre', E'Whenever you lose Health Points or damage is inflicted to you, you may pay 1 Fire Mana to inflict 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Crimson-ring.png', 'https://magenoir.com/collection/EN/fire/Crimson-ring.html', 'en', 'Crimson ring')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Aube
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('aube', E'Tant que ce sort est en préparation, si un Soleil que vous contrôlez devait être détruit, défaussez ce sort à la place.Lorsque vous activez Aube, si vous êtes Mage Noir, piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/aube.png', 'https://magenoir.com/collection/FR/fire/Aube.html', 'fr', 'Aube'),
('aube', E'While in preparation, if a Sun you control would be destroyed, discard this spell instead.When activated, if you''re a Mage Noir, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/dawn.png', 'https://magenoir.com/collection/EN/fire/Dawn.html', 'en', 'Dawn')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Boule de feu
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Boule de feu
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('boule de feu', E'Vous pouvez défausser 1 carte Feu depuis votre main pour préparer ce sort sans le composant Flamme requis. Inflige 2 points de dégâts à tous les permanents de l''adversaire. Puis inflige 2 points de dégâts à l''adversaire (ou 3 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Boule-de-feu.png', 'https://magenoir.com/collection/FR/fire/Boule-de-feu.html', 'fr', 'Boule de feu'),
('boule de feu', E'You may discard 1 Fire card from your hand to prepare this spell without the required Flame component. Inflicts 2 damage to every Permanent your opponent controls. Then, inflicts 2 damage to the opponent (or 3 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fire-ball.png', 'https://magenoir.com/collection/EN/fire/Fire-ball.html', 'en', 'Fire ball')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Brulûre solaire
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Brulûre solaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('brulure solaire', E'Inflige 3 points de dégâts à n''importe quelle cible.Zénith: Défaussez 1 composant que vous contrôlez. Puis infligez 1 point de dégâts à l''adversaire. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/brulure_solaire.png', 'https://magenoir.com/collection/FR/fire/Brulure-solaire.html', 'fr', 'Brulûre solaire'),
('brulure solaire', E'Inflicts 3 damage to any target.Zenith: Discard 1 component you control. Then, inflict 1 damage to the opponent.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_burn.png', 'https://magenoir.com/collection/EN/fire/Solar-burn.html', 'en', 'Solar burn')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Calcination
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('calcination', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [],
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Calcination
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('calcination', E'Rapide si vous êtes Mage Noir. Défaussez 1 carte de votre main pour détruire 1 Équipement.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/calcination.png', 'https://magenoir.com/collection/FR/fire/Calcination.html', 'fr', 'Calcination'),
('calcination', E'Quickcast if you''re a Mage Noir. Discard 1 card from hand to destroy 1 piece of Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/calcination.png', 'https://magenoir.com/collection/EN/fire/Calcination.html', 'en', 'Calcination')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Catalyseur de soleil
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Catalyseur de soleil
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('catalyseur de soleil', E'Unique Zénith : Vos sorts Solaires coûtent 1 Mana Feu de moins à préparer. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/catalyseur_de_soleil.png', 'https://magenoir.com/collection/FR/fire/Catalyseur-de-soleil.html', 'fr', 'Catalyseur de soleil'),
('catalyseur de soleil', E'UniqueZenith: Your Solar spells cost 1 less Fire Mana to prepare. (Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/sun_catalyst.png', 'https://magenoir.com/collection/EN/fire/Sun-catalyst.html', 'en', 'Sun catalyst')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Éblouissement
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Éblouissement
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('eblouissement', E'Si vous êtes Mage Noir, vous pouvez préparer ce sort sans le composant Lumière requis.Rapide (Vous pouvez activer ce sort à tout moment )Renvoyez 1 sort en préparation dans la main de son propriétaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/eblouissement.png', 'https://magenoir.com/collection/FR/fire/Eblouissement.html', 'fr', 'Éblouissement'),
('eblouissement', E'If you''re a Mage Noir, you may prepare this spell without the required Light component.Quickcast (This spell can be activated at any time)Return 1 prepared spell to its owner''s hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/dazzle.png', 'https://magenoir.com/collection/EN/fire/Dazzle.html', 'en', 'Dazzle')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Éruption de magma
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Éruption de magma
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('eruption de magma', E'Inflige 7 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Magma-eruption.png', 'https://magenoir.com/collection/FR/fire/Eruption-de-magma.html', 'fr', 'Éruption de magma'),
('eruption de magma', E'Inflicts 7 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Magma-eruption.png', 'https://magenoir.com/collection/EN/fire/Magma-eruption.html', 'en', 'Magma eruption')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Éruption solaire
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Éruption solaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('eruption solaire', E'Ce tour-ci, préparer les sorts suivants coûte 2 Mana de moins de l''élément du sort : Tornade, Engloutissement, Séisme, Mons Igneus, Maelström, Explosion.Quand vous préparez l''un de ces sorts, piochez une carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/eruption_solaire.png', 'https://magenoir.com/collection/FR/fire/Eruption-solaire.html', 'fr', 'Éruption solaire'),
('eruption solaire', E'This turn, preparing the following spells costs 2 less Mana of the spell''s element: Maelström, Tornado, Engulfment, Earthquake, Mons Igneus, Explosion.When you prepare one of these spells, draw a card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_eruption.png', 'https://magenoir.com/collection/EN/fire/Solar-eruption.html', 'en', 'Solar eruption')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Explosion solaire
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
    {"componentName": "Soleil", "quantity": 1},
    {"componentName": "Fission", "quantity": 1}
  ],
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Explosion solaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('explosion solaire', E'Détruisez TOUS les Soleils.Zénith : Inflige 9 points de dégâts à n''importe quelle cible.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/explosion_solaire.png', 'https://magenoir.com/collection/FR/fire/Explosion-solaire.html', 'fr', 'Explosion solaire'),
('explosion solaire', E'Destroy ALL Suns.Zenith: Inflicts 9 damage to any target.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_explosion.png', 'https://magenoir.com/collection/EN/fire/Solar-explosion.html', 'en', 'Solar explosion')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Faisceau de lumière
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('faisceau de lumiere', 'mage_noir', '{
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
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Faisceau de lumière
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('faisceau de lumiere', E'Ce sort coûte 1 Mana Feu de moins à préparer pour chaque sort défaussé depuis votre main ce tour-ci. Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/faisceau_de_lumiere.png', 'https://magenoir.com/collection/FR/fire/Faisceau-de-lumiere.html', 'fr', 'Faisceau de lumière'),
('faisceau de lumiere', E'This spell costs 1 less Fire Mana to prepare for each spell you discarded from hand this turn. Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/light_beam.png', 'https://magenoir.com/collection/EN/fire/Light-beam.html', 'en', 'Light beam')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Feu intérieur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('feu interieur', 'mage_noir', '{
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
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Feu intérieur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('feu interieur', E'Vous ne pouvez plus préparer de sort depuis votre main. La carte du dessus de votre deck est visible. Vous pouvez la préparer. Si vous faites ainsi, perdez 1 PV. À la fin de votre tour, vous pouvez payer 2 Mana Feu pour détruire Feu intérieur.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/feu_interieur.png', 'https://magenoir.com/collection/FR/fire/Feu-interieur.html', 'fr', 'Feu intérieur'),
('feu interieur', E'You may not prepare spells from hand. The top card of your deck is visible. You may prepare it. If you do, you lose 1 HP. At the end of your turn, you may pay 2 Fire Mana to destroy Inner fire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/inner_fire.png', 'https://magenoir.com/collection/EN/fire/Inner-fire.html', 'en', 'Inner fire')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Feu sauvage
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('feu sauvage', 'mage_noir', '{
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
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Feu sauvage
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('feu sauvage', E'Payez 2 Mana Feu pour infliger 2 points de dégâts à TOUS les joueurs. TOUS vos sorts sont maintenant des copies de "Feu sauvage".', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/feu_sauvage.png', 'https://magenoir.com/collection/FR/fire/Feu-sauvage.html', 'fr', 'Feu sauvage'),
('feu sauvage', E'Pay 2 Fire Mana to inflict 2 damage to ALL players. ALL your spells are now copies of "Wild fire".', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/wild_fire.png', 'https://magenoir.com/collection/EN/fire/Wild-fire.html', 'en', 'Wild fire')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Fission
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fission', E'Vous pouvez défausser 1 carte Feu depuis votre main pour préparer ce sort sans le composant Flamme requis. Défaussez-vous d''1 carte en main. Détruisez 1 Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Fission.png', 'https://magenoir.com/collection/FR/fire/Fission.html', 'fr', 'Fission'),
('fission', E'You may discard 1 Fire card from your hand to prepare this spell without the required Flame component. Discard 1 card in hand. Destroy 1 Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fission.png', 'https://magenoir.com/collection/EN/fire/Fission.html', 'en', 'Fission')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flamme
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('flamme', E'Inflige 1 point de dégâts à n''importe quelle cible. Après que ce sort est utilisé comme composant, défaussez-le.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Flamme.png', 'https://magenoir.com/collection/FR/fire/Flamme.html', 'fr', 'Flamme'),
('flamme', E'Inflicts 1 damage to any target. After this spell is used as a component, discard it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Flame.png', 'https://magenoir.com/collection/EN/fire/Flame.html', 'en', 'Flame')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flamme de soufre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flamme de soufre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('flamme de soufre', E'Ne peut être préparé que par un Mage Noir.Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Flamme-de-soufre.png', 'https://magenoir.com/collection/FR/fire/Flamme-de-soufre.html', 'fr', 'Flamme de soufre'),
('flamme de soufre', E'Can only be prepared by a Mage Noir.Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Sulfur-flame.png', 'https://magenoir.com/collection/EN/fire/Sulfur-flame.html', 'en', 'Sulfur flame')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flamme draconique
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flamme draconique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('flamme draconique', E'Inflige 2 points de dégâts à n''importe quelle cible.Après que ce sort est utilisé comme composant, vous perdez 1 Point de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Flamme-draconique.png', 'https://magenoir.com/collection/FR/fire/Flamme-draconique.html', 'fr', 'Flamme draconique'),
('flamme draconique', E'Inflicts 2 damage to any target.After this spell is used as a component, you lose 1 Health Point.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Draconic-flame.png', 'https://magenoir.com/collection/EN/fire/Draconic-flame.html', 'en', 'Draconic flame')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flamme mentale
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flamme mentale
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('flamme mentale', E'Tant que ce sort est canalisé comme composant :au début de votre tour, payez 1 Mana Feu ou défaussez ce sort.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Flamme-mentale.png', 'https://magenoir.com/collection/FR/fire/Flamme-mentale.html', 'fr', 'Flamme mentale'),
('flamme mentale', E'While channeled as a component:at the start of your turn, pay 1 Fire Mana or discard this spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Mental-flame.png', 'https://magenoir.com/collection/EN/fire/Mental-flame.html', 'en', 'Mental flame')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flamme solaire
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flamme solaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('flamme solaire', E'Description à compléter', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/flamme_solaire.png', 'https://magenoir.com/collection/FR/fire/Flamme-solaire.html', 'fr', 'Flamme solaire'),
('flamme solaire', E'Description to complete', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_flame.png', 'https://magenoir.com/collection/EN/fire/Solar-flame.html', 'en', 'Solar flame')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flèche ardente
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flèche ardente
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleche ardente', E'Inflige 3 points de dégâts à l''adversaire (ou 4 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Fleche-ardente.png', 'https://magenoir.com/collection/FR/fire/Fleche-ardente.html', 'fr', 'Flèche ardente'),
('fleche ardente', E'Inflicts 3 damage to the opponent (or 4 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fiery-arrow.png', 'https://magenoir.com/collection/EN/fire/Fiery-arrow.html', 'en', 'Fiery arrow')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Fouet de feu
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Fouet de feu
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fouet de feu', E'Au début de votre tour, inflige 1 point de dégâts à l''adversaire (ou 2 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Fouet-de-feu.png', 'https://magenoir.com/collection/FR/fire/Fouet-de-feu.html', 'fr', 'Fouet de feu'),
('fouet de feu', E'At the beginning of your turn, inflicts 1 damage to the opponent (or 2 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fire-whip.png', 'https://magenoir.com/collection/EN/fire/Fire-whip.html', 'en', 'Fire whip')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Furie du vide
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('furie du vide', 'mage_noir', '{
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
    {"componentName": "Flamme", "quantity": 2}
  ],
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Furie du vide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('furie du vide', E'Si votre main est vide, inflige 4 points de dégâts à l''adversaire (ou 5 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/furie_du_vide.png', 'https://magenoir.com/collection/FR/fire/Furie-du-vide.html', 'fr', 'Furie du vide'),
('furie du vide', E'If your hand is empty, inflicts 4 damage to the opponent (or 5 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/emptiness_s_fury.png', 'https://magenoir.com/collection/EN/fire/Emptiness-s-fury.html', 'en', 'Emptiness''s fury')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Ignition
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ignition', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Feu de moins à préparer. Ce tour-ci, à chaque fois qu''un sort va depuis le plateau vers la défausse, inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Ignition.png', 'https://magenoir.com/collection/FR/fire/Ignition.html', 'fr', 'Ignition'),
('ignition', E'If you''re a Mage Noir, this spell costs 1 less Fire Mana to prepare. This turn, whenever a card goes from play to any discard pile, inflict 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Ignition.png', 'https://magenoir.com/collection/EN/fire/Ignition.html', 'en', 'Ignition')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Impulsion pyromane
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('impulsion pyromane', 'mage_noir', '{
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
    {"componentName": "Flamme", "quantity": 1},
    {"componentName": "Fleur", "quantity": 1}
  ],
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Impulsion pyromane
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('impulsion pyromane', E'Défaussez 1 Fleur que vous contrôlez. Prenez dans l''Éther Infini autant de Mana Feu que le nombre de Mana Végétales libérées ainsi. Inflige autant de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/impulsion_pyromane.png', 'https://magenoir.com/collection/FR/fire/Impulsion-pyromane.html', 'fr', 'Impulsion pyromane'),
('impulsion pyromane', E'Discard 1 Flower your control. Take Fire Mana from the Infinite Ether equal to the Vegetal Mana released this way. Inflict that much damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/pyromaniac_impulse.png', 'https://magenoir.com/collection/EN/fire/Pyromaniac-impulse.html', 'en', 'Pyromaniac impulse')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Inspiration ardente
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('inspiration ardente', 'mage_noir', '{
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
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Inspiration ardente
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('inspiration ardente', E'Défaussez votre main. Piochez 2 cartes.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/inspiration_ardente.png', 'https://magenoir.com/collection/FR/fire/Inspiration-ardente.html', 'fr', 'Inspiration ardente'),
('inspiration ardente', E'Discard your hand. Draw 2 cards.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/fiery_inspiration.png', 'https://magenoir.com/collection/EN/fire/Fiery-inspiration.html', 'en', 'Fiery inspiration')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Invocation solaire
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Invocation solaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('invocation solaire', E'Si le sort du dessus de votre défausse est canalisable, mettez-le en jeu, canalisé comme composant (Équipements, Permanent, et Rituels ne sont pas canalisables). Zénith : inflige 2 points de dégâts à n''importe quelle cible.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/invocation_solaire.png', 'https://magenoir.com/collection/FR/fire/Invocation-solaire.html', 'fr', 'Invocation solaire'),
('invocation solaire', E'If the top spell of your discard pile can be channeled, put it into play channeled. (Equipment, Permanents and Rituals cannot be channeled)Zenith: Inflicts 2 damage to any target.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_invocation.png', 'https://magenoir.com/collection/EN/fire/Solar-invocation.html', 'en', 'Solar invocation')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lame du soleil
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lame du soleil
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lame du soleil', E'Au début de votre tour, libère 1 Mana Feu.Dès que Lame du soleil ne verrouille plus de Mana Feu, elle inflige 5 points de dégâts à TOUS les joueurs, puis elle est détruite.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/lame_du_soleil.png', 'https://magenoir.com/collection/FR/fire/Lame-du-soleil.html', 'fr', 'Lame du soleil'),
('lame du soleil', E'At the beginning of your turn, releases 1 Fire Mana.As soon as there''s no Fire Mana locked under Sun blade, it inflicts 5 damage to ALL players, then it is destroyed.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/sun_blade.png', 'https://magenoir.com/collection/EN/fire/Sun-blade.html', 'en', 'Sun blade')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lion
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lion', 'mage_noir', '{
  "type": "Animal",
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
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Jessica Heran"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lion
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lion', E'Zénith : mettez 1 Mana Feu de votre réserve sous cet Animal. Cet Animal libère 1 Mana Feu pour infliger 2 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/lion.png', 'https://magenoir.com/collection/FR/fire/Lion.html', 'fr', 'Lion'),
('lion', E'Zenith: put 1 Fire Mana from your reserve under this Animal. This Animal releases 1 Fire Mana to inflict 2 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/lion.png', 'https://magenoir.com/collection/EN/fire/Lion.html', 'en', 'Lion')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lumière radieuse
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lumière radieuse
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lumiere radieuse', E'Regardez la carte du dessus de votre deck.Vous pouvez la laisser au-dessus, ou la mettre en dessous de votre deck.Puis piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/lumiere_radieuse.png', 'https://magenoir.com/collection/FR/fire/Lumiere-radieuse.html', 'fr', 'Lumière radieuse'),
('lumiere radieuse', E'Look at the top card of your deck.You may leave it on top, or put it at the bottom of your deck.Then, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/radiant_light.png', 'https://magenoir.com/collection/EN/fire/Radiant-light.html', 'en', 'Radiant light')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Masque de feu
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Masque de feu
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('masque de feu', E'A tout moment, vous pouvez regarder la carte du dessus de votre deck. Les composants nécessaires plusieurs fois pour préparer vos sorts Feu sont nécessaires 1 fois de moins.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Masque-de-feu.png', 'https://magenoir.com/collection/FR/fire/Masque-de-feu.html', 'fr', 'Masque de feu'),
('masque de feu', E'At any time, you may look at the top card of your deck. Components needed multiple times to prepare your Fire spells are needed 1 less time.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fire-mask.png', 'https://magenoir.com/collection/EN/fire/Fire-mask.html', 'en', 'Fire mask')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Minerai d'or solaire
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Minerai d'or solaire
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('minerai d or solaire', E'ForgeZénith : Indestructible (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )Tout Équipement qui utilise ce sort comme composant gagne les effets de Minerai d''or solaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/minerai_d_or_solaire.png', 'https://magenoir.com/collection/FR/fire/Minerai-d-or-solaire.html', 'fr', 'Minerai d''or solaire'),
('minerai d or solaire', E'ForgeZenith: Indestructible (Only activates if you started this turn with an equal number of prepared and channeled spells)Any spell using this spell as a component gains the effects of Solar gold ore.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_gold_ore.png', 'https://magenoir.com/collection/EN/fire/Solar-gold-ore.html', 'en', 'Solar gold ore')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Pluie de flammes
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Pluie de flammes
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('pluie de flammes', E'Ne peut être préparé que par un Mage Noir.Inflige 5 points de dégâts, répartis comme vous le souhaitez entre 1 à 5 cibles.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Pluie-de-flammes.png', 'https://magenoir.com/collection/FR/fire/Pluie-de-flammes.html', 'fr', 'Pluie de flammes'),
('pluie de flammes', E'Can only be prepared by a Mage Noir.Inflicts 5 damage distributed as you choose between 1 to 5 targets.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Rain-of-flames.png', 'https://magenoir.com/collection/EN/fire/Rain-of-flames.html', 'en', 'Rain of flames')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Projectile de flamme
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Projectile de flamme
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('projectile de flamme', E'Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Projectile-de-flamme.png', 'https://magenoir.com/collection/FR/fire/Projectile-de-flamme.html', 'fr', 'Projectile de flamme'),
('projectile de flamme', E'Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Flame-projectile.png', 'https://magenoir.com/collection/EN/fire/Flame-projectile.html', 'en', 'Flame projectile')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rancune de Sekhmet
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rancune de sekhmet', 'mage_noir', '{
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
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rancune de Sekhmet
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rancune de sekhmet', E'Lorsqu''il est canalisé, ce sort inflige 1 point de dégâts à l''adversaire. Au début de votre tour, si ce sort est canalisé, remettez-le en préparation.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/rancune_de_sekhmet.png', 'https://magenoir.com/collection/FR/fire/Rancune-de-sekhmet.html', 'fr', 'Rancune de Sekhmet'),
('rancune de sekhmet', E'When it is channeled, this spell inflicts 1 damage to the opponent. At the start of your turn, if this spell is channeled, put it back in preparation.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/sekhmet_s_rancor.png', 'https://magenoir.com/collection/EN/fire/Sekhmet-s-rancor.html', 'en', 'Sekhmet''s rancor')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rayon de lumière
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rayon de lumière
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rayon de lumiere', E'Le prochain sort Végétal que vous préparez ce tour-ci coûte 2 Mana Végétal de moins.Si c''est un Permanent avec PV, il arrive en jeu avec 1 PV supplémentaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/rayon_de_lumiere.png', 'https://magenoir.com/collection/FR/fire/Rayon-de-lumiere.html', 'fr', 'Rayon de lumière'),
('rayon de lumiere', E'The next Vegetal spell you prepare this turn costs 2 less Vegetal Mana.If it''s a Permanent with HP, it is put into play with 1 additional HP.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/light_ray.png', 'https://magenoir.com/collection/EN/fire/Light-ray.html', 'en', 'Light ray')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Renard
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('renard', 'mage_noir', '{
  "type": "Animal",
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
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Jessica Heran"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Renard
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('renard', E'Si vous êtes Mage Noir, au début de votre tour, cet Animal revient depuis l''Exil. Défaussez 1 carte de votre main. Piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/renard.png', 'https://magenoir.com/collection/FR/fire/Renard.html', 'fr', 'Renard'),
('renard', E'If you''re a Mage Noir, at the start of your turn, this Animal comes back from Exile. Discard 1 card from your hand. Draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/fox.png', 'https://magenoir.com/collection/EN/fire/Fox.html', 'en', 'Fox')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel de rage
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel de rage', 'mage_noir', '{
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
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel de rage
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel de rage', E'Vous passez Mage Noir. Au début de votre tour, inflige 2 points de dégâts à l''adversaire, puis défaussez votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/rituel_de_rage.png', 'https://magenoir.com/collection/FR/fire/Rituel-de-rage.html', 'fr', 'Rituel de rage'),
('rituel de rage', E'You become a Mage Noir. At the start of your turn, inflicts 2 damage to the opponent, then discard your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/ritual_of_rage.png', 'https://magenoir.com/collection/EN/fire/Ritual-of-rage.html', 'en', 'Ritual of rage')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel du Zénith
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel du Zénith
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du zenith', E'Vous passez Mage Noir.Chaque fois qu''un sort que vous contrôlez est canalisé, payez 1 Mana Feu.Zénith : Durant votre phase principale, vous pouvez payer 1 Mana Feu pour activer 1 de vos sorts canalisés. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/rituel_du_zenith.png', 'https://magenoir.com/collection/FR/fire/Rituel-du-zenith.html', 'fr', 'Rituel du Zénith'),
('rituel du zenith', E'You become a Mage Noir.Each time a spell you control is channeled, pay 1 Fire Mana.Zenith: During your main phase, you may pay 1 Fire Mana to activate 1 of your channeled spells.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/zenith_ritual.png', 'https://magenoir.com/collection/EN/fire/Zenith-ritual.html', 'en', 'Zenith ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel pourpre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel pourpre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel pourpre', E'Lorsque ce sort arrive en jeu, perdez la moitié de vos Points de Vie actuels, arrondie à l''inférieur. Vous passez Mage Noir. Durant votre phase principale, vous pouvez perdre 1 PV pour prendre 1 Mana Feu dans l''Ether Infini et piocher 1 carte. (Vous pouvez le faire plusieurs fois par tour)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Rituel-pourpre.png', 'https://magenoir.com/collection/FR/fire/Rituel-pourpre.html', 'fr', 'Rituel pourpre'),
('rituel pourpre', E'When put into play, lose half of your current Health Points, rounded down. You become a Mage Noir. During your main phase, you may lose 1 HP to take 1 Fire Mana from the infinite Ether and draw 1 card. (You may do this multiple times per turn.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Crimson-ritual.png', 'https://magenoir.com/collection/EN/fire/Crimson-ritual.html', 'en', 'Crimson ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Robe brûlante
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Robe brûlante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('robe brulante', E'Chaque fois qu''un sort Feu que vous contrôlez inflige des dégâts à une cible adverse, ils sont augmentés de 1 (ou 2 si vous êtes Mage Noir). Puis, Robe brûlante vous inflige 1 point de dégâts.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Robe-brulante.png', 'https://magenoir.com/collection/FR/fire/Robe-brulante.html', 'fr', 'Robe brûlante'),
('robe brulante', E'If a Fire spell you control would inflict damage to an opposing target, it deals that much damage plus 1 (or 2 if you''re a Mage Noir). Then, Burning robe inflicts 1 damage to you.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Burning-robe.png', 'https://magenoir.com/collection/EN/fire/Burning-robe.html', 'en', 'Burning robe')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Ruse
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ruse', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Renard", "quantity": 1}
  ],
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Ruse
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ruse', E'Lorsque vous défaussez Ruse depuis votre main, vous pouvez exiler votre Renard pour reprendre Ruse dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/ruse.png', 'https://magenoir.com/collection/FR/fire/Ruse.html', 'fr', 'Ruse'),
('ruse', E'When you discard Cunning from hand, you may exile your Fox to return Cunning to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/cunning.png', 'https://magenoir.com/collection/EN/fire/Cunning.html', 'en', 'Cunning')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Soleil artificiel
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Soleil artificiel
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('soleil artificiel', E'Au début de votre tour, Soleil artificiel inflige 1 point de dégâts à TOUS les joueurs. Puis payez 1 Mana Feu ou détruisez Soleil artificiel.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/soleil_artificiel.png', 'https://magenoir.com/collection/FR/fire/Soleil-artificiel.html', 'fr', 'Soleil artificiel'),
('soleil artificiel', E'At the beginning of your turn, Artificial sun inflicts 1 damage to ALL players.Then, pay 1 Fire Mana or destroy Artificial sun.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/artificial_sun.png', 'https://magenoir.com/collection/EN/fire/Artificial-sun.html', 'en', 'Artificial sun')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Soleil mordant
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('soleil mordant', 'mage_noir', '{
  "type": "Permanent",
  "element": "Feu",
  "manaCost": {
    "total": 3,
    "manaVegetal": 0,
    "manaFeu": 2,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Lion", "quantity": 1}
  ],
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Soleil mordant
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('soleil mordant', E'Lorsque ce Permanent arrive en jeu sous votre contrôle, exilez votre Animal. Les effets de dégâts des sorts Solaires que vous contrôlez sont augmentés de 1. Zénith : votre adversaire ne peut pas gagner de Points de Vie', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/soleil_mordant.png', 'https://magenoir.com/collection/FR/fire/Soleil-mordant.html', 'fr', 'Soleil mordant'),
('soleil mordant', E'When put into play under your control, exile your Animal. Damage from Solar spells you control is increased by 1. Zenith: The opponent cannot gain Health Points.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/biting_sun.png', 'https://magenoir.com/collection/EN/fire/Biting-sun.html', 'en', 'Biting sun')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Souffle ardent
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('souffle ardent', 'mage_noir', '{
  "type": "Permanent",
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
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Souffle ardent
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('souffle ardent', E'Quand vous épuisez votre Animal, inflige 1 point de dégâts à TOUS les joueurs.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/souffle_ardent.png', 'https://magenoir.com/collection/FR/fire/Souffle-ardent.html', 'fr', 'Souffle ardent'),
('souffle ardent', E'When you exhaust your Animal, inflicts 1 damage to ALL players.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/fiery_breath.png', 'https://magenoir.com/collection/EN/fire/Fiery-breath.html', 'en', 'Fiery breath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vague de flammes
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vague de flammes
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vague de flammes', E'Inflige 1 point de dégâts à l''adversaire et ses Permanents par composant Flamme que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Vague-de-flammes.png', 'https://magenoir.com/collection/FR/fire/Vague-de-flammes.html', 'fr', 'Vague de flammes'),
('vague de flammes', E'Inflicts 1 damage to the opponent and their Permanents for each Flame component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Wave-of-flames.png', 'https://magenoir.com/collection/EN/fire/Wave-of-flames.html', 'en', 'Wave of flames')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vents solaires
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vents solaires
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vents solaires', E'Inflige 3 points de dégâts à n''importe quelle cible.Zénith : Piochez 1 carte.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/vents_solaires.png', 'https://magenoir.com/collection/FR/fire/Vents-solaires.html', 'fr', 'Vents solaires'),
('vents solaires', E'Inflicts 3 damage to any target.Zenith: Draw 1 card.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_winds.png', 'https://magenoir.com/collection/EN/fire/Solar-winds.html', 'en', 'Solar winds')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Volonté ardente
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('volonte ardente', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [
    {"componentName": "Ardent", "quantity": 1}
  ],
  "extension": "Le Renard et la Vengeresse",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Volonté ardente
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('volonte ardente', E'Défaussez une carte de votre main pour infliger autant de dégâts que son coût total en Mana à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/volonte_ardente.png', 'https://magenoir.com/collection/FR/fire/Volonte-ardente.html', 'fr', 'Volonté ardente'),
('volonte ardente', E'Discard a card from hand to inflict damage equal to its total Mana cost to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/fiery_will.png', 'https://magenoir.com/collection/EN/fire/Fiery-will.html', 'en', 'Fiery will')
ON CONFLICT (card_id, locale) DO NOTHING;

-- Nombre de cartes pour Feu: 48

--========================================================================================================================
-- Minéral
--========================================================================================================================

--========================================================================================================================
-- Ambidextrie
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ambidextrie', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Ambidextrie
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ambidextrie', E'Vous pouvez contrôler 2 Équipements : Arme en même temps.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/ambidextrie.png', 'https://magenoir.com/collection/FR/mineral/Ambidextrie.html', 'fr', 'Ambidextrie'),
('ambidextrie', E'You may control 2 pieces of Equipment: Weapon at once.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/ambidexterity.png', 'https://magenoir.com/collection/EN/mineral/Ambidexterity.html', 'en', 'Ambidexterity')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Anneau de lithomancie
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Anneau de lithomancie
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('anneau de lithomancie', E'Vos permanents Minéraux ayant au moins un Point de Vie ont "Protecteur". (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/anneau-de-lithomancie.png', 'https://magenoir.com/collection/FR/mineral/Anneau-de-lithomancie.html', 'fr', 'Anneau de lithomancie'),
('anneau de lithomancie', E'Your Mineral Permanents with at least one Health Point have "Protector". (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Lithomancy-ring.png', 'https://magenoir.com/collection/EN/mineral/Lithomancy-ring.html', 'en', 'Lithomancy ring')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Arbre de pierre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Arbre de pierre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('arbre de pierre', E'Ne peut pas gagner de Points de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Arbre-de-pierre.png', 'https://magenoir.com/collection/FR/mineral/Arbre-de-pierre.html', 'fr', 'Arbre de pierre'),
('arbre de pierre', E'Can''t gain Health Points.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Stone-tree.png', 'https://magenoir.com/collection/EN/mineral/Stone-tree.html', 'en', 'Stone tree')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Armure matérialisée
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
    {"componentName": "Armure", "quantity": 1},
    {"componentName": "Minerai", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Armure matérialisée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('armure materialisee', E'Les dégâts que vous subissez sont réduits de 1. Chaque tour, ignorez jusqu''à X point de dégâts qui vous sont infligés. X est égal au nombre de Mana Minéral sous vos autres composants. X est déterminé la première fois que des dégâts vous sont infligés dans le tour. X ne peut être supérieur à 6', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Armure-materialisee.png', 'https://magenoir.com/collection/FR/mineral/Armure-materialisee.html', 'fr', 'Armure matérialisée'),
('armure materialisee', E'Damage you take is reduced by 1. Each turn, ignore up to X damage that is inflicted to you, where X is the amount of Mineral Mana under your other components. X is determined the first time damage is inflicted to you during the turn. X can''t be more than 6.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Materialized-armor.png', 'https://magenoir.com/collection/EN/mineral/Materialized-armor.html', 'en', 'Materialized armor')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Armure solide
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Armure solide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('armure solide', E'Chaque tour, ignorez jusqu''à X point de dégâts qui vous sont infligés. X est égal au nombre de Mana Minéral sous vos autres composants. X est déterminé la première fois que des dégâts vous sont infligés dans le tour. X ne peut être supérieur à 4.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Armure-solide.png', 'https://magenoir.com/collection/FR/mineral/Armure-solide.html', 'fr', 'Armure solide'),
('armure solide', E'Each turn, ignore up to X damage that is inflicted to you, where X is the amount of Mineral Mana under your other components. X is determined the first time damage is inflicted to you during the turn. X can''t be more than 4.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Solid-armor.png', 'https://magenoir.com/collection/EN/mineral/Solid-armor.html', 'en', 'Solid armor')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Baroud d'honneur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('baroud d honneur', 'mage_noir', '{
  "type": "Sort",
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
    {"componentName": "Chien", "quantity": 1}
  ],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Baroud d'honneur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('baroud d honneur', E'Unique (Vous ne pouvez contrôler qu''un seul exemplaire de cette carte.) Inflige 3 points de dégâts à l''adversaire (ou 5 si il est Mage Noir). Exilez votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/baroud_d_honneur.png', 'https://magenoir.com/collection/FR/mineral/Baroud-d-honneur.html', 'fr', 'Baroud d''honneur'),
('baroud d honneur', E'Unique (You may only control one copy of this spell.) Inflicts 3 damage to the opponent (or 5 if they''re a Mage Noir). Exile your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/last_stand.png', 'https://magenoir.com/collection/EN/mineral/Last-stand.html', 'en', 'Last stand')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Bastion
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('bastion', E'Vous ne pouvez pas subir plus d''1 point de dégâts à la fois.Au début de votre tour, détruisez ce Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/bastion.png', 'https://magenoir.com/collection/FR/mineral/Bastion.html', 'fr', 'Bastion'),
('bastion', E'You cannot take more than 1 damage at once. At the beginning of your turn, destroy Bastion.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/bastion.png', 'https://magenoir.com/collection/EN/mineral/Bastion.html', 'en', 'Bastion')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Bouclier de Mana
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('bouclier de mana', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Bouclier de Mana
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('bouclier de mana', E'Rapide Défaussez une carte Minérale de votre main pour préparer ce sort. Mettez toute la Mana de votre réserve dans l''Éther Disponible. 1 sort en préparation de votre choix n''a pas d''effet ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/bouclier_de_mana.png', 'https://magenoir.com/collection/FR/mineral/Bouclier-de-mana.html', 'fr', 'Bouclier de Mana'),
('bouclier de mana', E'Quickcast Discard a Mineral card from your hand to prepare this spell. Release all Mana in your Mana reserve into the Available Ether. 1 prepared spell of your choice has no effect this turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/mana_shield.png', 'https://magenoir.com/collection/EN/mineral/Mana-shield.html', 'en', 'Mana shield')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Brûlure de magma
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
    {"componentName": "Roche", "quantity": 1},
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Brûlure de magma
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('brulure de magma', E'Inflige 5 points de dégâts à n''importe quelle cible. Vous pouvez détruire 1 Anneau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Brulure-de-magma.png', 'https://magenoir.com/collection/FR/mineral/Brulure-de-magma.html', 'fr', 'Brûlure de magma'),
('brulure de magma', E'Inflicts 5 damage to any target. You may destroy 1 Ring.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Magma-burn.png', 'https://magenoir.com/collection/EN/mineral/Magma-burn.html', 'en', 'Magma burn')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Chien
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('chien', 'mage_noir', '{
  "type": "Animal",
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Chien
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('chien', E'Si préparer un sort épuise cet Animal, régénérez-le. Inflige 1 point de dégâts à l''adversaire, ou 2 s''il est Mage Noir.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/chien.png', 'https://magenoir.com/collection/FR/mineral/Chien.html', 'fr', 'Chien'),
('chien', E'If preparing a spell exhausts this Animal, rest it. Inflicts 1 damage to the opponent, or 2 if they are a Mage Noir.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/dog.png', 'https://magenoir.com/collection/EN/mineral/Dog.html', 'en', 'Dog')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Clipeus de Mars
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('clipeus de mars', 'mage_noir', '{
  "type": "Équipement : Arme",
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Clipeus de Mars
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('clipeus de mars', E'Les dégâts infligés par les Équipements adverses sont réduits de 1 (ou 2 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/clipeus_de_mars.png', 'https://magenoir.com/collection/FR/mineral/Clipeus-de-mars.html', 'fr', 'Clipeus de Mars'),
('clipeus de mars', E'Damage inflicted by the opponent''s Equipment is reduced by 1 (or 2 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/mars_s_clipeus.png', 'https://magenoir.com/collection/EN/mineral/Mars-s-clipeus.html', 'en', 'Mars''s clipeus')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Colère de Râ
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
    {"componentName": "Désert", "quantity": 1},
    {"componentName": "Soleil", "quantity": 1}
  ],
  "extension": "Sable",
  "artwork": "Jessica Heran"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Colère de Râ
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('colere de ra', E'Mettez 1 sort en jeu (hors Rituel) dans la défausse de son contrôleur. Si vous êtes Mage Noir, cet effet ignore Indestructible.Inflige 5 points de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/colere_de_ra.png', 'https://magenoir.com/collection/FR/mineral/Colere-de-ra.html', 'fr', 'Colère de Râ'),
('colere de ra', E'Put any 1 spell in play (except a Ritual) into its owner''s discard pile. If you''re a Mage Noir, this ignores Indestructible.Inflicts 5 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/ra_s_wrath.png', 'https://magenoir.com/collection/EN/mineral/Ra-s-wrath.html', 'en', 'Râ''s wrath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Coup de marteau divin
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Coup de marteau divin
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('coup de marteau divin', E'Détruisez 1 Équipement.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Coup-de-marteau-divin.png', 'https://magenoir.com/collection/FR/mineral/Coup-de-marteau-divin.html', 'fr', 'Coup de marteau divin'),
('coup de marteau divin', E'Destroy 1 piece of Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Divine-hammer-strike.png', 'https://magenoir.com/collection/EN/mineral/Divine-hammer-strike.html', 'en', 'Divine hammer strike')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Coup de poing
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('coup de poing', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Coup de poing
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('coup de poing', E'Rapide (Ce sort peut être activé à tout moment.) Inflige 1 point de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/coup_de_poing.png', 'https://magenoir.com/collection/FR/mineral/Coup-de-poing.html', 'fr', 'Coup de poing'),
('coup de poing', E'Quickcast (This spell can be activated at any time.) Inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/punch.png', 'https://magenoir.com/collection/EN/mineral/Punch.html', 'en', 'Punch')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Couronne de la renonciation
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Couronne de la renonciation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('couronne de la renonciation', E'Ne peut être équipé que par un Mage Noir. Tant que ce sort est en jeu, vous n''êtes pas Mage Noir et vos rituels n''ont pas d''effet. A tout moment payez 1 Mana pour ignorer 1 point de dégâts qui vous est infligé. Si votre réserve de Mana est vide, détruisez cet Équipement.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Couronne-de-la-renonciation.png', 'https://magenoir.com/collection/FR/mineral/Couronne-de-la-renonciation.html', 'fr', 'Couronne de la renonciation'),
('couronne de la renonciation', E'Can only be equipped by a Mage Noir. While this spell is in play, you are not a Mage Noir and your rituals have no effect. At any time, you may pay 1 Mana to ignore 1 damage that would be inflicted to you. When your Mana reserve is empty, destroy this Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Waiver-crown.png', 'https://magenoir.com/collection/EN/mineral/Waiver-crown.html', 'en', 'Waiver crown')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Crocs du désert
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Crocs du désert
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('crocs du desert', E'Si vous êtes Mage Noir, vous pouvez préparer ce sort en utilisant la Mana verrouillée sous vos composants Sable.Si vous êtes Mage Noir, ce sort gagne : "Rapide" (Ce sort peut être activé à tout moment ).Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/crocs_du_desert.png', 'https://magenoir.com/collection/FR/mineral/Crocs-du-desert.html', 'fr', 'Crocs du désert'),
('crocs du desert', E'If you''re a Mage Noir, you may prepare this spell using Mana locked under your Sand components.If you''re a Mage Noir, this spell gains: "Quickcast". (This spell can be activated at any time)Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_fangs.png', 'https://magenoir.com/collection/EN/mineral/Desert-fangs.html', 'en', 'Desert fangs')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Déferlement de roches
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('deferlement de roches', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Déferlement de roches
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('deferlement de roches', E'Si vous contrôlez au moins 3 composants Roches, ce sort a Transmutable : "Vague". Inflige 2 points de dégâts à l''adversaire (ou 5 si vous contrôlez un composant Séisme).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/déferlement_de_roches.png', 'https://magenoir.com/collection/FR/mineral/Deferlement-de-roches.html', 'fr', 'Déferlement de roches'),
('deferlement de roches', E'If you control at least 3 Rock components, this spell has Transmutable: "Wave". Inflicts 2 damage to the opponent (or 5 if you control an Earthquake component).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/rock_surge.png', 'https://magenoir.com/collection/EN/mineral/Rock-surge.html', 'en', 'Rock surge')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Épée matérialisée
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
    {"componentName": "Lame", "quantity": 1},
    {"componentName": "Minerai", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Jessica Heran"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Épée matérialisée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('epee materialisee', E'Une fois par tour, durant votre phase principale, inflige 2 points de dégâts à n''importe quelle cible. Puis la Lame utilisée comme composant pour lancer ce sort applique ses effets (même si celle-ci est dans la défausse).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Lame-materialisee.png', 'https://magenoir.com/collection/FR/mineral/Epee-materialisee.html', 'fr', 'Épée matérialisée'),
('epee materialisee', E'Once per turn during your main phase, inflicts 2 damage to any target. Then, the Blade used as a component to cast this spell also applies its effects (even if it is in the discard pile).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Materialized-sword.png', 'https://magenoir.com/collection/EN/mineral/Materialized-sword.html', 'en', 'Materialized sword')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Graine des sables
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Graine des sables
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('graine des sables', E'Le dernier sort Permanent ayant utilisé Graine des sables comme composant a l''effet :"Les dégâts infligés à ce Permanent sont réduits de 1."', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/graine_des_sables.png', 'https://magenoir.com/collection/FR/mineral/Graine-des-sables.html', 'fr', 'Graine des sables'),
('graine des sables', E'The last Permanent spell that used Seed of the sands as a component has the effect:"Damage inflicted to this Permanent is reduced by 1."', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/seed_of_the_sands.png', 'https://magenoir.com/collection/EN/mineral/Seed-of-the-sands.html', 'en', 'Seed of the sands')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Intimidation
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('intimidation', 'mage_noir', '{
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
  "extension": "Le Chien et le Guerrier",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Intimidation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('intimidation', E'Tant que votre Animal est face visible, les capacités actives de l''Animal de l''adversaire coûtent 1 Mana Minérale de plus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/intimidation.png', 'https://magenoir.com/collection/FR/mineral/Intimidation.html', 'fr', 'Intimidation'),
('intimidation', E'As long as your Animal is face up, the active abilities of the opponent''s Animal cost 1 additional Mineral Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/intimidation.png', 'https://magenoir.com/collection/EN/mineral/Intimidation.html', 'en', 'Intimidation')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lame forgée
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lame forgée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lame forgee', E'Une fois par tour, durant votre phase principale, inflige 1 point de dégât à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Lame-forgee.png', 'https://magenoir.com/collection/FR/mineral/Lame-forgee.html', 'fr', 'Lame forgée'),
('lame forgee', E'Once per turn during your main phase, inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Forged-blade.png', 'https://magenoir.com/collection/EN/mineral/Forged-blade.html', 'en', 'Forged blade')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Lance de Mars
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('lance de mars', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Lance de Mars
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('lance de mars', E'Lorsqu''un adversaire vous inflige des dégâts avec un Équipement, vous pouvez lui infliger 1 point de dégâts. À tout moment, vous pouvez détruire cet Équipement pour infliger 2 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/lance_de_mars.png', 'https://magenoir.com/collection/FR/mineral/Lance-de-mars.html', 'fr', 'Lance de Mars'),
('lance de mars', E'When Equipment the opponent controls inflicts damage to you, you may inflict 1 damage to them. At any time, you may destroy this piece of Equipment to inflict 2 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/mars_s_spear.png', 'https://magenoir.com/collection/EN/mineral/Mars-s-spear.html', 'en', 'Mars''s spear')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Main du désert
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Main du désert
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('main du desert', E'Au début de votre tour, inflige 1 point de dégâts à l''adversaire.Si vous contrôlez au moins 2 composants Sable, ce Permanent a Protecteur.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/main_du_desert.png', 'https://magenoir.com/collection/FR/mineral/Main-du-desert.html', 'fr', 'Main du désert'),
('main du desert', E'At the beginning of your turn, inflicts 1 damage to the opponent.If you control at least 2 Sand components, this Permanent has Protector.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_hand.png', 'https://magenoir.com/collection/EN/mineral/Desert-hand.html', 'en', 'Desert hand')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Malédiction antique
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('malediction antique', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [
    {"componentName": "Scarabée", "quantity": 1}
  ],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Malédiction antique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('malediction antique', E'Défaussez tous les Rituels du joueur ciblé. Il n''est plus Mage Noir. Exilez votre Animal (même si celui-ci est dans votre deck).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/malediction_antique.png', 'https://magenoir.com/collection/FR/mineral/Malediction-antique.html', 'fr', 'Malédiction antique'),
('malediction antique', E'Discard all Rituals controlled by target player. They aren''t a Mage Noir anymore. Exile your Animal (even if it is in your deck).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/antique_curse.png', 'https://magenoir.com/collection/EN/mineral/Antique-curse.html', 'en', 'Antique curse')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Météore d'Ina
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Météore d'Ina
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('meteore d ina', E'Si vous êtes Mage Noir, pour préparer ce sort, vous pouvez utiliser 4 roches au lieu d''1 composant Météore. Inflige X points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Meteore-d-ina.png', 'https://magenoir.com/collection/FR/mineral/Meteore-d-ina.html', 'fr', 'Météore d''Ina'),
('meteore d ina', E'If you''re a Mage Noir, you may use 4 Rocks instead of 1 Meteor component to prepare this spell. Inflicts X damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Inas-meteor.png', 'https://magenoir.com/collection/EN/mineral/Inas-meteor.html', 'en', 'Ina''s meteor')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Météore du désert
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Météore du désert
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('meteore du desert', E'Si vous êtes Mage Noir, ce sort coûte 1 Mana Minéral de moins à préparer.Inflige 1 point de dégâts à n''importe quelle cible par composant Sable que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/meteore_du_desert.png', 'https://magenoir.com/collection/FR/mineral/Meteore-du-desert.html', 'fr', 'Météore du désert'),
('meteore du desert', E'If you''re a Mage Noir, this spell costs 1 less Mineral Mana to prepare.Inflicts 1 damage to any target for each Sand component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_meteor.png', 'https://magenoir.com/collection/EN/mineral/Desert-meteor.html', 'en', 'Desert meteor')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Mine souterraine
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Mine souterraine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('mine souterraine', E'Durant votre phase principale, vous pouvez payer 1 Mana Minéral pour regarder la carte du dessus de votre deck.Si c''est une Roche, vous pouvez la montrer à votre adversaire et la mettre dans votre main.Sinon, mettez-la au-dessous de votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/mine_souterraine.png', 'https://magenoir.com/collection/FR/mineral/Mine-souterraine.html', 'fr', 'Mine souterraine'),
('mine souterraine', E'During your main phase, you may pay 1 Mineral Mana to look at the top card of your deck.If it''s a Rock, you may show it to the opponent and put it into your hand.Otherwise, put it at the bottom of your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/underground_mine.png', 'https://magenoir.com/collection/EN/mineral/Underground-mine.html', 'en', 'Underground mine')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Minerai des temps
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Minerai des temps
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('minerai des temps', E'Tout Équipement qui utilise ce sort comme composant coûte 1 Mana Minéral de moins.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/minerai_des_temps.png', 'https://magenoir.com/collection/FR/mineral/Minerai-des-temps.html', 'fr', 'Minerai des temps'),
('minerai des temps', E'Any Equipment using this spell as a component costs 1 less Mineral Mana to prepare.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/time_ore.png', 'https://magenoir.com/collection/EN/mineral/Time-ore.html', 'en', 'Time ore')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Mons igneus
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
    {"componentName": "Magma", "quantity": 1},
    {"componentName": "Séisme", "quantity": 1}
  ],
  "extension": "Voie du Guerrier-Mage",
  "artwork": "Charles Ouvrard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Mons igneus
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('mons igneus', E'Inflige 5 points de dégâts à n''importe quelle cible, puis 1 composant Séisme et 1 composant Magma que vous contrôlez appliquent leurs effets.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Mons-igneus.png', 'https://magenoir.com/collection/FR/mineral/Mons-igneus.html', 'fr', 'Mons igneus'),
('mons igneus', E'Inflicts 5 damage to any target, then apply the effects of 1 Earthquake and 1 Magma component you control', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Mons-igneus.png', 'https://magenoir.com/collection/EN/mineral/Mons-igneus.html', 'en', 'Mons igneus')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Mur de roche
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Mur de roche
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('mur de roche', E'Lorsque ce Permanent a moins de un Point de Vie, libérez sa Mana et canalisez-le en composant plutôt que de le détruire. Celui-ci ne compte alors plus comme composant Mur.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Mur-de-roche.png', 'https://magenoir.com/collection/FR/mineral/Mur-de-roche.html', 'fr', 'Mur de roche'),
('mur de roche', E'Once this Permanent has less than one Health Point, release its Mana and channel it as a Rock component instead of destroying it. It does not count as a Wall component anymore.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Rock-wall.png', 'https://magenoir.com/collection/EN/mineral/Rock-wall.html', 'en', 'Rock wall')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Mur du désert
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Mur du désert
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('mur du desert', E'Lorsqu''il arrive en jeu, déplacez autant de Mana Minéral que vous le souhaitez de vos composants Sable sous ce Permanent.Mur du désert arrive en jeu avec autant de PV qu''il verrouille de Mana Minéral.Si vous êtes Mage Noir, ce Permanent a Protecteur.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/mur_du_desert.png', 'https://magenoir.com/collection/FR/mineral/Mur-du-desert.html', 'fr', 'Mur du désert'),
('mur du desert', E'When put into play, move any amount of Mineral Mana from your Sand components under Desert wall.Desert wall is put into play with HP equal to the amount of Mineral Mana locked under it.If you''re a Mage Noir, this Permanent has Protector.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_wall.png', 'https://magenoir.com/collection/EN/mineral/Desert-wall.html', 'en', 'Desert wall')
ON CONFLICT (card_id, locale) DO NOTHING;

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
    {"componentName": "Désert", "quantity": 1},
    {"componentName": "Source", "quantity": 1}
  ],
  "extension": "Sable",
  "artwork": "Victor Fayen"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Oasis
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('oasis', E'Lorsque vous activez un sort Désert, vous pouvez payer 1 Mana Eau pour le renvoyer dans votre main au lieu de le défausser.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/oasis.png', 'https://magenoir.com/collection/FR/mineral/Oasis.html', 'fr', 'Oasis'),
('oasis', E'Whenever you activate a Desert spell, you may pay 1 Water Mana to return it to your hand instead of discarding it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/oasis.png', 'https://magenoir.com/collection/EN/mineral/Oasis.html', 'en', 'Oasis')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Poing limaille
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('poing limaille', 'mage_noir', '{
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
  "extension": "Le Chien et le Guerrier",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Poing limaille
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('poing limaille', E'Si un Équipement a été détruit ce tour-ci, inflige 4 points de dégâts à l''adversaire (ou 5 Si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/poing_limaille.png', 'https://magenoir.com/collection/FR/mineral/Poing-limaille.html', 'fr', 'Poing limaille'),
('poing limaille', E'If a piece of Equipment was destroyed this turn, inflicts 4 damage to the opponent (or 5 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/grit_punch.png', 'https://magenoir.com/collection/EN/mineral/Grit-punch.html', 'en', 'Grit punch')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Poing météore
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Poing météore
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('poing meteore', E'Inflige 5 points de dégâts à l''adversaire. Puis vous inflige 2 points de dégâts. Puis inflige 2 points de dégâts à TOUS les Permanents.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Poing-meteore.png', 'https://magenoir.com/collection/FR/mineral/Poing-meteore.html', 'fr', 'Poing météore'),
('poing meteore', E'Inflicts 5 damage to the opponent. Then, inflicts 2 damage to you. Then, inflicts 2 damage to EVERY Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Meteor-punch.png', 'https://magenoir.com/collection/EN/mineral/Meteor-punch.html', 'en', 'Meteor punch')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Reforger
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('reforger', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé ) Les dégâts d''un Équipement de votre choix sont augmentés de 1.Puis vous pouvez payer 1 Mana Eau pour renvoyer Reforger dans votre main au lieu de le défausser.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/reforger.png', 'https://magenoir.com/collection/FR/mineral/Reforger.html', 'fr', 'Reforger'),
('reforger', E'Slowcast (This spell can''t be activated on the turn it was prepared)Damage inflicted by target Equipment you control is increased by 1.Then, you may pay 1 Water Mana to return Reforge to your hand instead of discarding it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/reforge.png', 'https://magenoir.com/collection/EN/mineral/Reforge.html', 'en', 'Reforge')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Réplique de verre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Réplique de verre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('replique de verre', E'Prenez 1 Équipement dans votre deck. Il perd tous ses effets. Mettez-le en jeu. Il est toujours un Équipement et correspond toujours à son emplacement désigné.Mélangez votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/replique_de_verre.png', 'https://magenoir.com/collection/FR/mineral/Replique-de-verre.html', 'fr', 'Réplique de verre'),
('replique de verre', E'Take 1 piece of Equipment from your deck. It loses all its effects. Put it into play. It retains its card type and Equipment type.Shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/glass_replica.png', 'https://magenoir.com/collection/EN/mineral/Glass-replica.html', 'en', 'Glass replica')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel d'exuviation
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel d'exuviation
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel d exuviation', E'Vous passez Mage Noir.Vos sorts coûtent 1 Mana Minéral de moins à préparer.Les dégâts qui vous sont infligés sont augmentés de 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/rituel_d_exuviation.png', 'https://magenoir.com/collection/FR/mineral/Rituel-d-exuviation.html', 'fr', 'Rituel d''exuviation'),
('rituel d exuviation', E'You become a Mage Noir.Your spells cost 1 less Mineral Mana to prepare.Damage inflicted to you is increased by 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/ecdysis_ritual.png', 'https://magenoir.com/collection/EN/mineral/Ecdysis-ritual.html', 'en', 'Ecdysis ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel du gladiateur
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel du gladiateur', 'mage_noir', '{
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
  "extension": "Le Chien et le Guerrier",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel du gladiateur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du gladiateur', E'Vous passez Mage Noir. Les seuls Équipements que vous pouvez contrôler sont des Armes. Détruisez vos autres Équipements immédiatement. Au début de votre tour, reprenez 1 Équipement : Arme de votre défausse dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/rituel_du_gladiateur.png', 'https://magenoir.com/collection/FR/mineral/Rituel-du-gladiateur.html', 'fr', 'Rituel du gladiateur'),
('rituel du gladiateur', E'You become a Mage Noir. The only Equipment you may control are Weapons. Destroy your other pieces of Equipment immediately. At the beginning of your turn, return 1 Equipment: Weapon from your discard pile to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/gladiator_ritual.png', 'https://magenoir.com/collection/EN/mineral/Gladiator-ritual.html', 'en', 'Gladiator ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel du guerrier-mage
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel du guerrier-mage
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel du guerrier mage', E'Vous passez Mage Noir. A la fin de votre tour, détruisez tous les Équipements que vous avez joué ce tour-ci. Les dégâts infligés par vos Équipements sont augmentés de 1. A tout moment vous pouvez défausser 1 carte de votre main pour que l''Équipement ciblé soit indestructible ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Rituel-du-guerrier-mage.png', 'https://magenoir.com/collection/FR/mineral/Rituel-du-guerrier-mage.html', 'fr', 'Rituel du guerrier-mage'),
('rituel du guerrier mage', E'You become a Mage Noir. At the end of your turn, destroy all Equipment you played this turn. Damage inflicted by your Equipment is increased by 1. At any time, you may discard 1 card to make target Equipment you control indestructible until the end of the turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Warrior-mage-ritual.png', 'https://magenoir.com/collection/EN/mineral/Warrior-mage-ritual.html', 'en', 'Warrior-mage ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Roche
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('roche', E'Si vous contrôlez 2 exemplaires de ce sort, ils ont "Transmutable : Minerai". Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.) Prenez 1 Mana Minéral dans l''Ether disponible puis infligez 1 point de dégât à 1 Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Roche.png', 'https://magenoir.com/collection/FR/mineral/Roche.html', 'fr', 'Roche'),
('roche', E'If you control 2 copies of this spell, they have "Transmutable : Ore". (These spells can be used as Ore components.) Forge. (Is discarded once used as a component for Equipment.) Take 1 Mineral Mana from the Available Ether and deal 1 damage to 1 Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Iron-rock.png', 'https://magenoir.com/collection/EN/mineral/Rock.html', 'en', 'Rock')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Roche d'obsidienne
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Roche d'obsidienne
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('roche d obsidienne', E'Lorsque des dégâts vous sont infligés, ce sort libère 1 Mana Minéral. Lorsqu''il ne verrouille plus de Mana, ce sort a Transmutable : Minerai (Ce sort est utilisable comme composant Minerai.) Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.) Ajoutez 1 à chaque chiffre dans l''effet de tout Équipement utilisant ce sort comme composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Roche-d-obsidienne.png', 'https://magenoir.com/collection/FR/mineral/Roche-d-obsidienne.html', 'fr', 'Roche d''obsidienne'),
('roche d obsidienne', E'When damage is inflicted to you, this spell releases 1 Mineral Mana. As soon as there''s no Mana locked under it, this spell gains "Transmutable : Ore" (This spell can be used as a Ore component.) Forge. (Is discarded once used as a component for Equipment.) Add 1 to every number in the effects of any Equipment using this spell as a component.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Obsidian-rock.png', 'https://magenoir.com/collection/EN/mineral/Obsidian-rock.html', 'en', 'Obsidian rock')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Roche ferreuse
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Roche ferreuse
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('roche ferreuse', E'Durant votre phase principale, vous pouvez placer 1 Mana Feu de votre réserve de Mana sous ce sort. Il gagne alors "Transmutable : Minerai" (Ce sort est utilisable comme composant Minerai.) Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Roche-ferreuse.png', 'https://magenoir.com/collection/FR/mineral/Roche-ferreuse.html', 'fr', 'Roche ferreuse'),
('roche ferreuse', E'During your main phase, you may put 1 Fire Mana from your Mana reserve under this spell. Then, it gains "Transmutable : Ore" (This spell can be used as an Ore component.). Forge.(Is discarded once used as a component for Equipment.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Solid-rock.png', 'https://magenoir.com/collection/EN/mineral/Iron-rock.html', 'en', 'Iron rock')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Roche friable
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Roche friable
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('roche friable', E'Durant votre phase principale, vous pouvez payer 1 Mana Minéral pour que ce sort gagne "Transmutable : Sable" jusqu''à la fin du tour.Lorsque vous activez Roche friable, inflige 1 point de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/roche_friable.png', 'https://magenoir.com/collection/FR/mineral/Roche-friable.html', 'fr', 'Roche friable'),
('roche friable', E'During your main phase, you may pay 1 Mineral Mana to have this spell gain: "Transmutable: Sand" until the end of your turn.When activated, inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/crumbling_rock.png', 'https://magenoir.com/collection/EN/mineral/Crumbling-rock.html', 'en', 'Crumbling rock')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rose du désert
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rose du desert', 'mage_noir', '{
  "type": "Permanent",
  "element": "Minéral",
  "manaCost": {
    "total": 2,
    "manaVegetal": 0,
    "manaFeu": 0,
    "manaAir": 1,
    "manaEau": 0,
    "manaMineral": 1,
    "manaArcane": 0
  },
  "components": [],
  "componentCost": [
    {"componentName": "Sable", "quantity": 1}
  ],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rose du désert
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rose du desert', E'Si vous êtes Mage Noir, ce sort a Transmutable : "Fleur". Au début de votre tour, vous pouvez renvoyer 1 sort Sable que vous contrôlez dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/rose_du_desert.png', 'https://magenoir.com/collection/FR/mineral/Rose-du-desert.html', 'fr', 'Rose du désert'),
('rose du desert', E'If you''re a Mage Noir, this spell has Transmutable: "Flower". At the beginning of your turn, you may return 1 Sand spell you control to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_rose.png', 'https://magenoir.com/collection/EN/mineral/Desert-rose.html', 'en', 'Desert rose')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Sable fin
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Sable fin
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sable fin', E'Si Sable fin verrouille plus d''1 Mana, toute Mana en excédent est immédiatement libérée, sauf si vous êtes Mage Noir.Lorsqu''un Désert va à la défausse, verrouillez 1 Mana Minéral de celui-ci sous Sable fin au lieu de la libérer.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/sable_fin.png', 'https://magenoir.com/collection/FR/mineral/Sable-fin.html', 'fr', 'Sable fin'),
('sable fin', E'Whenever Fine sand locks more than 1 Mana, any excess Mana is instantly released, unless you''re a Mage Noir.When a Desert spell goes to the discard pile, lock 1 Mineral Mana from it under Fine sand instead of releasing it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/fine_sand.png', 'https://magenoir.com/collection/EN/mineral/Fine-sand.html', 'en', 'Fine sand')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Sables changeants
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('sables changeants', 'mage_noir', '{
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Sables changeants
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sables changeants', E'Description à compléter', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/sables_changeants.png', 'https://magenoir.com/collection/FR/mineral/Sables-changeants.html', 'fr', 'Sables changeants'),
('sables changeants', E'Description to complete', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/shifting_sands.png', 'https://magenoir.com/collection/EN/mineral/Shifting-sands.html', 'en', 'Shifting sands')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Sables mouvants
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Sables mouvants
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sables mouvants', E'Transmutable : GoutteRapide (Ce sort peut être activé à tout moment )1 sort en préparation de votre choix gagne : "Lent". (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/sables_mouvants.png', 'https://magenoir.com/collection/FR/mineral/Sables-mouvants.html', 'fr', 'Sables mouvants'),
('sables mouvants', E'Transmutable: Drop, SandQuickcast (This spell can be activated at any time)1 prepared spell gains: "Slowcast". (This spell can''t be activated on the turn it was prepared)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/quicksand.png', 'https://magenoir.com/collection/EN/mineral/Quicksand.html', 'en', 'Quicksand')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Scarabée
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('scarabee', 'mage_noir', '{
  "type": "Animal",
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
  "componentCost": [],
  "extension": "Le Chien et le Guerrier",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Scarabée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('scarabee', E'Lorsque cet Animal arrive en jeu, vous pouvez payer 1 Mana Minérale et verrouiller 1 Mana de votre réserve sous un sort Minéral, pour piocher 1 carte (ou 2 si vous êtes Mage Noir). À la fin de votre tour, renvoyez cet Animal dans votre deck, en 3ème position.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/scarabee.png', 'https://magenoir.com/collection/FR/mineral/Scarabee.html', 'fr', 'Scarabée'),
('scarabee', E'When this Animal enters play, you may pay 1 Mineral Mana and lock 1 Mana from your reserve under a Mineral spell to draw 1 card (or 2 if you''re a Mage Noir). At the end of your turn, put this Animal into your deck 3rd from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/scarab.png', 'https://magenoir.com/collection/EN/mineral/Scarab.html', 'en', 'Scarab')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Séisme
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Séisme
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('seisme', E'Inflige 4 points de dégâts à l''adversaire. Si vous êtes Mage Noir, détruisez TOUS les Permanents.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Seisme.png', 'https://magenoir.com/collection/FR/mineral/Seisme.html', 'fr', 'Séisme'),
('seisme', E'Inflicts 4 damage to the opponent. If you''re a Mage Noir, destroy EVERY Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Earthquake.png', 'https://magenoir.com/collection/EN/mineral/Earthquake.html', 'en', 'Earthquake')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Sirocco
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('sirocco', E'Transmutable : Sable, SoufflePiochez 1 carte.Si vous êtes Mage Noir, renvoyez 1 sort canalisé dans la main de son propriétaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/sirocco.png', 'https://magenoir.com/collection/FR/mineral/Sirocco.html', 'fr', 'Sirocco'),
('sirocco', E'Transmutable: Sand, BreathDraw 1 card.If you''re a Mage Noir, return 1 channeled spell to its owner''s hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/sirocco.png', 'https://magenoir.com/collection/EN/mineral/Sirocco.html', 'en', 'Sirocco')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Vague du désert
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Vague du désert
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('vague du desert', E'Lorsque vous préparez ce sort, déplacez autant de Mana Minéral que vous le souhaitez depuis vos composants Sable sous Vague du désert.Inflige X points de dégâts à n''importe quelle cible.X est égal au nombre de Mana Minéral verrouillée par ce sort.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/vague_du_desert.png', 'https://magenoir.com/collection/FR/mineral/Vague-du-desert.html', 'fr', 'Vague du désert'),
('vague du desert', E'When you prepare this spell, move any amount of Mineral Mana from your Sand components under Desert wave. Inflicts X damage to any target, where X is the amount of Mineral Mana locked under this spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_wave.png', 'https://magenoir.com/collection/EN/mineral/Desert-wave.html', 'en', 'Desert wave')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Volée aiguisée
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Volée aiguisée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('volee aiguisee', E'Vous inflige 1 point de dégâts 5 fois, à moins que vous ne soyez Mage Noir. Inflige 1 point de dégâts à l''adversaire 5 fois.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Volee-aiguisee.png', 'https://magenoir.com/collection/FR/mineral/Volee-aiguisee.html', 'fr', 'Volée aiguisée'),
('volee aiguisee', E'Inflicts 1 damage to you 5 times, unless you''re a Mage Noir. Inflicts 1 damage to the opponent 5 times.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Sharp-volley.png', 'https://magenoir.com/collection/EN/mineral/Sharp-volley.html', 'en', 'Sharp volley')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Volonté de fer
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('volonte de fer', 'mage_noir', '{
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
  "extension": "Le Chien et le Guerrier",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Volonté de fer
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('volonte de fer', E'Rapide (Ce sort peut être activé à tout moment.) 1 sort qui cible 1 Permanent que vous contrôlez n''a pas d''effet ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/volonte_de_fer.png', 'https://magenoir.com/collection/FR/mineral/Volonte-de-fer.html', 'fr', 'Volonté de fer'),
('volonte de fer', E'Quickcast (This spell can be activated at any time.) 1 spell targeting 1 Permanent you control has no effect this turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/iron_will.png', 'https://magenoir.com/collection/EN/mineral/Iron-will.html', 'en', 'Iron will')
ON CONFLICT (card_id, locale) DO NOTHING;

-- Nombre de cartes pour Minéral: 53

--========================================================================================================================
-- Végétal
--========================================================================================================================

--========================================================================================================================
-- Abeille ouvrière
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('abeille ouvriere', 'mage_noir', '{
  "type": "Animal",
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
  "componentCost": [],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Abeille ouvrière
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('abeille ouvriere', E'Le coût en Mana des capacités de cet Animal peut être payé avec la Mana verrouillée sous vos Fleurs. Regardez la carte du dessus de votre deck. Vous pouvez la mettre au dessous de celui-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/abeille_ouvriere.png', 'https://magenoir.com/collection/FR/vegetal/Abeille_ouvriere.html', 'fr', 'Abeille ouvrière'),
('abeille ouvriere', E'The Mana cost of this Animal''s abilities may be paid with Mana locked under your Flowers. Look at the top card of your deck. You may put that card at the bottom of it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/worker_bee.png', 'https://magenoir.com/collection/EN/vegetal/Worker-bee.html', 'en', 'Worker bee')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Achillée de Foloï
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('achillee de foloi', 'mage_noir', '{
  "type": "Permanent",
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
    {"componentName": "Graine", "quantity": 1}
  ],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Achillée de Foloï
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('achillee de foloi', E'Transmutable : "Fleur", sauf si ce Permanent verrouille de la Mana. Au début de votre tour, ce Permanent libère 1 Mana pour vous faire gagner 1 PV. S''il ne libère pas de Mana, il inflige 2 points de dégâts à n''importe quelle cible à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/achillee_de_foloi.png', 'https://magenoir.com/collection/FR/vegetal/Achillee-de-foloi.html', 'fr', 'Achillée de Foloï'),
('achillee de foloi', E'Transmutable: "Flower" unless this Permanent locks Mana. At the beginning of your turn, this Permanent releases 1 Mana to gain you 1 HP. If it does not release Mana, it inflicts 2 damage to any target instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/foloi_yarrow.png', 'https://magenoir.com/collection/EN/vegetal/Foloi-yarrow.html', 'en', 'Foloï yarrow')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Anneau du druide
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Anneau du druide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('anneau du druide', E'Les dégâts infligés par les Permanents Végétaux que vous contrôlez sont augmentés de 2.Si vous êtes Mage Noir, lorsque vous ajoutez de la Mana dans l''Ether disponible au début de votre tour, ajoutez 1 Mana Végétal supplémentaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Anneau-du-druide.png', 'https://magenoir.com/collection/FR/vegetal/Anneau-du-druide.html', 'fr', 'Anneau du druide'),
('anneau du druide', E'Damage inflicted by Vegetal Permanents you control is increased by 2.If you''re a Mage Noir, when you add Mana to the Available Ether at the beginning of your turn, add 1 additional Vegetal Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Druid-ring.png', 'https://magenoir.com/collection/EN/vegetal/Druid-ring.html', 'en', 'Druid ring')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Arbre animé
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Arbre animé
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('arbre anime', E'Lorsqu''il arrive en jeu, défausse la Graine utilisée comme composant.Au début de votre tour, inflige 2 points de dégâts à l''adversaire, puis vous pouvez mettre 1 Graine en préparation depuis votre défausse.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Arbre-anime.png', 'https://magenoir.com/collection/FR/vegetal/Arbre-anime.html', 'fr', 'Arbre animé'),
('arbre anime', E'When put into play, discard the Seed component used to cast it.At the beginning of your turn, inflicts 2 damage to the opponent, then you may put 1 Seed from your discard pile into play prepared.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Animated-tree.png', 'https://magenoir.com/collection/EN/vegetal/Animated-tree.html', 'en', 'Animated tree')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Arbre en flammes
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
    {"componentName": "Arbre", "quantity": 1},
    {"componentName": "Flamme", "quantity": 1}
  ],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Arbre en flammes
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('arbre en flammes', E'Si vous êtes Mage Noir, préparer ce sort nécessite 1 composant de moins.Au début de votre tour, ce Permanent inflige 2 points de dégâts à l''adversaire, puis il perd 1 Point de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Arbre-en-flammes.png', 'https://magenoir.com/collection/FR/vegetal/Arbre-en-flammes.html', 'fr', 'Arbre en flammes'),
('arbre en flammes', E'If you''re a Mage Noir, preparing this spell requires 1 less component.At the beginning of your turn, this Permanent inflicts 2 damage to the opponent, then loses 1 Health Point.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Tree-in-flames.png', 'https://magenoir.com/collection/EN/vegetal/Tree-in-flames.html', 'en', 'Tree in flames')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Arbre mancenillier
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre mancenillier', 'mage_noir', '{
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
    {"componentName": "Graine", "quantity": 1}
  ],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Marjolaine Ganachaud"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Arbre mancenillier
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('arbre mancenillier', E'Au début de votre tour, l''adversaire perd 3 Points de Vie. Puis, vous perdez 3 PV (ou 2 PV si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/arbre_mancenillier.png', 'https://magenoir.com/collection/FR/vegetal/Arbre-mancenillier.html', 'fr', 'Arbre mancenillier'),
('arbre mancenillier', E'At the start of your turn, the opponent loses 3 Health Points. Then, you lose 3 HP (or 2 HP if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/manchineel_tree.png', 'https://magenoir.com/collection/EN/vegetal/Manchineel-tree.html', 'en', 'Manchineel tree')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Arbre mort
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Arbre mort
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('arbre mort', E'Si vous êtes Mage Noir, ce Permanent a Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Arbre-mort.png', 'https://magenoir.com/collection/FR/vegetal/Arbre-mort.html', 'fr', 'Arbre mort'),
('arbre mort', E'If you''re a Mage Noir, this Permanent has Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Dead-tree.png', 'https://magenoir.com/collection/EN/vegetal/Dead-tree.html', 'en', 'Dead tree')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Armure d'écorce
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Armure d'écorce
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('armure d ecorce', E'Chaque tour, ignorez jusqu''à 1 point de dégâts adverses qui vous sont infligés.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Armure-d-ecorce.png', 'https://magenoir.com/collection/FR/vegetal/Armure-d-ecorce.html', 'fr', 'Armure d''écorce'),
('armure d ecorce', E'Each turn, ignore up to 1 inflicted damage you receive from the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Bark-armor.png', 'https://magenoir.com/collection/EN/vegetal/Bark-armor.html', 'en', 'Bark armor')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Armure de druide
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Armure de druide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('armure de druide', E'Chaque tour, ignorez jusqu''à 3 points de dégâts adverses qui vous sont infligés.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Armure-de-druide.png', 'https://magenoir.com/collection/FR/vegetal/Armure-de-druide.html', 'fr', 'Armure de druide'),
('armure de druide', E'Each turn, ignore up to 3 inflicted damage you receive from the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Druid-armor.png', 'https://magenoir.com/collection/EN/vegetal/Druid-armor.html', 'en', 'Druid armor')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Baguette de druide
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Baguette de druide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('baguette de druide', E'Au début de votre tour, inflige 1 point de dégâts par Équipement Druide que vous contrôlez à n''importe quelle cible.Si vous êtes Mage Noir, Baguette de druide ne détruit pas les Équipements qu''elle utilise comme composants, et elle n''est pas détruite lorsqu''un Équipement l''utilise comme composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/baguette_de_druide.png', 'https://magenoir.com/collection/FR/vegetal/Baguette-de-druide.html', 'fr', 'Baguette de druide'),
('baguette de druide', E'At the beginning of your turn, inflicts 1 damage per Druid Equipment you control to any target.If you are a Mage Noir, this piece of Equipment does not destroy Equipment that it uses as a component, and it is not destroyed when used as a component to prepare other Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/druid_wand.png', 'https://magenoir.com/collection/EN/vegetal/Druid-wand.html', 'en', 'Druid wand')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Cerf
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('cerf', 'mage_noir', '{
  "type": "Animal",
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
  "componentCost": [],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Cerf
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('cerf', E'Lorsque vous activez un sort, épuisez cet Animal. Mettez 1 Mana de votre réserve sous cet Animal. Inflige X dégâts à l''adversaire, où X est le nombre de Mana Végétale sous cet Animal. Puis cet Animal libère 2 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/cerf.png', 'https://magenoir.com/collection/FR/vegetal/Cerf.html', 'fr', 'Cerf'),
('cerf', E'When you activate a spell, exhaust this Animal. Put 1 Mana from your reserve under this Animal. Inflicts X damage to the opponent, where X is the amount of Vegetal Mana under this Animal. Then this Animal releases 2 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/deer.png', 'https://magenoir.com/collection/EN/vegetal/Deer.html', 'en', 'Deer')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Champ de tournesols
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Champ de tournesols
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('champ de tournesols', E'Transmutable : FleurLorsqu''il arrive en jeu, allez chercher 1 sort Soleil dans votre deck, montrez-le à votre adversaire, mettez-le dans votre main, puis mélangez votre deck.Vos sorts Soleil coûtent 1 Mana Feu de moins à préparer.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/champ_de_tournesol.png', 'https://magenoir.com/collection/FR/vegetal/Champ-de-tournesols.html', 'fr', 'Champ de tournesols'),
('champ de tournesols', E'Transmutable : FlowerWhen put into play, take 1 Sun card from your deck, show it to the opponent, put it into your hand and shuffle your deck.Your Sun spells cost 1 less Fire Mana to prepare.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/sunflower_field.png', 'https://magenoir.com/collection/EN/vegetal/Sunflower-field.html', 'en', 'Sunflower field')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Cornes de druide
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Cornes de druide
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('cornes de druide', E'A tout moment, vous pouvez regarder la carte du dessus de votre deck. Si c''est une Graine, montrez-la à votre adversaire et mettez-la dans votre main.Vos Graines coûtent 1 Mana Végétal de moins. Si vous êtes Mage Noir, vos Graines coûtent 0 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Cornes-de-druide.png', 'https://magenoir.com/collection/FR/vegetal/Cornes-de-druide.html', 'fr', 'Cornes de druide'),
('cornes de druide', E'At any time, you may look at the top card of your deck. If it''s a Seed, show it to your opponent and put it into your hand.Your Seeds cost 1 less Vegetal Mana. If you''re a Mage Noir, your Seeds cost 0 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Druid-horns.png', 'https://magenoir.com/collection/EN/vegetal/Druid-horns.html', 'en', 'Druid horns')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Couronne verdoyante
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('couronne verdoyante', 'mage_noir', '{
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
    {"componentName": "Cerf", "quantity": 1}
  ],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Johann Goutard"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Couronne verdoyante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('couronne verdoyante', E'Exilez 3 Arbres de votre défausse (ou 2 si vous êtes Mage Noir) pour préparer 1 Forêt sans payer son coût et sans les composants requis. Exilez votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/couronne_verdoyante.png', 'https://magenoir.com/collection/FR/vegetal/Couronne-verdoyante.html', 'fr', 'Couronne verdoyante'),
('couronne verdoyante', E'Exile 3 Trees from your discard pile (or 2 if you''re a Mage Noir) to prepare 1 Forest without paying its costs and without the required components. Exile your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/verdant_crown.png', 'https://magenoir.com/collection/EN/vegetal/Verdant-crown.html', 'en', 'Verdant crown')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Croissance de fleur
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Croissance de fleur
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('croissance de fleur', E'La cible de votre choix gagne 2 PV.Regardez les 3 cartes du dessus de votre deck. Vous pouvez choisir 1 carte Fleur parmi celles-ci, la montrer à votre adversaire, puis la mettre dans votre main. Mettez le reste au dessous de votre deck dans l''ordre de votre choix.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/croissance_de_fleurs.png', 'https://magenoir.com/collection/FR/vegetal/Croissance-de-fleur.html', 'fr', 'Croissance de fleur'),
('croissance de fleur', E'Any target gains 2 HP.Look at the top 3 cards of your deck. You may take 1 Flower card from them, show it to the opponent and then put it in your hand.Put the rest at the bottom of your deck in any order.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/flower_growth.png', 'https://magenoir.com/collection/EN/vegetal/Flower-growth.html', 'en', 'Flower growth')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Distillation de sève
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Distillation de sève
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('distillation de seve', E'Prenez 3 Mana de votre choix dans l''Éther Infini (ou 4 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/distillation_de_seve.png', 'https://magenoir.com/collection/FR/vegetal/Distillation-de-seve.html', 'fr', 'Distillation de sève'),
('distillation de seve', E'Take 3 Mana of your choice from the Infinite Ether (or 4 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/sap_distillation.png', 'https://magenoir.com/collection/EN/vegetal/Sap-distillation.html', 'en', 'Sap distillation')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Essaim bourdonnant
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('essaim bourdonnant', 'mage_noir', '{
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
    {"componentName": "Abeille", "quantity": 2}
  ],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Essaim bourdonnant
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('essaim bourdonnant', E'Exilez toutes vos Abeilles Ouvrières. L''adversaire perd 2 Points de Vie pour chaque Abeille exilée de cette manière.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/essaim_bourdonnant.png', 'https://magenoir.com/collection/FR/vegetal/Essaim-bourdonnant.html', 'fr', 'Essaim bourdonnant'),
('essaim bourdonnant', E'Exile all of your Worker bees. The opponent loses 2 Health Points for each Bee exiled this way.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/buzzing_swarm.png', 'https://magenoir.com/collection/EN/vegetal/Buzzing-swarm.html', 'en', 'Buzzing swarm')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flèche d'Artémis
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleche d artemis', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 6,
    "manaVegetal": 4,
    "manaFeu": 1,
    "manaAir": 0,
    "manaEau": 0,
    "manaMineral": 0,
    "manaArcane": 1
  },
  "components": [],
  "componentCost": [
    {"componentName": "Ronce", "quantity": 1}
  ],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Jessica Heran"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flèche d'Artémis
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleche d artemis', E'Lent L''adversaire défausse 1 carte de sa main. Inflige 6 points de dégâts à l''adversaire. Si vous êtes Mage Noir, ils ne peuvent pas être ignorés, réduits, ni redirigés.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleche_d_artemis.png', 'https://magenoir.com/collection/FR/vegetal/Fleche-d-artemis.html', 'fr', 'Flèche d''Artémis'),
('fleche d artemis', E'Slowcast The opponent discards 1 card from hand. Inflicts 6 damage to the opponent. If you''re a Mage Noir, this damage cannot be ignored, reduced, or redirected.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/artemis_s_arrow.png', 'https://magenoir.com/collection/EN/vegetal/Artemis-s-arrow.html', 'en', 'Artemis''s arrow')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Flèche echo
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleche echo', 'mage_noir', '{
  "type": "Sort",
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
  "componentCost": [],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Flèche echo
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleche echo', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé.) Vous pouvez préparer Flèche écho depuis l''exil. Inflige 1 point de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleche_echo.png', 'https://magenoir.com/collection/FR/vegetal/Fleche-echo.html', 'fr', 'Flèche echo'),
('fleche echo', E'Slowcast (This spell can''t be activated on the turn it was prepared.) You may prepare Echo arrow from exile. Inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/echo_arrow.png', 'https://magenoir.com/collection/EN/vegetal/Echo-arrow.html', 'en', 'Echo arrow')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Fleur de Kerloc'h
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
    {"componentName": "Graine", "quantity": 1},
    {"componentName": "Fleur", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Fleur de Kerloc'h
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleur de kerloc h', E'Unique, sauf si vous êtes Mage Noir.Au début de votre tour, inflige 2 points de dégâts à l''adversaire, puis ce permanent gagne 1 PV (ou 2 si vous contrôlez au moins 4 composants Goutte).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleur_de_kerloc_h.png', 'https://magenoir.com/collection/FR/vegetal/Fleur-de-kerloc-h.html', 'fr', 'Fleur de Kerloc''h'),
('fleur de kerloc h', E'Unique, unless you''re a Mage Noir.At the beginning of your turn, inflicts 2 damage to the opponent, then this Permanent gains 1 HP (or 2 if you control at least 4 Drop components).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/kerloch_s_flower.png', 'https://magenoir.com/collection/EN/vegetal/Kerloc-h-s-flower.html', 'en', 'Kerloc''h''s flower')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Fleur fractale
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Fleur fractale
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleur fractale', E'Au début de votre tour, inflige 1 point de dégâts à l''adversaire, puis, si vous êtes Mage Noir, choisissez une carte Fleur dans votre défausse et mettez-la dans votre main.Automne (Lorsqu''il est détruit, ce Permanent applique ses effets de début de tour )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleur_fractale.png', 'https://magenoir.com/collection/FR/vegetal/Fleur-fractale.html', 'fr', 'Fleur fractale'),
('fleur fractale', E'At the beginning of your turn, inflicts 1 damage to the opponent, then, if you''re a Mage Noir, return 1 Flower spell from your discard pile to your hand.Autumn (When it is destroyed, this Permanent applies its start-of-turn effects)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/fractal_flower.png', 'https://magenoir.com/collection/EN/vegetal/Fractal-flower.html', 'en', 'Fractal flower')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Fleur hypnotique
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Fleur hypnotique
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleur hypnotique', E'Votre adversaire perd 2 Points de Vie (ou 3 si vous êtes Mage Noir).Votre adversaire pioche 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleur_hypnotique.png', 'https://magenoir.com/collection/FR/vegetal/Fleur-hypnotique.html', 'fr', 'Fleur hypnotique'),
('fleur hypnotique', E'The opponent loses 2 HP (or 3 if you''re a Mage Noir).The opponent draws 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/hypnotic_flower.png', 'https://magenoir.com/collection/EN/vegetal/Hypnotic-flower.html', 'en', 'Hypnotic flower')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Fleurs d'arbre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Fleurs d'arbre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleurs d arbre', E'Chaque Permanent Végétal que vous contrôlez libère 1 Mana Végétal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleurs_d_arbre.png', 'https://magenoir.com/collection/FR/vegetal/Fleurs-d-arbre.html', 'fr', 'Fleurs d''arbre'),
('fleurs d arbre', E'Each Vegetal Permanent you control releases 1 Vegetal Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/tree_flowers.png', 'https://magenoir.com/collection/EN/vegetal/Tree-flowers.html', 'en', 'Tree flowers')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Fleurs de ronces
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Fleurs de ronces
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('fleurs de ronces', E'Lorsqu''un Permanent avec des PV que vous contrôlez subit des dégâts, inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleurs_de_ronces.png', 'https://magenoir.com/collection/FR/vegetal/Fleurs-de-ronces.html', 'fr', 'Fleurs de ronces'),
('fleurs de ronces', E'When a Permanent with HP you control takes damage, inflicts 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/bramble_flowers.png', 'https://magenoir.com/collection/EN/vegetal/Bramble-flowers.html', 'en', 'Bramble flowers')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Floraison létale
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Floraison létale
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('floraison letale', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )L''adversaire perd 5 PV.Défaussez 1 composant Fleur que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/floraison_letale.png', 'https://magenoir.com/collection/FR/vegetal/Floraison-letale.html', 'fr', 'Floraison létale'),
('floraison letale', E'Slowcast (This spell can''t be activated on the turn it was prepared) The opponent loses 5 HP.Discard 1 Flower component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/lethal_flourish.png', 'https://magenoir.com/collection/EN/vegetal/Lethal-flourish.html', 'en', 'Lethal flourish')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Forêt de ronces
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('foret de ronces', 'mage_noir', '{
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
    {"componentName": "Ronce", "quantity": 1}
  ],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Midas_Wails"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Forêt de ronces
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('foret de ronces', E'Lorsqu''un joueur défausse 1 carte depuis sa main, il perd 1 PV. Au début de votre tour, si vous contrôlez au moins 3 composants Ronces, l''adversaire défausse 1 carte de sa main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/foret_de_ronces.png', 'https://magenoir.com/collection/FR/vegetal/Foret-de-ronces.html', 'fr', 'Forêt de ronces'),
('foret de ronces', E'When the opponent discards 1 card from hand, they lose 1 HP. At the beginning of your turn, if you control at least 3 Bramble components, the opponent discards 1 card from hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/bramble_forest.png', 'https://magenoir.com/collection/EN/vegetal/Bramble-forest.html', 'en', 'Bramble forest')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Forêt enchantée
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Forêt enchantée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('foret enchantee', E'Au début de votre tour, vous et vos Permanents Végétaux qui ont des Points de Vie gagnez 2 Points de Vie.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Foret-enchantee.png', 'https://magenoir.com/collection/FR/vegetal/Foret-enchantee.html', 'fr', 'Forêt enchantée'),
('foret enchantee', E'At the beginning of your turn, you and your Vegetal Permanents with Health Points gain 2 HP.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Enchanted-forest.png', 'https://magenoir.com/collection/EN/vegetal/Enchanted-forest.html', 'en', 'Enchanted Forest')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Forêt hostile
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Forêt hostile
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('foret hostile', E'Au début de votre tour, inflige X points de dégâts à n''importe quelle cible, X étant les Points de Vie actuels de ce Permanent.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Foret-hostile.png', 'https://magenoir.com/collection/FR/vegetal/Foret-hostile.html', 'fr', 'Forêt hostile'),
('foret hostile', E'At the beginning of your turn, inflicts X damage to any target, where X is the current Health Points of this Permanent.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Hostile-forest.png', 'https://magenoir.com/collection/EN/vegetal/Hostile-forest.html', 'en', 'Hostile forest')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Graine
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('graine', E'Vous gagnez 1 Point de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Graine.png', 'https://magenoir.com/collection/FR/vegetal/Graine.html', 'fr', 'Graine'),
('graine', E'You gain 1 Health Point.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Seed.png', 'https://magenoir.com/collection/EN/vegetal/seed.html', 'en', 'Seed')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Graine bourgeonnante
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Graine bourgeonnante
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('graine bourgeonnante', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Allez chercher 1 carte Fleur dans votre deck, montrez-la à votre adversaire, mettez-la dans votre main, puis mélangez votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/graine_bourgeonnante.png', 'https://magenoir.com/collection/FR/vegetal/Graine-bourgeonnante.html', 'fr', 'Graine bourgeonnante'),
('graine bourgeonnante', E'Slowcast (This spell can''t be activated on the turn it was prepared) Take 1 Flower card from your deck, show it to the opponent, put it into your hand and shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/budding_seed.png', 'https://magenoir.com/collection/EN/vegetal/Budding-seed.html', 'en', 'Budding seed')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Graine germée
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Graine germée
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('graine germee', E'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.)Allez chercher 1 carte Arbre dans votre deck, montrez-la à votre adversaire, mettez-la dans votre main, puis mélangez votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Graine-germee.png', 'https://magenoir.com/collection/FR/vegetal/Graine-germee.html', 'fr', 'Graine germée'),
('graine germee', E'Transmutable : Drop (This spell can be used as a Drop component.)Take 1 Tree card from your deck, show it to the opponent, put it into your hand and shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Sprouted-seed.png', 'https://magenoir.com/collection/EN/vegetal/Sprouted-seed.html', 'en', 'Sprouted seed')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Infusion florale
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
    {"componentName": "Fleur", "quantity": 1},
    {"componentName": "Goutte", "quantity": 1}
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Infusion florale
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('infusion florale', E'Tant que ce sort est en préparation, au début de votre tour, mettez 1 Mana Végétal de l''Éther Infini sous ce sort.Lorsque vous l''activez, piochez X cartes, où X est le nombre de Mana verrouillées par ce sort. X ne peut être supérieur au nombre de composants Gouttes que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/infusion_florale.png', 'https://magenoir.com/collection/FR/vegetal/Infusion-florale.html', 'fr', 'Infusion florale'),
('infusion florale', E'While in preparation:At the start of your turn, lock 1 Vegetal Mana from the Infinite Ether under this spell.When activated, draw X cards, where X is the amount of Mana this spell locks. X can''t be more than the number of Drop components you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/floral_infusion.png', 'https://magenoir.com/collection/EN/vegetal/Floral-infusion.html', 'en', 'Floral infusion')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- La guérisseuse sylvestre
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour La guérisseuse sylvestre
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('la guerisseuse sylvestre', E'Choisissez 1 option :- Le Permanent Végétal avec des Points de Vie ciblé gagne 4 Points de Vie.- Vous gagnez 3 Points de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/La-guerisseuse-sylvestre.png', 'https://magenoir.com/collection/FR/vegetal/La-guerisseuse-sylvestre.html', 'fr', 'La guérisseuse sylvestre'),
('la guerisseuse sylvestre', E'Choose 1 option:-Target Vegetal Permanent with Health Points gains 4 HP.-You gain 3 HP.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/The-sylvan-healer.png', 'https://magenoir.com/collection/EN/vegetal/The-sylvan-healer.html', 'en', 'The sylvan healer')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Pétales tranchants
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Pétales tranchants
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('petales tranchants', E'Inflige 3 points de dégâts à n''importe quelle cible.Inflige 2 points de dégâts à un Permanent Végétal que vous contrôlez (ou 1 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/petales_tranchants.png', 'https://magenoir.com/collection/FR/vegetal/Petales-tranchants.html', 'fr', 'Pétales tranchants'),
('petales tranchants', E'Inflicts 3 damage to any target.Inflicts 2 damage to a Vegetal Permanent you control (or 1 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/sharp_petals.png', 'https://magenoir.com/collection/EN/vegetal/Sharp-petals.html', 'en', 'Sharp petals')
ON CONFLICT (card_id, locale) DO NOTHING;

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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Photosynthese
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('photosynthese', E'Rapide (Ce sort peut être activé à tout moment )1 Permanent Végétal que vous contrôlez gagne 2 PV.Si vous contrôlez un composant Soleil, il gagne 2 PV de plus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/photosynthese.png', 'https://magenoir.com/collection/FR/vegetal/Photosynthese.html', 'fr', 'Photosynthese'),
('photosynthese', E'Quickcast (This spell can be activated at any time) 1 Vegetal Permanent you control gains 2 HP.If you control a Sun component, it gains 2 additional HP.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/photosynthesis.png', 'https://magenoir.com/collection/EN/vegetal/Photosynthesis.html', 'en', 'Photosynthesis')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Piège de lianes
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('piege de lianes', 'mage_noir', '{
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
  "extension": "Le Cerf et l''Archère",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Piège de lianes
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('piege de lianes', E'Lorsque l''adversaire gagne une carte en main en dehors de sa phase de pioche, libérez une Mana Végétale de Piège de lianes pour que l''adversaire défausse cette carte. Détruisez Piège de lianes dès qu''il ne verrouille plus de Mana Végétale.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/piege_de_lianes.png', 'https://magenoir.com/collection/FR/vegetal/Piege-de-lianes.html', 'fr', 'Piège de lianes'),
('piege de lianes', E'When the opponent adds cards to their hand outside their draw phase, release one Vegetal Mana from Vine trap to have them discard it. Destroy Vine trap as soon as there''s no Vegetal Mana locked under it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/vine_trap.png', 'https://magenoir.com/collection/EN/vegetal/Vine-trap.html', 'en', 'Vine trap')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rappel d'animal
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rappel d animal', 'mage_noir', '{
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
  "extension": "Le Cerf et l''Archère",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rappel d'animal
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rappel d animal', E'Ne peut être préparé que par un Mage Noir. Mettez votre Animal en jeu, depuis n''importe où. Régénérez votre Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/rappel_animal.png', 'https://magenoir.com/collection/FR/vegetal/Rappel-d-animal.html', 'fr', 'Rappel d''animal'),
('rappel d animal', E'Can only be prepared by a Mage Noir. Put your Animal into play, wherever it is. Rest your Animal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/animal_recall.png', 'https://magenoir.com/collection/EN/vegetal/Animal-recall.html', 'en', 'Animal recall')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Reine abeille
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('reine abeille', 'mage_noir', '{
  "type": "Animal",
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
  "componentCost": [],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Jeffrey Jeanson"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Reine abeille
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('reine abeille', E'Vous pouvez contrôler jusqu''à quatre Abeilles. Mettez 1 Abeille ouvrière en jeu, sous votre contrôle.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/reine_abeille.png', 'https://magenoir.com/collection/FR/vegetal/Reine_abeille.html', 'fr', 'Reine abeille'),
('reine abeille', E'You may control up to four Bees. Put 1 Worker bee in play, under your control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/queen_bee.png', 'https://magenoir.com/collection/EN/vegetal/Queen-bee.html', 'en', 'Queen bee')
ON CONFLICT (card_id, locale) DO NOTHING;

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
  "componentCost": [],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Renouveau
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('renouveau', E'Si vous êtes Mage Noir, ce sort gagne: "Rapide" (Ce sort peut être activé à tout moment)Détruisez un Permanent Végétal.À la fin de ce tour, remettez-le en jeu depuis la défausse.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/renouveau.png', 'https://magenoir.com/collection/FR/vegetal/Renouveau.html', 'fr', 'Renouveau'),
('renouveau', E'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Destroy a Vegetal Permanent. At the end of the turn, put it back into play from the discard pile.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/renewal.png', 'https://magenoir.com/collection/EN/vegetal/Renewal.html', 'en', 'Renewal')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel de décomposition
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel de décomposition
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel de decomposition', E'Vous passez Mage Noir.Au début de votre tour, perdez 1 Point de Vie.Durant votre phase principale, vous pouvez détruire 1 Permanent que vous contrôlez pour infliger un montant de dégâts égal à ses Points de Vie à n''importe quelle cible.(Vous pouvez le faire plusieurs fois par tour)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Rituel-de-decomposition.png', 'https://magenoir.com/collection/FR/vegetal/Rituel-de-decomposition.html', 'fr', 'Rituel de décomposition'),
('rituel de decomposition', E'You become a Mage Noir.At the beginning of your turn, you lose 1 Health Point.During your main phase, you may destroy 1 Permanent you control to inflict damage equal to its HP to any target.(You may do this multiple times per turn.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Ritual-of-decomposition.png', 'https://magenoir.com/collection/EN/vegetal/Ritual-of-decomposition.html', 'en', 'Ritual of decomposition')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel de l'hermite
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel de l hermite', 'mage_noir', '{
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
  "extension": "Le Cerf et l''Archère",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel de l'hermite
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel de l hermite', E'Vous passez Mage Noir. Lorsqu''un sort entre dans votre défausse, payez 1 Mana Végétale pour gagner 1 Point de Vie. Si vous ne le faites pas, exilez le sort défaussé.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/rituel_de_l_hermite.png', 'https://magenoir.com/collection/FR/vegetal/Rituel-de-l-hermite.html', 'fr', 'Rituel de l''hermite'),
('rituel de l hermite', E'You become a Mage Noir. Whenever a spell enters your discard pile, pay 1 Vegetal Mana to gain 1 Health Point. If you don''t, exile the discarded spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/hermit_ritual.png', 'https://magenoir.com/collection/EN/vegetal/Hermit-ritual.html', 'en', 'Hermit ritual')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Rituel des saisons
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Rituel des saisons
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('rituel des saisons', E'Vous passez Mage Noir.Lorsque ce sort arrive en jeu, vos Permanents Végétaux perdent 1 PV.Durant votre phase principale, vous pouvez faire perdre 1 PV à un Permanent que vous contrôlez, puis celui-ci gagne : "Automne". (Lorsqu''il est détruit, ce Permanent applique ses effets de début de tour )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/rituel_des_saisons.png', 'https://magenoir.com/collection/FR/vegetal/Rituel-des-saisons.html', 'fr', 'Rituel des saisons'),
('rituel des saisons', E'You become a Mage Noir.When put into play, your Vegetal Permanents lose 1 HP.During your main phase, you may have a Permanent you control lose 1 HP, then it gains: "Autumn". (When it is destroyed, this Permanent applies its start-of-turn effects)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/ritual_of_seasons.png', 'https://magenoir.com/collection/EN/vegetal/Ritual-of-seasons.html', 'en', 'Ritual of seasons')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Robe de Kerloc'h
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Robe de Kerloc'h
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('robe de kerloch', E'Les dégâts des sorts Végétaux (dont Permanents) que vous contrôlez sont augmentés de 3.Les dégâts qui vous sont infligés sont réduits de 2.A tout moment, vous pouvez détruire cet Équipement et défausser toute votre main pour annuler les dégâts qui vous sont infligés jusqu''à la fin du tour.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Robe-de-kerloch.png', 'https://magenoir.com/collection/FR/vegetal/Robe-de-kerloch.html', 'fr', 'Robe de Kerloc''h'),
('robe de kerloch', E'Damage from Vegetal spells you control (Permanents included) is increased by 3.Inflicted damage you take is reduced by 2.At any time, you may sacrifice this Equipment and discard your hand to prevent all damage you would take until the end of the turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/kerlochs-robe.png', 'https://magenoir.com/collection/EN/vegetal/Kerlochs-robe.html', 'en', 'Kerloc''h''s robe')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Roi des arbres
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Roi des arbres
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('roi des arbres', E'Unique (Vous ne pouvez contrôler qu''un seul exemplaire de cette carte)Au début de votre tour, inflige 2 points de dégâts à l''adversaire pour chaque Arbre sur le plateau.Si vous êtes Mage Noir, vos autres Arbres appliquent leurs effets 1 fois de plus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Roi-des-arbres.png', 'https://magenoir.com/collection/FR/vegetal/Roi-des-arbres.html', 'fr', 'Roi des arbres'),
('roi des arbres', E'Unique (You may only control one copy of this card)At the beginning of your turn, inflicts 2 damage to the opponent for every Tree in play.If you''re a Mage Noir, your other Trees apply their effects 1 more time.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/King_of_trees.png', 'https://magenoir.com/collection/EN/vegetal/King-of-trees.html', 'en', 'King of Trees')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Ronces éphémères
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Ronces éphémères
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('ronces ephemeres', E'L''adversaire choisit 1 option :- Il défausse 1 carte de sa main- Il perd 3 Points de Vie', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Ronces-ephemeres.png', 'https://magenoir.com/collection/FR/vegetal/Ronces-ephemeres.html', 'fr', 'Ronces éphémères'),
('ronces ephemeres', E'The opponent chooses 1 option:- They discard 1 card in hand.- They lose 3 Health Points.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Ephemeral-brambles.png', 'https://magenoir.com/collection/EN/vegetal/Ephemeral-brambles.html', 'en', 'Ephemeral brambles')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Saule de Foloï
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('saule de foloi', 'mage_noir', '{
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
  "componentCost": [
    {"componentName": "Graine", "quantity": 1}
  ],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Alicia Lasaga"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Saule de Foloï
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('saule de foloi', E'Transmutable : "Arbre", sauf si ce Permanent verrouille de la Mana. Au début de votre tour, ce Permanent libère 1 Mana pour gagner 1 PV. S''il ne libère pas de Mana, il inflige 3 points de dégâts à n''importe quelle cible à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/saule_de_foloi.png', 'https://magenoir.com/collection/FR/vegetal/Saule-de-foloi.html', 'fr', 'Saule de Foloï'),
('saule de foloi', E'Transmutable: "Tree" unless this Permanent locks Mana. At the beginning of your turn, this Permanent releases 1 Mana to gain 1 HP. If it does not release Mana, it inflicts 3 damage to any target instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/foloi_willow.png', 'https://magenoir.com/collection/EN/vegetal/Foloi-willow.html', 'en', 'Foloï willow')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Semée prodigieuse
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Semée prodigieuse
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('semee prodigieuse', E'Tant que ce Permanent est en jeu, jusqu''à 3 composants Graine que vous contrôlez ont : "Transmutable : Arbre" (Ce sort est utilisable comme composant Arbre.)Au début de votre tour, payez 1 Mana Végétal et 1 Mana Eau ou détruisez Semée prodigieuse.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Semee-prodigieuse.png', 'https://magenoir.com/collection/FR/vegetal/Semee-prodigieuse.html', 'fr', 'Semée prodigieuse'),
('semee prodigieuse', E'As long as this Permanent is in play, up to 3 Seed components you control have Transmutable : Tree (This spell can be used as a Tree component.)At the beginning of your turn, pay 1 Vegetal Mana and 1 Water Mana or destroy Prodigious sowing.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Prodigious-sowing.png', 'https://magenoir.com/collection/EN/vegetal/Prodigious-sowing.html', 'en', 'Prodigious sowing')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Serment d'Artémis
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('serment d artemis', 'mage_noir', '{
  "type": "Équipement : Arme",
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
  "componentCost": [],
  "extension": "Le Cerf et l''Archère",
  "artwork": "Aurelien Segeat"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Serment d'Artémis
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('serment d artemis', E'Les effets de dégâts de vos sorts Flèches sont augmentés de 1. Si vous êtes Mage Noir, vos sorts Flèches ne peuvent pas avoir "Lent".', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/serment_d_artemis.png', 'https://magenoir.com/collection/FR/vegetal/Serment-d-artemis.html', 'fr', 'Serment d''Artémis'),
('serment d artemis', E'Damage from Arrow spells you control is increased by 1. If you''re a Mage Noir, your Arrow spells cannot have "Slowcast".', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/artemis_s_oath.png', 'https://magenoir.com/collection/EN/vegetal/Artemis-s-oath.html', 'en', 'Artemis''s oath')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Taille gigantesque
--========================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('taille gigantesque', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
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
  "extension": "Le Cerf et l''Archère",
  "artwork": "Yannis Vannod"
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Taille gigantesque
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('taille gigantesque', E'Les coûts en Mana des capacités actives de votre Animal sont doublés. Leurs effets s''appliquent 2 fois.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/taille_gigantesque.png', 'https://magenoir.com/collection/FR/vegetal/Taille-gigantesque.html', 'fr', 'Taille gigantesque'),
('taille gigantesque', E'The Mana costs of your Animal''s active abilities are doubled. Their effects are applied 2 times.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/gigantic_size.png', 'https://magenoir.com/collection/EN/vegetal/Gigantic-size.html', 'en', 'Gigantic size')
ON CONFLICT (card_id, locale) DO NOTHING;

--========================================================================================================================
-- Tourment d'épines
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
}')
ON CONFLICT (id) DO NOTHING;

-- Localisations pour Tourment d'épines
INSERT INTO public.card_localization
(card_id, description, image_url, card_url, locale, "name")
VALUES
('tourment d epines', E'Si l''adversaire a pioché plus d''1 carte ce tour-ci, ce sort est Rapide. (Ce sort peut être activé à tout moment )L''adversaire peut défausser autant de cartes de sa main qu''il le souhaite.Puis ce sort lui inflige 1 point de dégâts par carte qu''il a en main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/tourment_d_epines.png', 'https://magenoir.com/collection/FR/vegetal/Tourment-d-epines.html', 'fr', 'Tourment d''épines'),
('tourment d epines', E'If the opponent drew more than 1 card this turn, this spell has Quickcast. (This spell can be activated at any time) The opponent may discard any number of cards from hand.Then, this spell inflicts 1 damage to them per card they have in hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/thorn_torment.png', 'https://magenoir.com/collection/EN/vegetal/Thorn-torment.html', 'en', 'Thorn torment')
ON CONFLICT (card_id, locale) DO NOTHING;

-- Nombre de cartes pour Végétal: 50

--========================================================================================================================
-- TOTAL GÉNÉRAL: 301 cartes
--========================================================================================================================