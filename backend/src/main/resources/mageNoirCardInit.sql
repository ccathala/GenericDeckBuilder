-- Delete CardLocalizarion
DELETE FROM card_localization
WHERE card_id IN (
  SELECT id FROM card WHERE game_id = 'mage_noir'
);

-- Delete Card
DELETE FROM card
WHERE game_id = 'mage_noir';

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

-- Localisations pour Rituel de décomposition
INSERT INTO public.card_localization
(card_id, description, image_url, locale, "name")
VALUES
('flamme', E'Inflige 1 point de dégâts à n\'importe quelle cible.\nAprès que ce sort est utilisé comme composant, défaussez-le.', 'https://magenoir.com/cards/FR/Feu/Flamme.png', 'fr', 'Flamme'),
('flamme', E'Inflicts 1 damage to any target.\nAfter this spell is used as a component, discard it.', 'https://magenoir.com/cards/EN/fire/Flame.png', 'en', 'Flame');

