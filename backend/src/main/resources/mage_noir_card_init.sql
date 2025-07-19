-- Delete CardLocalizarion
DELETE FROM card_localization
WHERE card_id IN (
  SELECT id FROM card WHERE game_id = 'mage_noir'
);

-- Delete Card
DELETE FROM card
WHERE game_id = 'mage_noir';

--======================================================================================================================
-- Végétal
--======================================================================================================================

--======================================================================================================================
-- Graine
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 1,
    "manaVegetal": 1
  },
  "components" : ["graine"],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Graine
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('graine', E'Vous gagnez 1 Point de Vie.', 'https://magenoir.com/cards/FR/Vegetal/Graine.png', 'fr', 'Graine'),
('graine', E'You gain 1 Health Point.', 'https://magenoir.com/cards/EN/vegetal/Seed.png', 'en', 'Seed');


--======================================================================================================================
-- Graine germée
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine germée', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaEau": 1
  },
  "components" : ["graine"],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Graine germée
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('graine germée', E'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.)\nAllez chercher 1 carte Arbre dans votre deck, montrez-la à votre adversaire, mettez-la dans votre main, puis mélangez votre deck.', 'https://magenoir.com/cards/FR/Vegetal/Graine-germee.png', 'fr', 'Graine germée'),
('graine germée', E'Transmutable : Drop (This spell can be used as a Drop component.)\nTake 1 Tree card from your deck, show it to the opponent, put it into your hand and shuffle your deck.', 'https://magenoir.com/cards/EN/vegetal/Sprouted-seed.png', 'en', 'Sprouted seed');

--======================================================================================================================
-- Arbre animé
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre animé', 'mage_noir', '{
  "type": "Permanent",
  "pv": 3,
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 3,
    "manaEau": 1
  },
  "components" : ["arbre"],
  "componentCost": [
    {
        "componentName": "graine",
        "quantity": 1
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Arbre animé
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arbre animé', E'Lorsqu\'il arrive en jeu, défausse la Graine utilisée comme composant.\nAu début de votre tour, inflige 2 points de dégâts à l\'adversaire, puis vous pouvez mettre 1 Graine en préparation depuis votre défausse.\nProtecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://magenoir.com/cards/FR/Vegetal/Arbre-anime.png', 'fr', 'Arbre animé'),
('arbre animé', E'When put into play, discard the Seed component used to cast it.\nAt the beginning of your turn, inflicts 2 damage to the opponent, then you may put 1 Seed from your discard pile into play prepared.\nProtector (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/vegetal/Animated-tree.png', 'en', 'Animated tree');

--======================================================================================================================
-- Arbre mort
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre mort', 'mage_noir', '{
  "type": "Permanent",
  "pv": 2,
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2
  },
  "components" : ["arbre"],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Arbre mort
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arbre mort', E'Si vous êtes Mage Noir, ce Permanent a Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://magenoir.com/cards/FR/Vegetal/Arbre-mort.png', 'fr', 'Arbre mort'),
('arbre mort', E'If you\'re a Mage Noir, this Permanent has Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/vegetal/Dead-tree.png', 'en', 'Dead tree');

--======================================================================================================================
-- Roi des arbres
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('roi des arbres', 'mage_noir', '{
  "type": "Permanent",
  "pv": 5,
  "element": "Végétal",
  "manaCost": {
    "total": 5,
    "manaVegetal": 5
  },
  "components" : ["arbre"],
  "componentCost": [
    {
        "componentName": "arbre",
        "quantity": 1
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Roi des arbres
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('roi des arbres', E'Unique (Vous ne pouvez contrôler qu\'un seul exemplaire de cette carte)\nAu début de votre tour, inflige 2 points de dégâts à l\'adversaire pour chaque Arbre sur le plateau.\nSi vous êtes Mage Noir, vos autres Arbres appliquent leurs effets 1 fois de plus.', 'https://magenoir.com/cards/FR/Vegetal/Roi-des-arbres.png', 'fr', 'Roi des arbres'),
('roi des arbres', E'Unique (You may only control one copy of this card)\nAt the beginning of your turn, inflicts 2 damage to the opponent for every Tree in play.\nIf you\'re a Mage Noir, your other Trees apply their effects 1 more time.', 'https://magenoir.com/cards/EN/vegetal/King_of_trees.png', 'en', 'King of trees');

--======================================================================================================================
-- Arbre en flammes
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('arbre en flammes', 'mage_noir', '{
  "type": "Permanent",
  "pv": 3,
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
	"manaFeu": 1
  },
  "components" : ["arbre", "flamme"],
  "componentCost": [
    {
        "componentName": "arbre",
        "quantity": 1
    },
	{
        "componentName": "flamme",
        "quantity": 1
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Nicolas Camiade"
}');

-- Localisations pour Arbre en flammes
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('arbre en flammes', E'Si vous êtes Mage Noir, préparer ce sort nécessite 1 composant de moins.\nAu début de votre tour, ce Permanent inflige 2 points de dégâts à l\'adversaire, puis il perd 1 Point de Vie.', 'https://magenoir.com/cards/FR/Vegetal/Arbre-en-flammes.png', 'fr', 'Arbre en flammes'),
('arbre en flammes', E'If you\'re a Mage Noir, preparing this spell requires 1 less component.\nAt the beginning of your turn, this Permanent inflicts 2 damage to the opponent, then loses 1 Health Point.', 'https://magenoir.com/cards/EN/vegetal/Tree-in-flames.png', 'en', 'Tree in flames');

--======================================================================================================================
-- Forêt enchantée
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('forêt enchantée', 'mage_noir', '{
  "type": "Permanent",
  "pv": 4,
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
	"manaEau": 2
  },
  "components" : ["forêt"],
  "componentCost": [
    {
        "componentName": "arbre",
        "quantity": 2
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Forêt enchantée
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('forêt enchantée', E'Au début de votre tour, vous et vos Permanents Végétaux qui ont des Points de Vie gagnez 2 Points de Vie.\nProtecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://magenoir.com/cards/FR/Vegetal/Foret-enchantee.png', 'fr', 'Forêt enchantée'),
('forêt enchantée', E'At the beginning of your turn, you and your Vegetal Permanents with Health Points gain 2 HP.\nProtector (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/vegetal/Enchanted-forest.png', 'en', 'Enchanted forest');

--======================================================================================================================
-- Forêt hostile
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('forêt hostile', 'mage_noir', '{
  "type": "Permanent",
  "pv": 10,
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 3,
	"manaMineral": 1
  },
  "components" : ["forêt"],
  "componentCost": [
    {
        "componentName": "arbre",
        "quantity": 3
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Forêt hostile
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('forêt hostile', E'Au début de votre tour, inflige X points de dégâts à n\'importe quelle cible, X étant les Points de Vie actuels de ce Permanent.\nProtecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent)', 'https://magenoir.com/cards/FR/Vegetal/Foret-hostile.png', 'fr', 'Forêt hostile'),
('forêt hostile', E'At the beginning of your turn, inflicts X damage to any target, where X is the current Health Points of this Permanent.\nProtector (You may redirect damage the opponent controls onto this Permanent)', 'https://magenoir.com/cards/EN/vegetal/Hostile-forest.png', 'en', 'Hostile forest');

--======================================================================================================================
-- Semée prodigieuse
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('semée prodigieuse', 'mage_noir', '{
  "type": "Permanent",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
	"manaEau": 1
  },
  "components" : [],
  "componentCost": [
    {
        "componentName": "graine",
        "quantity": 1
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Camille Forcade"
}');

-- Localisations pour Semée prodigieuse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('semée prodigieuse', E'Tant que ce Permanent est en jeu, jusqu\'à 3 composants Graine que vous contrôlez ont : "Transmutable : Arbre" (Ce sort est utilisable comme composant Arbre.)\nAu début de votre tour, payez 1 Mana Végétal et 1 Mana Eau ou détruisez Semée prodigieuse.', 'https://magenoir.com/cards/FR/Vegetal/Semee-prodigieuse.png', 'fr', 'Semée prodigieuse'),
('semée prodigieuse', E'As long as this Permanent is in play, up to 3 Seed components you control have Transmutable : Tree (This spell can be used as a Tree component.)\nAt the beginning of your turn, pay 1 Vegetal Mana and 1 Water Mana or destroy Prodigious sowing.', 'https://magenoir.com/cards/EN/vegetal/Prodigious-sowing.png', 'en', 'Prodigious sowing');

--======================================================================================================================
-- Ronces éphémères
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('ronces éphémères', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2
  },
  "components" : ["ronce"],
  "componentCost": [
    {
        "componentName": "graine",
        "quantity": 1
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Semée prodigieuse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('ronces éphémères', E'L\'adversaire choisit 1 option :\n- Il défausse 1 carte de sa main\n- Il perd 3 Points de Vie', 'https://magenoir.com/cards/FR/Vegetal/Ronces-ephemeres.png', 'fr', 'Ronces éphémères'),
('ronces éphémères', E'The opponent chooses 1 option:\n- They discard 1 card in hand.\n- They lose 3 Health Points.', 'https://magenoir.com/cards/EN/vegetal/Ephemeral-brambles.png', 'en', 'Ephemeral brambles');

--======================================================================================================================
-- La guérisseuse sylvestre
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('la guérisseuse sylvestre', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
	"manaAir": 1,
	"manaEau": 1
  },
  "components" : [],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour La guérisseuse sylvestre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('la guérisseuse sylvestre', E'Choisissez 1 option :\n- Le Permanent Végétal avec des Points de Vie ciblé gagne 4 Points de Vie.\n- Vous gagnez 3 Points de Vie.', 'https://magenoir.com/cards/FR/Vegetal/La-guerisseuse-sylvestre.png', 'fr', 'La guérisseuse sylvestre'),
('la guérisseuse sylvestre', E'Choose 1 option:\n-Target Vegetal Permanent with Health Points gains 4 HP.\n-You gain 3 HP.', 'https://magenoir.com/cards/EN/vegetal/The-sylvan-healer.png', 'en', 'The sylvan healer');

--======================================================================================================================
-- Armure d'écorce
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('armure d''écorce', 'mage_noir', '{
  "type": "Equipment: Torse",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2
  },
  "components" : ["armure", "écorce"],
  "componentCost": [
    {
        "componentName": "arbre",
        "quantity": 1
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Armure d'écorce
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('armure d''écorce', E'Chaque tour, ignorez jusqu''à 1 point de dégâts adverses qui vous sont infligés.', 'https://magenoir.com/cards/FR/Vegetal/Armure-d-ecorce.png', 'fr', 'Armure d''écorce'),
('armure d''écorce', E'Each turn, ignore up to 1 inflicted damage you receive from the opponent.', 'https://magenoir.com/cards/EN/vegetal/Bark-armor.png', 'en', 'Bark armor');


--======================================================================================================================
-- Robe de Kerloc'h
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('robe de kerloc''h', 'mage_noir', '{
  "type": "Equipment: Torse",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
	"manaArcane": 2
  },
  "components" : [],
  "componentCost": [
    {
        "componentName": "druide",
        "quantity": 2
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Robe de Kerloc'h
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('robe de kerloc''h', E'Les dégâts des sorts Végétaux (dont Permanents) que vous contrôlez sont augmentés de 3.\nLes dégâts qui vous sont infligés sont réduits de 2.\nA tout moment, vous pouvez détruire cet Équipement et défausser toute votre main pour annuler les dégâts qui vous sont infligés jusqu\'à la fin du tour.', 'https://magenoir.com/cards/FR/Vegetal/Robe-de-kerloch.png', 'fr', 'Robe de Kerloc''h'),
('robe de kerloc''h', E'Damage from Vegetal spells you control (Permanents included) is increased by 3.\nInflicted damage you take is reduced by 2.\nAt any time, you may sacrifice this Equipment and discard your hand to prevent all damage you would take until the end of the turn.', 'https://magenoir.com/cards/EN/vegetal/kerlochs-robe.png', 'en', 'Kerloc''h''s robe');

--======================================================================================================================
-- Cornes de druide
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('cornes de druide', 'mage_noir', '{
  "type": "Equipment: Tête",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 1,
	"manaArcane": 3
  },
  "components" : ["druide"],
  "componentCost": [
    {
        "componentName": "druide",
        "quantity": 2
    }
  ],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Cornes de druide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('cornes de druide', E'A tout moment, vous pouvez regarder la carte du dessus de votre deck. Si c\'est une Graine, montrez-la à votre adversaire et mettez-la dans votre main.\nVos Graines coûtent 1 Mana Végétal de moins. Si vous êtes Mage Noir, vos Graines coûtent 0 Mana.', 'https://magenoir.com/cards/FR/Vegetal/Cornes-de-druide.png', 'fr', 'Cornes de druide'),
('cornes de druide', E'At any time, you may look at the top card of your deck. If it\'s a Seed, show it to your opponent and put it into your hand.\nYour Seeds cost 1 less Vegetal Mana. If you\'re a Mage Noir, your Seeds cost 0 Mana.', 'https://magenoir.com/cards/EN/vegetal/Druid-horns.png', 'en', 'Druid horns');

--======================================================================================================================
-- Anneau de druide
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('anneau de druide', 'mage_noir', '{
  "type": "Equipment: Anneau",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 3,
	"manaMineral": 1
  },
  "components" : ["druide"],
  "extension": "Jeu de base",
  "artwork": "Camille Fourcade"
}');

-- Localisations pour Anneau de druide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('anneau de druide', E'Les dégâts infligés par les Permanents Végétaux que vous contrôlez sont augmentés de 2.\nSi vous êtes Mage Noir, lorsque vous ajoutez de la Mana dans l\'Ether disponible au début de votre tour, ajoutez 1 Mana Végétal supplémentaire.', 'https://magenoir.com/cards/FR/Vegetal/Anneau-du-druide.png', 'fr', 'Anneau de druide'),
('anneau de druide', E'Damage inflicted by Vegetal Permanents you control is increased by 2.\nIf you\'re a Mage Noir, when you add Mana to the Available Ether at the beginning of your turn, add 1 additional Vegetal Mana.', 'https://magenoir.com/cards/EN/vegetal/Druid-ring.png', 'en', 'Druid ring');

--======================================================================================================================
-- Rituel de décomposition
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel de décomposition', 'mage_noir', '{
  "type": "Rituel",
  "element": "Végétal",
  "manaCost": {
    "total": 5,
    "manaVegetal": 2,
	"manaArcane": 3
  },
  "components" : [],
  "extension": "Jeu de base",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Rituel de décomposition
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel de décomposition', E'Vous passez Mage Noir.\nAu début de votre tour, perdez 1 Point de Vie.\nDurant votre phase principale, vous pouvez détruire 1 Permanent que vous contrôlez pour infliger un montant de dégâts égal à ses Points de Vie à n\'importe quelle cible.\n(Vous pouvez le faire plusieurs fois par tour)', 'https://magenoir.com/cards/FR/Vegetal/Rituel-de-decomposition.png', 'fr', 'Rituel de décomposition'),
('rituel de décomposition', E'You become a Mage Noir.\nAt the beginning of your turn, you lose 1 Health Point.\nDuring your main phase, you may destroy 1 Permanent you control to inflict damage equal to its HP to any target.\n(You may do this multiple times per turn.)', 'https://magenoir.com/cards/EN/vegetal/Ritual-of-decomposition.png', 'en', 'Ritual of decomposition');

--======================================================================================================================
-- Graine bourgeonnante
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('graine bourgeonnante', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 1,
    "manaVegetal": 1
  },
  "components" : [],
  "extension": "Fleurs",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Graine bourgeonnante
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('graine bourgeonnante', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé)\n\nAllez chercher 1 carte Fleur dans votre deck, montrez-la à votre adversaire, mettez-la dans votre main, puis mélangez votre deck.', 'https://magenoir.com/cards/FR/Vegetal/graine_bourgeonnante.png', 'fr', 'Graine bourgeonnante'),
('graine bourgeonnante', E'Slowcast (This spell can''t be activated on the turn it was prepared)\n\nTake 1 Flower card from your deck, show it to the opponent, put it into your hand and shuffle your deck.', 'https://magenoir.com/cards/EN/vegetal/budding_seed.png', 'en', 'Budding seed');

--======================================================================================================================
-- Fleurs de ronces
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleurs de ronces', 'mage_noir', '{
  "type": "Permanent",
  "pv": 1,
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaEau": 1
  },
  "components" : [],
  "extension": "Fleurs",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Fleurs de ronces
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleurs de ronces', E'Lorsqu\'un Permanent avec des PV que vous contrôlez subit des dégâts, inflige 1 point de dégâts à l\'adversaire.', 'https://magenoir.com/cards/FR/Vegetal/fleurs_de_ronces.png', 'fr', 'Fleurs de ronces'),
('fleurs de ronces', E'When a Permanent with HP you control takes damage, inflicts 1 damage to the opponent.', 'https://magenoir.com/cards/EN/vegetal/bramble_flowers.png', 'en', 'Bramble flowers');

--======================================================================================================================
-- Fleur fractale
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleur fractale', 'mage_noir', '{
  "type": "Permanent",
  "pv": 2,
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaArcane": 1
  },
  "components" : [],
  "extension": "Fleurs",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Fleur fractale
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleur fractale', E'Au début de votre tour, inflige 1 point de dégâts à l\'adversaire, puis, si vous êtes Mage Noir, choisissez une carte Fleur dans votre défausse et mettez-la dans votre main.\n\nAutomne (Lorsqu\'il est détruit, ce Permanent applique ses effets de début de tour )', 'https://magenoir.com/cards/FR/Vegetal/fleur_fractale.png', 'fr', 'Fleur fractale'),
('fleur fractale', E'At the beginning of your turn, inflicts 1 damage to the opponent, then, if you\'re a Mage Noir, return 1 Flower spell from your discard pile to your hand.\n\nAutumn (When it is destroyed, this Permanent applies its start-of-turn effects)', 'https://magenoir.com/cards/EN/vegetal/fractal_flower.png', 'en', 'Fractal flower');

--======================================================================================================================
-- Fleur hypnotique
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleur hypnotique', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2
  },
  "components" : [],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Fleur hypnotique
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleur hypnotique', E'Votre adversaire perd 2 Points de Vie (ou 3 si vous êtes Mage Noir).\n\nVotre adversaire pioche 1 carte.', 'https://magenoir.com/cards/FR/Vegetal/fleur_hypnotique.png', 'fr', 'Fleur hypnotique'),
('fleur hypnotique', E'The opponent loses 2 HP (or 3 if you\'re a Mage Noir).\n\nThe opponent draws 1 card.', 'https://magenoir.com/cards/EN/vegetal/hypnotic_flower.png', 'en', 'Hypnotic flower');

--======================================================================================================================
-- Champ de tournesols
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('champ de tournesols', 'mage_noir', '{
  "type": "Permanent",
  "pv": 2,
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2
  },
  "components" : [],
  "extension": "Soleil",
  "artwork": "Victor Fayen"
}');

-- Localisations pour Champ de tournesols
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('champ de tournesols', E'Transmutable : Fleur\n\nLorsqu\'il arrive en jeu, allez chercher 1 sort Soleil dans votre deck, montrez-le à votre adversaire, mettez-le dans votre main, puis mélangez votre deck.\n\nVos sorts Soleil coûtent 1 Mana Feu de moins à préparer.', 'https://magenoir.com/cards/FR/Vegetal/champ_de_tournesol.png', 'fr', 'Champ de tournesols'),
('champ de tournesols', E'Transmutable : Flower\n\nWhen put into play, take 1 Sun card from your deck, show it to the opponent, put it into your hand and shuffle your deck.\n\nYour Sun spells cost 1 less Fire Mana to prepare.', 'https://magenoir.com/cards/EN/vegetal/sunflower_field.png', 'en', 'Sunflower field');

--======================================================================================================================
-- Croissance de fleurs
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('croissance de fleurs', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 2
  },
  "components" : ["fleur"],
  "componentCost": [
    {
      "componentName": "fleur",
      "quantity": 1
    }
  ],
  "extension": "Fleurs",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Croissance de fleurs
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('croissance de fleurs', E'La cible de votre choix gagne 2 PV.\n\nRegardez les 3 cartes du dessus de votre deck. Vous pouvez choisir 1 carte Fleur parmi celles-ci, la montrer à votre adversaire, puis la mettre dans votre main. Mettez le reste au dessous de votre deck dans l\'ordre de votre choix.', 'https://magenoir.com/cards/FR/Vegetal/croissance_de_fleurs.png', 'fr', 'Croissance de fleurs'),
('croissance de fleurs', E'Any target gains 2 HP.\n\nLook at the top 3 cards of your deck. You may take 1 Flower card from them, show it to the opponent and then put it in your hand.\nPut the rest at the bottom of your deck in any order.', 'https://magenoir.com/cards/EN/vegetal/flower_growth.png', 'en', 'Flower growth');

--======================================================================================================================
-- Fleurs d'arbre
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleurs d''arbre', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaEau": 1
  },
  "components" : ["fleur"],
  "componentCost": [
    {
      "componentName": "fleur",
      "quantity": 1
    }
  ],
  "extension": "Fleurs",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Fleurs d'arbre
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleurs d''arbre', E'Chaque Permanent Végétal que vous contrôlez libère 1 Mana Végétal.', 'https://magenoir.com/cards/FR/Vegetal/fleurs_d_arbre.png', 'fr', 'Fleurs d''arbre'),
('fleurs d''arbre', E'Each Vegetal Permanent you control releases 1 Vegetal Mana.', 'https://magenoir.com/cards/EN/vegetal/tree_flowers.png', 'en', 'Tree flowers');

--======================================================================================================================
-- Fleur de Kerloc'h
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('fleur de kerloc''h', 'mage_noir', '{
  "type": "Permanent",
  "pv": 3,
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
    "manaEau": 2
  },
  "components" : ["graine", "fleur"],
  "componentCost": [
    {
      "componentName": "graine",
      "quantity": 1
    },
    {
      "componentName": "fleur",
      "quantity": 1
    }
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Fleur de Kerloc'h
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('fleur de kerloc''h', E'Unique, sauf si vous êtes Mage Noir.\n\nAu début de votre tour, inflige 2 points de dégâts à l\'adversaire, puis ce permanent gagne 1 PV (ou 2 si vous contrôlez au moins 4 composants Goutte).', 'https://magenoir.com/cards/FR/Vegetal/fleur_de_kerloc_h.png', 'fr', 'Fleur de Kerloc''h'),
('fleur de kerloc''h', E'Unique, unless you\'re a Mage Noir.\n\nAt the beginning of your turn, inflicts 2 damage to the opponent, then this Permanent gains 1 HP (or 2 if you control at least 4 Drop components).', 'https://magenoir.com/cards/EN/vegetal/kerloch_s_flower.png', 'en', 'Kerloc''h''s flower');

--======================================================================================================================
-- Pétales tranchants
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('pétales tranchants', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaAir": 1
  },
  "components" : ["fleur"],
  "componentCost": [
    {
      "componentName": "fleur",
      "quantity": 1
    }
  ],
  "extension": "Fleurs",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Pétales tranchants
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('pétales tranchants', E'Inflige 3 points de dégâts à n\'importe quelle cible.\n\nInflige 2 points de dégâts à un Permanent Végétal que vous contrôlez (ou 1 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Vegetal/petales_tranchants.png', 'fr', 'Pétales tranchants'),
('pétales tranchants', E'Inflicts 3 damage to any target.\n\nInflicts 2 damage to a Vegetal Permanent you control (or 1 if you\'re a Mage Noir).', 'https://magenoir.com/cards/EN/vegetal/sharp_petals.png', 'en', 'Sharp petals');

--======================================================================================================================
-- Floraison létale
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('floraison létale', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 3
  },
  "components" : ["fleur"],
  "componentCost": [
    {
      "componentName": "fleur",
      "quantity": 2
    }
  ],
  "extension": "Fleurs",
  "artwork": "Morgane Perrin-Roudil"
}');

-- Localisations pour Floraison létale
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('floraison létale', E'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )\n\nL\'adversaire perd 5 PV.\n\nDéfaussez 1 composant Fleur que vous contrôlez.', 'https://magenoir.com/cards/FR/Vegetal/floraison_letale.png', 'fr', 'Floraison létale'),
('floraison létale', E'Slowcast (This spell can''t be activated on the turn it was prepared)\n\nThe opponent loses 5 HP.\n\nDiscard 1 Flower component you control.', 'https://magenoir.com/cards/EN/vegetal/lethal_flourish.png', 'en', 'Lethal flourish');

--======================================================================================================================
-- Photosynthèse
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('photosynthèse', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 1,
    "manaFeu": 1,
    "manaEau": 1
  },
  "components" : [],
  "extension": "Fleurs",
  "artwork": "Jessica Heran"
}');

-- Localisations pour Photosynthèse
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('photosynthèse', E'Rapide (Ce sort peut être activé à tout moment )\n\n1 Permanent Végétal que vous contrôlez gagne 2 PV.\nSi vous contrôlez un composant Soleil, il gagne 2 PV de plus.', 'https://magenoir.com/cards/FR/Vegetal/photosynthese.png', 'fr', 'Photosynthèse'),
('photosynthèse', E'Quickcast (This spell can be activated at any time)\n\n1 Vegetal Permanent you control gains 2 HP.\nIf you control a Sun component, it gains 2 additional HP.', 'https://magenoir.com/cards/EN/vegetal/photosynthesis.png', 'en', 'Photosynthesis');

--======================================================================================================================
-- Infusion florale
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('infusion florale', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 0
  },
  "components" : ["fleur", "goutte"],
  "componentCost": [
    {
      "componentName": "fleur",
      "quantity": 1
    },
    {
      "componentName": "goutte",
      "quantity": 1
    }
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Infusion florale
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('infusion florale', E'Tant que ce sort est en préparation, au début de votre tour, mettez 1 Mana Végétal de l\'Éther Infini sous ce sort.\n\nLorsque vous l\'activez, piochez X cartes, où X est le nombre de Mana verrouillées par ce sort. X ne peut être supérieur au nombre de composants Gouttes que vous contrôlez.', 'https://magenoir.com/cards/FR/Vegetal/infusion_florale.png', 'fr', 'Infusion florale'),
('infusion florale', E'While in preparation:\nAt the start of your turn, lock 1 Vegetal Mana from the Infinite Ether under this spell.\n\nWhen activated, draw X cards, where X is the amount of Mana this spell locks. X can''t be more than the number of Drop components you control.', 'https://magenoir.com/cards/EN/vegetal/floral_infusion.png', 'en', 'Floral infusion');

--======================================================================================================================
-- Renouveau
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('renouveau', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 2,
    "manaArcane": 1
  },
  "components" : ["ronce"],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Renouveau
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('renouveau', E'Si vous êtes Mage Noir, ce sort gagne: "Rapide" (Ce sort peut être activé à tout moment)\n\nDétruisez un Permanent Végétal.\nÀ la fin de ce tour, remettez-le en jeu depuis la défausse.', 'https://magenoir.com/cards/FR/Vegetal/renouveau.png', 'fr', 'Renouveau'),
('renouveau', E'If you\'re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)\n\nDestroy a Vegetal Permanent. At the end of the turn, put it back into play from the discard pile.', 'https://magenoir.com/cards/EN/vegetal/renewal.png', 'en', 'Renewal');

--======================================================================================================================
-- Tourment d'épines
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('tourment d''épines', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 3,
    "manaVegetal": 3
  },
  "components" : ["ronce"],
  "componentCost": [
    {
      "componentName": "ronce",
      "quantity": 1
    }
  ],
  "extension": "Fleurs",
  "artwork": "Geoffrey Amesse"
}');

-- Localisations pour Tourment d'épines
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('tourment d''épines', E'Si l\'adversaire a pioché plus d\'1 carte ce tour-ci, ce sort est Rapide. (Ce sort peut être activé à tout moment )\n\nL\'adversaire peut défausser autant de cartes de sa main qu\'il le souhaite.\nPuis ce sort lui inflige 1 point de dégâts par carte qu\'il a en main.', 'https://magenoir.com/cards/FR/Vegetal/tourment_d_epines.png', 'fr', 'Tourment d''épines'),
('tourment d''épines', E'If the opponent drew more than 1 card this turn, this spell has Quickcast. (This spell can be activated at any time)\n\nThe opponent may discard any number of cards from hand.\nThen, this spell inflicts 1 damage to them per card they have in hand.', 'https://magenoir.com/cards/EN/vegetal/thorn_torment.png', 'en', 'Thorn torment');

--======================================================================================================================
-- Distillation de sève
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('distillation de sève', 'mage_noir', '{
  "type": "Sort",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaEau": 1
  },
  "components" : [],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Distillation de sève
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('distillation de sève', E'Prenez 3 Mana de votre choix dans l\'Éther Infini (ou 4 si vous êtes Mage Noir).', 'https://magenoir.com/cards/FR/Vegetal/distillation_de_seve.png', 'fr', 'Distillation de sève'),
('distillation de sève', E'Take 3 Mana of your choice from the Infinite Ether (or 4 if you\'re a Mage Noir).', 'https://magenoir.com/cards/EN/vegetal/sap_distillation.png', 'en', 'Sap distillation');

--======================================================================================================================
-- Baguette de druide
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('baguette de druide', 'mage_noir', '{
  "type": "Équipement : Arme",
  "element": "Végétal",
  "manaCost": {
    "total": 2,
    "manaVegetal": 1,
    "manaMineral": 1
  },
  "components" : ["écorce"],
  "componentCost": [
    {
      "componentName": "écorce",
      "quantity": 1
    }
  ],
  "extension": "Fleurs",
  "artwork": "Aurelien Segeat"
}');

-- Localisations pour Baguette de druide
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('baguette de druide', E'Au début de votre tour, inflige 1 point de dégâts par Équipement Druide que vous contrôlez à n\'importe quelle cible.\n\nSi vous êtes Mage Noir, Baguette de druide ne détruit pas les Équipements qu\'elle utilise comme composants, et elle n\'est pas détruite lorsqu\'un Équipement l\'utilise comme composant.', 'https://magenoir.com/cards/FR/Vegetal/baguette_de_druide.png', 'fr', 'Baguette de druide'),
('baguette de druide', E'At the beginning of your turn, inflicts 1 damage per Druid Equipment you control to any target.\n\nIf you are a Mage Noir, this piece of Equipment does not destroy Equipment that it uses as a component, and it is not destroyed when used as a component to prepare other Equipment.', 'https://magenoir.com/cards/EN/vegetal/druid_wand.png', 'en', 'Druid wand');

--======================================================================================================================
-- Rituel des saisons
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('rituel des saisons', 'mage_noir', '{
  "type": "Rituel",
  "element": "Végétal",
  "manaCost": {
    "total": 4,
    "manaVegetal": 2,
    "manaArcane": 2
  },
  "components" : [],
  "extension": "Fleurs",
  "artwork": "Johann Goutard"
}');

-- Localisations pour Rituel des saisons
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('rituel des saisons', E'Vous passez Mage Noir.\n\nLorsque ce sort arrive en jeu, vos Permanents Végétaux perdent 1 PV.\n\nDurant votre phase principale, vous pouvez faire perdre 1 PV à un Permanent que vous contrôlez, puis celui-ci gagne : "Automne".\n(Lorsqu\'il est détruit, ce Permanent applique ses effets de début de tour )', 'https://magenoir.com/cards/FR/Vegetal/rituel_des_saisons.png', 'fr', 'Rituel des saisons'),
('rituel des saisons', E'You become a Mage Noir.\n\nWhen put into play, your Vegetal Permanents lose 1 HP.\n\nDuring your main phase, you may have a Permanent you control lose 1 HP, then it gains: "Autumn".\n(When it is destroyed, this Permanent applies its start-of-turn effects)', 'https://magenoir.com/cards/EN/vegetal/ritual_of_seasons.png', 'en', 'Ritual of seasons');

--======================================================================================================================
-- Feu
--======================================================================================================================

--======================================================================================================================
-- Flamme
--======================================================================================================================
INSERT INTO card (id, game_id, properties) VALUES
('flamme', 'mage_noir', '{
  "type": "Sort",
  "element": "Feu",
  "manaCost": {
    "total": 0
  },
  "components" : ["flamme"],
  "extension": "Jeu de base",
  "artwork": "Charles Ouvrard"
}');

-- Localisations pour Flamme
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('flamme', E'Inflige 1 point de dégâts à n\'importe quelle cible.\nAprès que ce sort est utilisé comme composant, défaussez-le.', 'https://magenoir.com/cards/FR/Feu/Flamme.png', 'fr', 'Flamme'),
('flamme', E'Inflicts 1 damage to any target.\nAfter this spell is used as a component, discard it.', 'https://magenoir.com/cards/EN/fire/Flame.png', 'en', 'Flame');
