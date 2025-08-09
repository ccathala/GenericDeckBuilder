-- Script d'insertion des card_localization généré automatiquement
-- Généré le: 2025-08-06 23:16:29
-- Source: card_localization_202508062027_export_card_localization.csv

-- Désactiver les contraintes de clés étrangères temporairement
SET session_replication_role = replica;

BEGIN;

INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('acceleration', 'Si vous êtes Mage Noir, ce sort coûte 1 Mana Arcane de moins à préparer.Piochez 2 cartes.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Acceleration.png', 'fr', 'Accélération', 'https://magenoir.com/collection/FR/air/Acceleration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('acceleration', 'If you''re a Mage Noir, this spell costs 1 less Arcane Mana to prepare.Draw 2 cards.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Acceleration.png', 'en', 'Acceleration', 'https://magenoir.com/collection/EN/air/Acceleration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('appel de la foudre', 'Inflige 2 points de dégâts à n''importe quelle cible.Vous pouvez montrer 1 sort Tonnerre de votre deck à votre adversaire, puis mélanger votre deck, et mettre ce Tonnerre au dessus de celui-ci.Si vous êtes Mage Noir, mettez-le dans votre main à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/appel_de_la_foudre.png', 'fr', 'Appel de la foudre', 'https://magenoir.com/collection/FR/air/Appel-de-la-foudre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('appel de la foudre', 'Inflicts 2 damage to any target.You may take 1 Thunder card from your deck, show it to the opponent, then shuffle your deck and put that card on top of it.If you''re a Mage Noir, put it into your hand instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/lightning_call.png', 'en', 'Lightning call', 'https://magenoir.com/collection/EN/air/Lightning-call.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arc de foudre', 'Rapide (Ce sort peut être activé à tout moment )Inflige 2 points de dégâts à n''importe quelle cible.Appliquez les effets d''1 composant Étincelle que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/arc_de_foudre.png', 'fr', 'Arc de foudre', 'https://magenoir.com/collection/FR/air/Arc-de-foudre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arc de foudre', 'Quickcast (This spell can be activated at any time)Inflicts 2 damage to any target.Apply the effects of 1 Spark component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/lightning_arc.png', 'en', 'Lightning arc', 'https://magenoir.com/collection/EN/air/Lightning-arc.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('baguette des courants d air', 'Lorsqu''il arrive en jeu, défausse le composant Vent utilisé pour le lancer, sauf si vous êtes Mage Noir.Au début de votre tour, piochez 1 carte, puis ce sort inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Baguette-des-courants-d-air.png', 'fr', 'Baguette des courants d''air', 'https://magenoir.com/collection/FR/air/Baguette_des_courants_d_air.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('baguette des courants d air', 'When put into play, discard the Wind component used to cast it unless you''re a Mage Noir. At the beginning of your turn, draw 1 card, then this spell inflicts 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Wand-of-air-currents.png', 'en', 'Wand of air currents', 'https://magenoir.com/collection/EN/air/Wand-of-air-currents.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('balayage puissant', 'Renvoyez 1 Équipement dans la main de son propriétaire. Si vous êtes Mage Noir, piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Balayage-puissant.png', 'fr', 'Balayage puissant', 'https://magenoir.com/collection/FR/air/Balayage_puissant.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('balayage puissant', 'Return 1 piece of Equipment to its owner''s hand. If you''re a Mage Noir, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Powerful-swipe.png', 'en', 'Powerful swipe', 'https://magenoir.com/collection/EN/air/Powerful-swipe.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('bobine tesla', 'Si un sort Étincelle ou Foudre inflige des dégâts à Bobine Tesla, piochez 1 carte.Si un autre sort lui inflige des dégâts, inflige autant de dégâts à l’adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/bobine_tesla.png', 'fr', 'Bobine Tesla', 'https://magenoir.com/collection/FR/air/Bobine-tesla.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('bobine tesla', 'If a Spark or Lightning spell inflicts damage to Tesla coil, you draw 1 card.If another spell inflicts damage to Tesla coil, Tesla coil inflicts that much damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/tesla_coil.png', 'en', 'Tesla coil', 'https://magenoir.com/collection/EN/air/Tesla-coil.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('bottes statiques', 'Lorsque vous piochez votre deuxième carte chaque tour, inflige 3 points de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/bottes_statique.png', 'fr', 'Bottes statiques', 'https://magenoir.com/collection/FR/air/Bottes-statiques.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('bottes statiques', 'When you draw your second card each turn, inflicts 3 damage to the opponent', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/static_boots.png', 'en', 'Static boots', 'https://magenoir.com/collection/EN/air/Static-boots.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('chaine de foudre', 'Inflige 1 point de dégâts à n''importe quelle cible. Puis recommencez pour chaque exemplaire de Chaîne de foudre dans votre défausse.Appliquez les effets d''un sort Foudre de votre défausse, excepté un sort Chaîne de foudre.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/chaine_de_foudre.png', 'fr', 'Chaîne de foudre', 'https://magenoir.com/collection/FR/air/Chaine-de-foudre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('chaine de foudre', 'Inflicts 1 damage to any target.Repeat for each copy of Lightning chain in your discard pile.Apply the effects of a Lightning spell from your discard pile, except a Lightning chain spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/lightning_chain.png', 'en', 'Lightning chain', 'https://magenoir.com/collection/EN/air/Lightning-chain.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('eclair d inspiration', 'Piochez 1 carte.Piochez 1 carte supplémentaire pour chaque composant Inspiration que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/eclair_d_inspiration.png', 'fr', 'Éclair d''inspiration', 'https://magenoir.com/collection/FR/air/Eclair-d-inspiration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('eclair d inspiration', 'Draw 1 card.Draw 1 additional card for each Inspiration component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/flash_inspiration.png', 'en', 'Flash of inspiration', 'https://magenoir.com/collection/EN/air/Flash-of-inspiration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('etincelle de flamme', 'Après que ce sort est utilisé comme composant, défaussez-le, sauf si vous êtes Mage Noir.Lorsque ce sort est défaussé depuis le plateau, inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/etincelle_de_flamme.png', 'fr', 'Étincelle de flamme', 'https://magenoir.com/collection/FR/air/Etincelle-de-flamme.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('etincelle de flamme', 'After this spell is used as a component, discard it unless you''re a Mage Noir.When this spell is discarded from play, it inflicts 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/flame_spark.png', 'en', 'Flame spark', 'https://magenoir.com/collection/EN/air/Flame-spark.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('etincelle electrique', 'Inflige 1 point de dégâts à l''adversaire.Piochez 1 carte.Défaussez-vous d''1 carte en main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/etincelle_electrique.png', 'fr', 'Étincelle électrique', 'https://magenoir.com/collection/FR/air/Etincelle-electrique.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('etincelle electrique', 'Inflicts 1 damage to the opponent.Draw 1 card.Discard 1 card from hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/electric_spark.png', 'en', 'Electric spark', 'https://magenoir.com/collection/EN/air/Electric-spark.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('etincelle statique', 'Lorsque ce sort est défaussé depuis votre main, il applique ses effets.Inflige 1 point de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/etincelle_statique.png', 'fr', 'Étincelle statique', 'https://magenoir.com/collection/FR/air/Etincelle-statique.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('etincelle statique', 'When this spell is discarded from hand, it applies its effects.Inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/static_spark.png', 'en', 'Static spark', 'https://magenoir.com/collection/EN/air/Static-spark.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine dans le vent', 'Ce sort coûte 1 Mana Air de moins si vous contrôlez un composant Souffle. Lorsque ce sort quitte le plateau, piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Graine-dans-le-vent.png', 'fr', 'Graine dans le vent', 'https://magenoir.com/collection/FR/air/Graine_dans_le_vent.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine dans le vent', 'This spell costs 1 less Air Mana if you control a Breath component. When this spell leaves play, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Seed-in-the-wind.png', 'en', 'Seed in the wind', 'https://magenoir.com/collection/EN/air/Seed-in-the-wind.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lame d air', 'Inflige 3 points de dégâts à n''importe quelle cible. Ils ne peuvent pas être ignorés, réduits, ni redirigés.Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Lame-d-air.png', 'fr', 'Lame d''air', 'https://magenoir.com/collection/FR/air/Lame_d_air.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lame d air', 'Inflicts 3 damage to any target. It cannot be ignored, reduced or redirected.Put 1 Breath component you control back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Air-blade.png', 'en', 'Air blade', 'https://magenoir.com/collection/EN/air/Air-blade.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lame de foudre', 'Une fois par tour pendant votre phase principale, inflige 2 points de dégâts à l''adversaire.Si l''adversaire ne subit aucun de ces dégâts, choisissez 1 Équipement qu''il contrôle : celui-ci n''applique plus ses effets jusqu''à la fin de votre tour.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/lame_de_foudre.png', 'fr', 'Lame de foudre', 'https://magenoir.com/collection/FR/air/Lame-de-foudre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lame de foudre', 'Once per turn during your main phase, inflicts 2 damage to the opponent.If the opponent doesn''t take any damage this way, choose 1 piece of Equipment they control: it doesn''t apply its effects until the end of your turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/lightning_blade.png', 'en', 'Lightning blade', 'https://magenoir.com/collection/EN/air/Lightning-blade.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du vide', 'Vous passez Mage Noir. Votre taille de main maximale devient 4. Défaussez-vous immédiatement pour avoir 4 cartes maximum en main. Durant votre tour, défaussez 1 carte de votre main pour infliger 1 point de dégâts à n''importe quelle cible. (Vous pouvez le faire plusieurs fois par tour)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Rituel-du-vide.png', 'fr', 'Rituel du vide', 'https://magenoir.com/collection/FR/air/Rituel_du_vide.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du vide', 'You become a Mage Noir. Your maximum hand size becomes 4. Discard right away to have 4 cards maximum in hand. During your turn, you may discard a card from your hand to inflict 1 damage to any target. (You may do this multiple times per turn.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Emptiness-ritual.png', 'en', 'Emptiness ritual', 'https://magenoir.com/collection/EN/air/Emptiness-ritual.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel supraconducteur', 'Vous passez Mage Noir.Les effets de dégâts des sorts que vous activez durant le tour de votre adversaire sont augmentés de 1.Durant votre tour, vos sorts ne peuvent pas infliger plus de 2 dégâts à la fois.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/rituel_supraconducteur.png', 'fr', 'Rituel supraconducteur', 'https://magenoir.com/collection/FR/air/Rituel-supraconducteur.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel supraconducteur', 'You become a Mage Noir.Damage from spells you activate during the opponent''s turn is increased by 1. During your turn, your spells cannot inflict more than 2 damage at once.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/supraconductor_ritual.png', 'en', 'Superconductor ritual', 'https://magenoir.com/collection/EN/air/Superconductor-ritual.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('robe du hurleur', 'Ne peut être préparé que par un Mage Noir. Les sorts Air que vous préparez coûtent 1 Mana Air de moins. Les dégâts des sorts Air que vous contrôlez sont augmentés de 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Robe-du-hurleur.png', 'fr', 'Robe du hurleur', 'https://magenoir.com/collection/FR/air/Robe_du_hurleur.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('robe du hurleur', 'Can only be prepared by a Mage Noir Air spells you prepare cost 1 less Air Mana. Damage from Air spells you control is increased by 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Howlers-robe.png', 'en', 'Howler''s robe', 'https://magenoir.com/collection/EN/air/Howlers-robe.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rugissement de raijin', 'Si vous êtes Mage Noir, ce sort gagne : "Rapide". (Ce sort peut être activé à tout moment )Inflige 3 points de dégâts à n''importe quelle cible.Appliquez les effets d''un composant Foudre que vous contrôlez, puis défaussez-le.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/rugissement_de_raijin.png', 'fr', 'Rugissement de Raijin', 'https://magenoir.com/collection/FR/air/Rugissement-de-raijin.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rugissement de raijin', 'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Inflicts 3 damage to any target.Apply the effects of a Lightning component you control, then discard it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/raijin_s_roar.png', 'en', 'Raijin''s roar', 'https://magenoir.com/collection/EN/air/Raijin-s-roar.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle', 'Prenez jusqu''à 2 Mana Air dans l''Ether Disponible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Souffle.png', 'fr', 'Souffle', 'https://magenoir.com/collection/FR/air/Souffle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle', 'Take up to 2 Air Mana from the Available Ether.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Breath.png', 'en', 'Breath', 'https://magenoir.com/collection/EN/air/Breath.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle de flammes', 'Inflige 3 points de dégâts à 1 Permanent. Ils ne peuvent pas être ignorés, réduits, ni redirigés. Après que ce sort est utilisé comme composant, défaussez-le. Vous pouvez payer 1 Mana Feu ou Air pour ne pas le défausser.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Souffle-de-flammes.png', 'fr', 'Souffle de flammes', 'https://magenoir.com/collection/FR/air/Souffle_de_flammes.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle de flammes', 'Inflicts 3 damage to any 1 Permanent. It cannot be ignored, reduced or redirected. After this spell is used as a component, discard it. You may pay 1 Fire or Air Mana to prevent it from being discarded.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Breath-of-flames.png', 'en', 'Breath of flames', 'https://magenoir.com/collection/EN/air/Breath-of-flames.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle de la guerisseuse', 'Vous gagnez 1 Point de Vie puis piochez 1 carte. Si vous contrôlez un composant Souffle, gagnez à nouveau 1 Point de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Souffle-de-la-guerisseuse.png', 'fr', 'Souffle de la guérisseuse', 'https://magenoir.com/collection/FR/air/Souffle_de_la_guerisseuse.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle de la guerisseuse', 'You gain 1 Health Point and draw 1 card. If you control a Breath component, gain 1 HP again.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Healers-breath.png', 'en', 'Healer''s breath', 'https://magenoir.com/collection/EN/air/Healers-breath.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle etincelle', 'Inflige 1 point de dégâts à 1 Permanent.Prenez 1 Mana Air dans l''Éther Disponible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/souffle_etincelle.png', 'fr', 'Souffle étincelle', 'https://magenoir.com/collection/FR/air/Souffle-etincelle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle etincelle', 'Inflicts 1 damage to 1 Permanent.Take 1 Air Mana from the Available Ether.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/spark_breath.png', 'en', 'Spark breath', 'https://magenoir.com/collection/EN/air/Spark-breath.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('supraconductivite', 'Vos sorts qui ont Lent gagnent : "Rapide". (Ces sorts peuvent être activés à tout moment )(Un sort qui a Lent et Rapide peut être activé à tout moment, sauf le tour durant lequel il a été préparé.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/supraconductivite.png', 'fr', 'Supraconductivité', 'https://magenoir.com/collection/FR/air/Supraconductivite.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('supraconductivite', 'Your spells with Slowcast gain: "Quickcast". (This spell can be activated at any time) (A spell with Slowcast and Quickcast can be activated at any time except the turn it was prepared.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/superconductivity.png', 'en', 'Superconductivity', 'https://magenoir.com/collection/EN/air/Superconductivity.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tonnerre de zeus', 'Ne peut être préparé que par un Mage Noir.Rapide (Ce sort peut être activé à tout moment)Inflige 5 points de dégâts à l''adversaire.Jusqu''au début de votre prochain tour, l''adversaire ne peut gagner des cartes en main que durant sa phase de pioche.(Les effets annulés ainsi sont ignorés.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/tonnerre_de_zeus.png', 'fr', 'Tonnerre de zeus', 'https://magenoir.com/collection/FR/air/Tonnerre-de-zeus.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tonnerre de zeus', 'Can only be prepared by a Mage Noir.Quickcast (This spell can be activated at any time)Inflicts 5 damage to the opponent.Until the beginning of your next turn, the opponent can only add cards to their hand during their draw phase. (Effects negated this way are ignored)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/zeus_s_thunder.png', 'en', 'Zeus''s thunder', 'https://magenoir.com/collection/EN/air/Zeus-s-thunder.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tonnerre etourdissant', 'Rapide (Ce sort peut être activé à tout moment )Jusqu''au début de votre prochain tour, TOUS les sorts gagnent : "Lent". (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/tonnerre_etourdissant.png', 'fr', 'Tonnerre étourdissant', 'https://magenoir.com/collection/FR/air/Tonnerre-etourdissant.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tonnerre etourdissant', 'Quickcast (This spell can be activated at any time)Until the beginning of your next turn, ALL spells gain: "Slowcast". (This spell can''t be activated on the turn it was prepared)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/stunning_thunder.png', 'en', 'Stunning thunder', 'https://magenoir.com/collection/EN/air/Stunning-thunder.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tornade', 'Inflige 4 points de dégâts à n''importe quelle cible.Appliquez les effets d''1 composant Vent que vous contrôlez, puis renvoyez-le dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Tornade.png', 'fr', 'Tornade', 'https://magenoir.com/collection/FR/air/Tornade.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tornade', 'Inflicts 4 damage to any target.Apply the effects of 1 Wind component you control, then put that component back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Tornado.png', 'en', 'Tornado', 'https://magenoir.com/collection/EN/air/Tornado.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('typhon', 'Inflige 6 points de dégâts à n''importe quelle cible.Défausse jusqu''à 3 sorts en préparation de l''adversaire.Renvoyez 1 composant Vent que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Typhon.png', 'fr', 'Typhon', 'https://magenoir.com/collection/FR/air/Typhon.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('typhon', 'Inflicts 6 damage to any target.Discard up to 3 of the opponent''s prepared spells.Put 1 Wind component you control back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Typhoon.png', 'en', 'Typhoon', 'https://magenoir.com/collection/EN/air/Typhoon.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague de foudre', 'Inflige 1 point de dégâts à n''importe quelle cible.Votre prochain sort Eau qui applique ses effets ce tour-ci gagne les effets de Vague de foudre, ajoutés après ses propres effets.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/vague_de_foudre.png', 'fr', 'Vague de foudre', 'https://magenoir.com/collection/FR/air/Vague-de-foudre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague de foudre', 'Inflicts 1 damage to any target.Your next Water spell to apply its effects this turn gains the effects of Wave of Lightning, added after its own effects.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/wave_of_lightning.png', 'en', 'Wave of lightning', 'https://magenoir.com/collection/EN/air/Wave-of-lightning.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vent tourbillonnant', 'Renvoyez 1 sort en préparation au-dessus du deck de son propriétaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Vent-tourbillonnant.png', 'fr', 'Vent tourbillonnant', 'https://magenoir.com/collection/FR/air/Vent_tourbillonnant.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vent tourbillonnant', 'Return 1 prepared spell on top of its owner''s deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Whirling-wind.png', 'en', 'Whirling winds', 'https://magenoir.com/collection/EN/air/Whirling-wind.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vent violent', 'Inflige 4 points de dégâts à n''importe quelle cible. Si vous êtes Mage Noir, les dégâts infligés sont augmentés de 1 par composant Souffle que vous contrôlez. Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Vent-violent.png', 'fr', 'Vent violent', 'https://magenoir.com/collection/FR/air/Vent_violent.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vent violent', 'Inflicts 4 damage to any target. If you''re a Mage Noir, the damage inflicted is augmented by 1 for each Breath component you control. Put 1 Breath component you control back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Violent-wind.png', 'en', 'Violent wind', 'https://magenoir.com/collection/EN/air/Violent-wind.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vents favorables', 'Ce tour-ci, vous pouvez échanger la Mana Air à 1 pour 1 dans les deux sens. Renvoyez 1 composant Souffle que vous contrôlez dans votre deck en troisième position à partir du dessus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Vents-favorables.png', 'fr', 'Vents favorables', 'https://magenoir.com/collection/FR/air/Vents_favorables.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vents favorables', 'This turn, you may trade Air Mana at a rate of 1 for 1 in either direction. Put 1 Breath component you control back into your deck, third from the top.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Favorable-winds.png', 'en', 'Favorable winds', 'https://magenoir.com/collection/EN/air/Favorable-winds.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('zap', 'Si vous êtes Mage Noir, ce sort gagne : "Rapide" (Ce sort peut être activé à tout moment). Inflige 1 point de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/zap.png', 'fr', 'Zap', 'https://magenoir.com/collection/FR/air/Zap.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('zap', 'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/zap.png', 'en', 'Zap', 'https://magenoir.com/collection/EN/air/Zap.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('zephyr', 'Inflige 2 points de dégâts à n''importe quelle cible.Piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Air/Zephyr.png', 'fr', 'Zéphyr', 'https://magenoir.com/collection/FR/air/Zephyr.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('zephyr', 'Inflicts 2 damage to any target.Draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/air/Zephyr.png', 'en', 'Zephyr', 'https://magenoir.com/collection/EN/air/Zephyr.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('acceleration du temps', 'Tout sort utilisant ce sort comme composant gagne l''effet : "Défaussez 1 carte du dessus de votre deck."', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Acceleration-du-temps.png', 'fr', 'Accélération du temps', 'https://magenoir.com/collection/FR/arcane/Acceleration-du-temps.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('acceleration du temps', 'Any spell using this as a component gains: "Discard 1 card from the top of your deck."', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Time-acceleration.png', 'en', 'Time acceleration', 'https://magenoir.com/collection/EN/arcane/Time-acceleration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('acceleration forcee', 'Votre adversaire pioche 7 cartes (ou 3 s''il est Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/acceleration_forcee.png', 'fr', 'Accélération forcée', 'https://magenoir.com/collection/FR/arcane/Acceleration-forcee.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('acceleration forcee', 'The opponent draws 7 cards (or 3 if they''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/forced_acceleration.png', 'en', 'Forced acceleration', 'https://magenoir.com/collection/EN/arcane/Forced-acceleration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('alteration du passe', 'Échangez les positions de deux sorts dans la défausse du joueur de votre choix.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/alteration_du_passe.png', 'fr', 'Alteration du passé', 'https://magenoir.com/collection/FR/arcane/Alteration-du-passe.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('alteration du passe', 'Swap the positions of two spells in the discard pile of any player.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/alteration_of_the_past.png', 'en', 'Alteration of the past', 'https://magenoir.com/collection/EN/arcane/Alteration-of-the-past.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('antimatiere', 'Payez le coût en Mana d''1 Permanent pour le détruire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/antimatiere.png', 'fr', 'Antimatière', 'https://magenoir.com/collection/FR/arcane/Antimatiere.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('antimatiere', 'Pay the Mana cost of 1 Permanent to destroy it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/antimatter.png', 'en', 'Antimatter', 'https://magenoir.com/collection/EN/arcane/Antimatter.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('apercu du futur', 'Déphase 1 le joueur de votre choix (Défausse 1 carte du dessous de son deck).Puis ce joueur pioche 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/apercu_du_futur.png', 'fr', 'Aperçu du futur', 'https://magenoir.com/collection/FR/arcane/Apercu-du-futur.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('apercu du futur', 'Phase out any player by 1. (Discard 1 card from the bottom of their deck)Then that player draws 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/glimpse_of_the_future.png', 'en', 'Glimpse of the future', 'https://magenoir.com/collection/EN/arcane/Glimpse-of-the-future.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('avance rapide', 'Défaussez 1 composant Temps que vous contrôlez. Piochez 1 carte. Inflige 2 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Avance-rapide.png', 'fr', 'Avance rapide', 'https://magenoir.com/collection/FR/arcane/Avance-rapide.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('avance rapide', 'Discard 1 Time component you control. Draw 1 card. Inflicts 2 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Fast-forward.png', 'en', 'Fast forward', 'https://magenoir.com/collection/EN/arcane/Fast-forward.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('blast temporel', 'Vous pouvez préparer ce sort depuis votre défausse tant qu''il n''est pas au dessus de celle-ci. Lorsque vous préparez ce sort, défaussez le composant Temps utilisé. Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Blast-temporel.png', 'fr', 'Blast temporel', 'https://magenoir.com/collection/FR/arcane/Blast-temporel.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('blast temporel', 'You may prepare this spell from your discard pile as long as it isn''t on top of it. When you prepare this spell, discard the Time component used. Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Temporal-blast.png', 'en', 'Temporal blast', 'https://magenoir.com/collection/EN/arcane/Temporal-blast.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('cape galactique', 'Ne peut être préparé que par un Mage Noir. Lorsque vous devriez piocher lors de votre phase de pioche, à la place choisissez une carte dans votre défausse et mettez-la dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Cape-galactique.png', 'fr', 'Cape galactique', 'https://magenoir.com/collection/FR/arcane/Cape-galactique.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('cape galactique', 'Can only be prepared by a Mage Noir. When you would draw during your draw phase, return a spell from your discard pile to your hand instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Galactic-mantle.png', 'en', 'Galactic mantle', 'https://magenoir.com/collection/EN/arcane/Galactic-mantle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('chaos', 'Regardez la carte du dessus de votre deck. Si c''est un Équipement, un Permanent, ou un Rituel, mettez-la à la défausse. Autrement, appliquez ses effets et défaussez-la. Puis l''adversaire fait de même. Si aucun joueur n''a perdu de Point de Vie, relancez les effets de ce sort.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Chaos.png', 'fr', 'Chaos', 'https://magenoir.com/collection/FR/arcane/Chaos.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('chaos', 'Look at the top card of your deck. If it''s Equipment, a Permanent or a Ritual, put it in your discard pile. Else, apply its effects and discard it. Then the opponent does the same. If no player lost any Health Points, apply the effects of this spell again.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Chaos.png', 'en', 'Chaos', 'https://magenoir.com/collection/EN/arcane/Chaos.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('connaissance de l histoire', 'Activez les effets d''1 sort de votre défausse. Si vous êtes Mage Noir, les effets du composant Temps utilisé pour Connaissance de l''Histoire s''appliquent aussi à ce sort. Si Connaissance de l''Histoire est activé depuis votre défausse, il ne peut cibler que les sorts situés en-dessous de celui-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Connaisance-de-l-histoire.png', 'fr', 'Connaissance de l''Histoire', 'https://magenoir.com/collection/FR/arcane/Connaissance-de-l-histoire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('connaissance de l histoire', 'Apply the effects of 1 spell in your discard pile. If you''re a Mage Noir, the effects of the Time component used to prepare Knowledge of history are also applied to this spell. If Knowledge of history is activated from your discard pile, it can only target spells that are located underneath it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Knowledge-of-history.png', 'en', 'Knowledge of history', 'https://magenoir.com/collection/EN/arcane/Knowledge-of-history.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('destin differe', 'Vous pouvez utiliser 1 composant Temps supplémentaire pour le prochain sort que vous préparez ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Destin-differe.png', 'fr', 'Destin différé', 'https://magenoir.com/collection/FR/arcane/Destin-differe.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('destin differe', 'You may use 1 additional Time component for the next spell you prepare this turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Delayed-fate.png', 'en', 'Delayed fate', 'https://magenoir.com/collection/EN/arcane/Delayed-fate.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('heaume galactique', 'Lorsque vous préparez un sort dont le coût en Mana Arcane est supérieur ou égal à 3, celui-ci coûte 1 Mana Arcane de moins (ou 2 de moins si vous êtes Mage Noir).À tout moment, vous pouvez regarder la carte du dessous de votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/heaume_galactique.png', 'fr', 'Heaume galactique', 'https://magenoir.com/collection/FR/arcane/Heaume-galactique.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('heaume galactique', 'Spells with an Arcane Mana cost of 3 or greater cost 1 less Arcane Mana to prepare (or 2 if you''re a Mage Noir).At any time, you may look at the bottom card of your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/galactic_helm.png', 'en', 'Galactic helm', 'https://magenoir.com/collection/EN/arcane/Galactic-helm.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('inception', 'Renvoyez 1 sort de la défausse de l''adversaire dans sa main.Si vous êtes Mage Noir, et s''il est canalisable, vous pouvez décider de le renvoyer en jeu canalisé pour votre adversaire à la place. (Équipements, Permanents, et Rituels ne sont pas canalisables)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/inception.png', 'fr', 'Inception', 'https://magenoir.com/collection/FR/arcane/Inception.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('inception', 'Return 1 spell from the opponent''s discard pile to their hand.If you''re a Mage Noir, and if it can be channeled, you may put it in play channeled as a component instead (Equipement, Permanents, and Rituals cannot be channeled).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/inception.png', 'en', 'Inception', 'https://magenoir.com/collection/EN/arcane/Inception.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('infiltration temporelle', 'Déphase 3 l''adversaire.(Défausse 3 cartes du dessous de son deck )Si vous êtes Mage Noir, Déphase 3 le joueur de votre choix à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/infiltration_temporelle.png', 'fr', 'Infiltration temporelle', 'https://magenoir.com/collection/FR/arcane/Infiltration-temporelle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('infiltration temporelle', 'Phase out the opponent by 3. (Discard 3 cards from the bottom of their deck)If you''re a Mage Noir, phase out any player by 3 instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/temporal_infiltration.png', 'en', 'Temporal infiltration', 'https://magenoir.com/collection/EN/arcane/Temporal-infiltration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('inspiration brillante', 'Piochez 2 cartes, puis défaussez-vous d''1 carte en main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Inspiration-brillante.png', 'fr', 'Inspiration brillante', 'https://magenoir.com/collection/FR/arcane/Inspiration-brillante.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('inspiration brillante', 'Draw 2 cards, then discard 1 card from hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Brilliant-inspiration.png', 'en', 'Brilliant inspiration', 'https://magenoir.com/collection/EN/arcane/Brilliant-inspiration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('millenaire', 'Transmutable : TempsVous ne pouvez pas contrôler ce sort si votre deck contient plus de 4 cartes. Si votre deck contient plus de 4 cartes tandis que Millénaire est en jeu, défaussez-le.Ajoutez 10 à chaque nombre présent dans l''effet de tout sort utilisant ce composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/millenaire.png', 'fr', 'Millénaire', 'https://magenoir.com/collection/FR/arcane/Millenaire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('millenaire', 'Transmutable : TimeYou cannot control this spell if there are more than 4 cards in your deck.If there are more than 4 cards in your deck while this is in play, discard it right away.Add 10 to every number in the effect of any spell using this as a component.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/millenium.png', 'en', 'Millennium', 'https://magenoir.com/collection/EN/arcane/Millennium.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('milliseconde', 'Transmutable : Temps Réduisez de 1 chaque nombre présent dans l''effet de tout sort utilisant ce composant (0 si vous êtes Mage Noir).Tout sort utilisant ce sort comme composant gagne : "Rapide" ( Vous pouvez activer ce sort à tout moment )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/milliseconde.png', 'fr', 'Milliseconde', 'https://magenoir.com/collection/FR/arcane/Milliseconde.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('milliseconde', 'Transmutable : TimeReduce every number in the effect of any spell using this as a component by 1 (0 if you''re a Mage Noir). Any spell using this as a component gains: "Quickcast". (This spell can be activated at any time)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/millisecond.png', 'en', 'Millisecond', 'https://magenoir.com/collection/EN/arcane/Millisecond.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('montre de nikola', 'Lorsque vous piochez une carte, Déphase 1 l''adversaire (Défausse 1 carte du dessous de son deck ).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/montre_de_nikola.png', 'fr', 'Montre de Nikola', 'https://magenoir.com/collection/FR/arcane/Montre-de-nikola.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('montre de nikola', 'Whenever you draw a card, phase out the opponent by 1. (Discard 1 card from the bottom of their deck)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/nikola_s_watch.png', 'en', 'Nikola''s watch', 'https://magenoir.com/collection/EN/arcane/Nikola-s-watch.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('paradoxe temporel', 'Inflige 0 points de dégâts à n''importe quelle cible. Si vous êtes Mage Noir, vous pouvez préparer cette carte depuis votre défausse une fois par tour.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Paradoxe-temporel.png', 'fr', 'Paradoxe temporel', 'https://magenoir.com/collection/FR/arcane/Paradoxe-temporel.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('paradoxe temporel', 'Inflicts 0 damage to any target. If you''re a Mage Noir, you may play this card from your discard pile once per turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Temporal-paradox.png', 'en', 'Temporal paradox', 'https://magenoir.com/collection/EN/arcane/Temporal-paradox.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rappel au present', 'Inflige 1 point de dégâts à n''importe quelle cible pour chaque composant Temps dans votre défausse. Défaussez TOUS les sorts en jeu ne verrouillant aucune Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Rappel-au-present.png', 'fr', 'Rappel au présent', 'https://magenoir.com/collection/FR/arcane/Rappel-au-present.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rappel au present', 'Inflicts 1 damage to any target for every Time component in your discard pile. Discard EVERY spell in play without Mana locked under it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Callback-to-present.png', 'en', 'Callback to present', 'https://magenoir.com/collection/EN/arcane/Callback-to-present.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('recuperation temporelle', 'Si vous êtes Mage Noir, ce sort coûte 1 Mana Eau de moins à préparer. Choisissez jusqu''à 3 composants Temps dans votre défausse et mettez-les en jeu, canalisés comme composants.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Recuperation-temporelle.png', 'fr', 'Récupération temporelle', 'https://magenoir.com/collection/FR/arcane/Recuperation-temporelle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('recuperation temporelle', 'If you''re a Mage Noir, this spell costs 1 less Water Mana to prepare. Put up to 3 Time components from your discard pile into play channeled as components.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Temporal-salvage.png', 'en', 'Temporal salvage', 'https://magenoir.com/collection/EN/arcane/Temporal-salvage.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('reflexion abstruse', 'Déphase 0 l''adversaire. (Défausse 0 cartes du dessous de son deck )Déphase 0 l''adversaire. (Défausse 0 cartes du dessous de son deck )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/reflexion_abstruse.png', 'fr', 'Réflexion abstruse', 'https://magenoir.com/collection/FR/arcane/Reflexion-abstruse.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('reflexion abstruse', 'Phase out any player by 0. (Discard 0 cards from the bottom of their deck)Phase out any player by 0. (Discard 0 cards from the bottom of their deck)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/abstruse_reflection.png', 'en', 'Abstruse reflection', 'https://magenoir.com/collection/EN/arcane/Abstruse-reflection.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('retour a l origine', 'Le joueur de votre choix renvoie les 10 cartes du dessus de sa défausse dans son deck, puis le mélange. Tant que ce sort est dans votre défausse, si vous êtes Mage Noir, vous pouvez payer 2 Mana Arcane pour renvoyer ce sort dans votre deck, puis mélanger votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/retour_a_l_origine.png', 'fr', 'Retour à l''origine', 'https://magenoir.com/collection/FR/arcane/Retour-a-l-origine.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('retour a l origine', 'Return the top 10 cards of any player''s discard pile to their deck, then they shuffle their deck.While this spell is in your discard pile, if you''re a Mage Noir, you may pay 2 Arcane Mana to return this card to your deck, then shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/return_to_the_origin.png', 'en', 'Return to the origin', 'https://magenoir.com/collection/EN/arcane/Return-to-the-origin.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('revocation', 'Ne peut être préparé que par un Mage Noir.Rapide (Ce sort peut être activé à tout moment)Défaussez 1 sort en préparation.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/revocation.png', 'fr', 'Révocation', 'https://magenoir.com/collection/FR/arcane/Revocation.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('revocation', 'Can only be prepared by a Mage Noir.Quickcast (This spell can be activated at any time)Discard 1 prepared spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/revocation.png', 'en', 'Revocation', 'https://magenoir.com/collection/EN/arcane/Revocation.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rite de passage', 'Vous passez Mage Noir.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Rite-de-passage.png', 'fr', 'Rite de passage', 'https://magenoir.com/collection/FR/arcane/Rite-de-passage.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rite de passage', 'You become a Mage Noir.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Rite-of-passage.png', 'en', 'Rite of passage', 'https://magenoir.com/collection/EN/arcane/Rite-of-passage.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rite de phase', 'Vous passez Mage Noir.Lorsque ce sort arrive en jeu, votre adversaire met sa défausse dans son deck et le mélange.Vos effets de Déphase sont augmentés de 1.Lorsque vous déphasez votre adversaire, infligez-lui 1 point de dégâts.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/rite_de_phase.png', 'fr', 'Rite de Phase', 'https://magenoir.com/collection/FR/arcane/Rite-de-phase.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rite de phase', 'You become a Mage Noir.When put into play, the opponent puts their discard pile into their deck and shuffles it.Your Phase out effects are increased by 1.When you phase out the opponent, inflict 1 damage to them.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/rite_of_phase.png', 'en', 'Rite of phase', 'https://magenoir.com/collection/EN/arcane/Rite-of-phase.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du savoir', 'Vous passez Mage Noir. Au début de votre tour, défaussez la carte du dessus de votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Rituel-du-savoir.png', 'fr', 'Rituel du savoir', 'https://magenoir.com/collection/FR/arcane/Rituel-du-savoir.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du savoir', 'You become a Mage Noir. At the beginning of your turn, discard the top card of your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Knowledge-ritual.png', 'en', 'Knowledge ritual', 'https://magenoir.com/collection/EN/arcane/Knowledge-ritual.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ronces temporelles', 'Déphase 2 l''adversaire (Défausse 2 cartes du dessous de son deck).S''il est Mage Noir, il peut choisir de perdre 4 Points de Vie à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/ronces_temporelles.png', 'fr', 'Ronces temporelles', 'https://magenoir.com/collection/FR/arcane/Ronces-temporelles.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ronces temporelles', 'Phase out the opponent by 2. (Discard 2 cards from the bottom of their deck)If they are a Mage Noir, they may choose to lose 4 HP instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/temporal_brambles.png', 'en', 'Temporal brambles', 'https://magenoir.com/collection/EN/arcane/Temporal-brambles.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('saut dans le temps', 'Déphase 1 n''importe quel joueur. (Défausse 1 carte du dessous de son deck )Ajoutez dans l''Éther Disponible la Mana correspondant au coût des cartes ainsi déphasées (cette Mana provient de l''Éther Infini).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/saut_dans_le_temps.png', 'fr', 'Saut dans le temps', 'https://magenoir.com/collection/FR/arcane/Saut-dans-le-temps.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('saut dans le temps', 'Phase out the opponent by 1.(Discard 1 card from the bottom of their deck)Take the Mana cost of any cards phased out this way from the Infinite Ether and add it to the Available Ether.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/leap_in_time.png', 'en', 'Leap in time', 'https://magenoir.com/collection/EN/arcane/Leap-in-time.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('sceptre galactique', 'Au début de votre tour, inflige 1 point de dégâts à n''importe quelle cible. Vous pouvez détruire cet Équipement pour aller chercher 1 Équipement Galactique dans votre deck, le montrer à l''adversaire, le mettre dans votre main et mélanger votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Sceptre-galactique.png', 'fr', 'Sceptre galactique', 'https://magenoir.com/collection/FR/arcane/Sceptre-galactique.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('sceptre galactique', 'At the beginning of your turn, inflicts 1 damage to any target. You may destroy this Equipment from play to take 1 Galactic Equipment card from your deck, show it to the opponent, put it in your hand and shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Galactic-scepter.png', 'en', 'Galactic scepter', 'https://magenoir.com/collection/EN/arcane/Galactic-scepter.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('seconde divisee', 'Transmutable : Temps (Ce sort est utilisable comme composant Temps.) Soustrayez 1 à chaque chiffre présent dans l''effet de tout sort utilisant ce composant. Si vous êtes Mage Noir, ajoutez 1 à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Seconde-divisee.png', 'fr', 'Seconde divisée', 'https://magenoir.com/collection/FR/arcane/Seconde-divisee.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('seconde divisee', 'Transmutable : Time (This spell can be used as a Time component.) Subtract 1 from every number in the effect of any spell using this as a component. If you''re a Mage Noir, add 1 instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Split-second.png', 'en', 'Split second', 'https://magenoir.com/collection/EN/arcane/Split-second.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('siecle', 'Transmutable : Temps (Ce sort est utilisable comme composant Temps.) Après que ce sort est utilisé comme composant, défaussez-le. Doublez chaque chiffre présent dans l''effet de tout sort utilisant ce composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Siecle.png', 'fr', 'Siècle', 'https://magenoir.com/collection/FR/arcane/Siecle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleurs de ronces', 'Lorsqu''un Permanent avec des PV que vous contrôlez subit des dégâts, inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleurs_de_ronces.png', 'fr', 'Fleurs de ronces', 'https://magenoir.com/collection/FR/vegetal/Fleurs-de-ronces.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('siecle', 'Transmutable : Time (This spell can be used as a Time component.) After this spell is used as a component, discard it. Double every number in the effect of any spell using this as a component.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/Century.png', 'en', 'Century', 'https://magenoir.com/collection/EN/arcane/Century.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('suppression dimensionnelle', 'Défaussez 1 sort en préparation.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/Suppression-dimensionnelle.png', 'fr', 'Suppression dimensionnelle', 'https://magenoir.com/collection/FR/arcane/Suppression-dimensionnelle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('suppression dimensionnelle', 'Discard 1 prepared spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/dimensional-deletion.png', 'en', 'Dimentional deletion', 'https://magenoir.com/collection/EN/arcane/Dimensional-deletion.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('temps destructure', 'Tout sort utilisant ce sort comme composant gagne l''effet :"Déphase 1 l''adversaire (Défausse 1 carte du dessous de son deck )"', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Arcane/temps_destructure.png', 'fr', 'Temps déstructuré', 'https://magenoir.com/collection/FR/arcane/Temps-destructure.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('temps destructure', 'Any spell using this as a component gains: "Phase out the opponent by 1". (Discard 1 card from the bottom of their deck)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/arcane/unstructured_time.png', 'en', 'Unstructured time', 'https://magenoir.com/collection/EN/arcane/Unstructured-time.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('anneau d azur', 'Au début de votre tour, choississez 1 option : - Vous gagnez 1 Point de Vie. - Si vous êtes Mage Noir, vous pouvez placer 1 Mana de votre réserve sous 1 sort que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Anneau-d-azur.png', 'fr', 'Anneau d''azur', 'https://magenoir.com/collection/FR/water/Anneau-d-azur.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('anneau d azur', 'At the beginning of your turn, choose 1 option: - You gain 1 Health Point. - If you''re a Mage Noir, you may put 1 Mana from your Mana reserve under 1 spell you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Azure-ring.png', 'en', 'Azure ring', 'https://magenoir.com/collection/EN/water/Azure-ring.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre de glace', 'Au début de votre tour, choisissez 1 Permanent ou Équipement : il n''applique pas ses effets jusqu''au début de votre prochain tour.Puis, Arbre de glace perd 1 PV.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/arbre_de_glace.png', 'fr', 'Arbre de glace', 'https://magenoir.com/collection/FR/water/Arbre-de-glace.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre de glace', 'At the beginning of your turn, choose 1 Permanent or piece of Equipment. It stops applying its effects until the beginning of your next turn.Then, Ice tree loses 1 HP.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ice_tree.png', 'en', 'Ice tree', 'https://magenoir.com/collection/EN/water/Ice-tree.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('brinicle', 'À la fin du tour de l''adversaire, Brinicle lui inflige 1 point de dégâts par Mana Eau dans sa réserve de Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/brinicle.png', 'fr', 'Brinicle', 'https://magenoir.com/collection/FR/water/Brinicle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('brinicle', 'At the end of the opponent''s turn, Brinicle inflicts 1 damage to them for each Water Mana in their Mana reserve.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/brinicle.png', 'en', 'Acceleration', 'https://magenoir.com/collection/EN/water/Brinicle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('condensation', 'Tant que ce sort est en préparation, au début de votre tour, mettez 1 Mana Eau de l''Éther Infini sous ce sort. Lorsque vous l''activez, répartissez la Mana verrouillée sous Condensation entre votre réserve de Mana et vos sorts.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Condensation.png', 'fr', 'Condensation', 'https://magenoir.com/collection/FR/water/Condensation.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('condensation', 'While in preparation: At the start of your turn, lock 1 Water Mana from the Infinite Ether under this spell. When activated, distribute the Mana locked under this spell between your Mana reserve and your spells.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Condensation.png', 'en', 'Condensation', 'https://magenoir.com/collection/EN/water/Condensation.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('echarde de glace', 'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Inflige 2 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/echarde_de_glace.png', 'fr', 'Écharde de glace', 'https://magenoir.com/collection/FR/water/Echarde-de-glace.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('echarde de glace', 'Slowcast (This spell can''t be activated on the turn it was prepared) Inflicts 2 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ice_shard.png', 'en', 'Ice shard', 'https://magenoir.com/collection/EN/water/Ice-shard.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('engloutissement', 'Détruisez 1 Permanent ou 1 Équipement.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Engloutissement.png', 'fr', 'Engloutissement', 'https://magenoir.com/collection/FR/water/Engloutissement.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('engloutissement', 'Destroy 1 Permanent or 1 piece of Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Engulfment.png', 'en', 'Engulfment', 'https://magenoir.com/collection/EN/water/Engulfment.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ere glaciaire', 'Ne peut être préparé que par un Mage Noir.Vous pouvez préparer ce sort sans le composant Temps requis.Les effets de dégâts de vos sorts Eau sont augmentés de 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/ere_glaciaire.png', 'fr', 'Ère glaciaire', 'https://magenoir.com/collection/FR/water/Ere-glaciaire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ere glaciaire', 'Can only be prepared by a Mage Noir.You may prepare this spell without the required Time component.Damage from Water spells you control is increased by 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/glacial_age.png', 'en', 'Glacial age', 'https://magenoir.com/collection/EN/water/Glacial-age.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleche mordante', 'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Inflige 1 point de dégâts à n''importe quelle cible.Lorsque ce sort doit aller depuis le plateau vers la défausse, vous pouvez payer 1 Mana Eau pour le renvoyer dans votre main à la place.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/fleche_mordante.png', 'fr', 'Flèche mordante', 'https://magenoir.com/collection/FR/water/Fleche-mordante.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleche mordante', 'Slowcast (This spell can''t be activated on the turn it was prepared) Inflicts 1 damage to any target.If this spell would be discarded from play, you may pay 1 Water Mana to return it to your hand instead.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/biting_arrow.png', 'en', 'Biting arrow', 'https://magenoir.com/collection/EN/water/Biting-arrow.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flocon de neige', 'Transmutable : Glace, GoutteMettez 1 Mana Eau verrouillée par ce sort sous un autre sort que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/flocon_de_neige_1.png', 'fr', 'Flocon de neige', 'https://magenoir.com/collection/FR/water/Flocon-de-neige.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flocon de neige', 'Transmutable : Ice, DropPut 1 Water Mana locked under this spell under another spell you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/snowflake_1.png', 'en', 'Snowflake', 'https://magenoir.com/collection/EN/water/Snowflake.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('goutte d eau', 'Tant que ce sort est canalisé comme composant, une fois par tour, peut être considéré par un autre sort comme étant 2 composants Goutte. Si vous êtes Mage Noir, compte toujours comme 2 composants Goutte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Goutte-d-eau.png', 'fr', 'Goutte d''eau', 'https://magenoir.com/collection/FR/water/Goutte-d-eau.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('goutte d eau', 'When channeled, once per turn, may be counted by another spell as 2 Drop components. If you''re a Mage Noir, it is always counted as 2 Drop components.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Water-drop.png', 'en', 'Water drop', 'https://magenoir.com/collection/EN/water/Water-drop.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('gouttelette', 'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Gouttelette.png', 'fr', 'Gouttelette', 'https://magenoir.com/collection/FR/water/Gouttelette.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('gouttelette', 'Transmutable : Drop (This spell can be used as a Drop component.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Droplet.png', 'en', 'Droplet', 'https://magenoir.com/collection/EN/water/Droplet.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('grandes eaux', 'Inflige 1 point de dégâts à n''importe quelle cible par composant Eau actuellement sur le plateau (Permanents et Équipements exclus).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Grandes-eaux.png', 'fr', 'Grandes eaux', 'https://magenoir.com/collection/FR/water/Grandes-eaux.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('grandes eaux', 'Inflicts 1 damage to any target for each Water component in play (Permanents and Equipment excluded).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Great-waters.png', 'en', 'Great waters', 'https://magenoir.com/collection/EN/water/Great-waters.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('haute pression', 'Inflige X points de dégâts à n''importe quelle cible. X est égal au nombre de Mana verrouillées sous un composant Condensation que vous contrôlez. Ce composant Condensation retourne dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Haute-pression.png', 'fr', 'Haute pression', 'https://magenoir.com/collection/FR/water/Haute-pression.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('haute pression', 'Inflicts X damage to any target, where X is the amount of Mana locked under a Condensation component you control. Return that component to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/High-pressure.png', 'en', 'High pressure', 'https://magenoir.com/collection/EN/water/High-pressure.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('hiver percant', 'Pour chaque carte que votre adversaire pioche, cet Équipement lui inflige 1 point de dégâts.Au début de votre tour, Hiver perçant libère 1 Mana Eau.Détruisez cet Équipement dès qu''il ne verrouille plus de Mana Eau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/hiver_percant.png', 'fr', 'Hiver perçant', 'https://magenoir.com/collection/FR/water/Hiver-percant.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('hiver percant', 'Inflicts 1 damage to the opponent every time they draw a card.At the beginning of your turn, releases 1 Water Mana.Discard Piercing winter as soon as there''s no Water Mana locked under it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/piercing_winter.png', 'en', 'Piercing winter', 'https://magenoir.com/collection/EN/water/Piercing-winter.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('infiltration glaciale', 'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Ce tour-ci, les dégâts des sorts Eau que vous contrôlez sont réduits de 1.Ces dégâts ne peuvent pas être ignorés, réduits, ni redirigés ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/infiltration_glaciale.png', 'fr', 'Infiltration glaciale', 'https://magenoir.com/collection/FR/water/Infiltration-glaciale.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('infiltration glaciale', 'Slowcast (This spell can''t be activated on the turn it was prepared) This turn, damage from Water spells you control is reduced by 1.This damage can''t be ignored, reduced or redirected this turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/icy_infiltration.png', 'en', 'Icy infiltration', 'https://magenoir.com/collection/EN/water/Icy-infiltration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('infiltration subtile', 'A chaque fois que vous échangez de la Mana Eau avec l''Ether Disponible, inflige 1 point de dégâts à l''adversaire, puis libère 1 Mana verrouillée par ce sort. Dès qu''il ne verrouille plus de Mana, détruisez ce sort, puis vous pouvez prendre jusqu''à 2 Mana Eau dans l''Ether disponible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Infiltration-subtile.png', 'fr', 'Infiltration-subtile', 'https://magenoir.com/collection/FR/water/Infiltration-subtile.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('infiltration subtile', 'Every time you trade Water Mana with the Available Ether, inflict 1 damage to the opponent and release 1 Mana locked under this spell. Discard this Permanent as soon as there''s no Mana locked under it, then you may take up to 2 Water Mana from the Available Ether.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Subtle-infiltration.png', 'en', 'Subtle infiltration', 'https://magenoir.com/collection/EN/water/Subtle-infiltration.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('la guerisseuse de l eau', 'La cible de votre choix gagne 3 Points de Vie. Reprenez 1 sort de votre défausse dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/La-guerisseuse-de-l-eau.png', 'fr', 'La guérisseuse de l''eau', 'https://magenoir.com/collection/FR/water/La-guerisseuse-de-l-eau.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('la guerisseuse de l eau', 'Any target gains 3 Health Points. Return 1 spell from your discard pile to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/The-water-healer.png', 'en', 'The water healer', 'https://magenoir.com/collection/EN/water/The-water-healer.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lances de l hiver', 'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Ne peut jamais être Lent tant que vous êtes Mage Noir.Ce sort libère 2 Mana Eau.Inflige 3 points de dégâts à n''importe quelle cible (ou 5 si ce sort verrouille au moins 1 Mana Eau).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/lances_de_l_hiver.png', 'fr', 'Lances de l''hiver', 'https://magenoir.com/collection/FR/water/Lances-de-l-hiver.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lances de l hiver', 'Slowcast (This spell can''t be activated on the turn it was prepared) This spell can never have Slowcast as long as you''re a Mage Noir.Releases 2 Water Mana.Inflicts 3 damage to any target (or 5 if this spell locks at least 1 Water Mana).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/winter_spears.png', 'en', 'Winter spears', 'https://magenoir.com/collection/EN/water/Winter-spears.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('maelstrom', 'À la fin de leur tour, les joueurs mettent la Mana de leur réserve de Mana dans l''Ether Disponible. Au début de votre tour, détruisez Maelström.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Maelstrom.png', 'fr', 'Maelström', 'https://magenoir.com/collection/FR/water/Maelstrom.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('maelstrom', 'At the end of their turns, players put all the Mana from their Mana reserve into the Available Ether. At the beginning of your turn, destroy Maelström.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Maelstrom.png', 'en', 'Maelström', 'https://magenoir.com/collection/EN/water/Maelstrom.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('maree', 'Piochez 1 carte, puis défaussez-vous d''1 carte en main. Mettez la Mana verrouillée par ce sort sous un autre sort que vous contrôlez. Puis vous pouvez payer 1 Mana Eau pour aller chercher 1 carte Marée dans votre défausse, et la mettre dans votre main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Maree.png', 'fr', 'Marée', 'https://magenoir.com/collection/FR/water/Maree.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('maree', 'Draw 1 card, then discard 1 card from hand. Put the Mana locked under this spell under another spell you control. Then you may pay 1 Water Mana to return 1 Tide spell from your discard pile to your hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Tide.png', 'en', 'Tide', 'https://magenoir.com/collection/EN/water/Tide.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('meteore de cristal', 'Inflige 2 points de dégâts à n''importe quelle cible.Les dégâts infligés sont augmentés de 1 par composant Glace que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/meteore_de_cristal.png', 'fr', 'Météore de cristal', 'https://magenoir.com/collection/FR/water/Meteore-de-cristal.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('meteore de cristal', 'Inflicts 2 damage to any target.This damage is increased by 1 for each Ice component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/crystal_meteor.png', 'en', 'Crystal meteor', 'https://magenoir.com/collection/EN/water/Crystal-meteor.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mur de glace', 'Ce Permanent a Protecteur tant qu''il verrouille de la Mana Eau.Au début de votre tour, libère 1 Mana Eau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/mur_de_glace.png', 'fr', 'Mur de glace', 'https://magenoir.com/collection/FR/water/Mur-de-glace.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mur de glace', 'As long as it locks Water Mana, this Permanent has Protector.At the beginning of your turn, releases 1 Water Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ice_wall.png', 'en', 'Ice wall', 'https://magenoir.com/collection/EN/water/Ice-wall.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ocean dechaine', 'Au début de votre tour, vos composants Vague appliquent leurs effets. Puis, ce sort libère 1 Mana Eau pour chaque composant Vague que vous contrôlez. Détruisez ce sort dès qu''il ne verrouille plus de Mana Eau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Ocean-dechaine.png', 'fr', 'Océan déchaîné', 'https://magenoir.com/collection/FR/water/Ocean-dechaine.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ocean dechaine', 'At the beginning of your turn, your Wave components apply their effects. Then, this spell releases 1 Water Mana for each Wave component you control. Discard this Permanent as soon as there''s no Water Mana locked under it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Unleashed-ocean.png', 'en', 'Unleashed ocean', 'https://magenoir.com/collection/EN/water/Unleashed-ocean.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du melange', 'Vous passez Mage Noir. Lorsque vous ajoutez de la Mana à l''Éther disponible durant votre phase de récupération de Mana, ajoutez 1 Mana de moins. Durant votre phase principale, vous pouvez échanger la Mana verrouillée sous vos sorts Eau et celle de votre réserve de Mana à 1 pour 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Rituel-du-melange.png', 'fr', 'Rituel du Mélange', 'https://magenoir.com/collection/FR/water/Rituel-du-melange.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du melange', 'You become a Mage Noir. When you add Mana to the Available Ether during your Mana gathering phase, add 1 less Mana. During your main phase, you may trade Mana between your Mana reserve and your Water spells at a rate of 1 for 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Ritual-of-melange.png', 'en', 'Ritual of Mélange', 'https://magenoir.com/collection/EN/water/Ritual-of-melange.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du zero absolu', 'Vous passez Mage Noir.TOUS les sorts gagnent : "Lent" (Ces sort ne peuvent pas être activés le tour durant lequel ils ont été préparés ).TOUS les sorts peuvent être préparés pour 1 Mana Eau supplémentaire afin qu''ils n''aient pas Lent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/rituel_du_zero_absolu.png', 'fr', 'Rituel du zéro absolu', 'https://magenoir.com/collection/FR/water/Rituel-du-zero-absolu.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du zero absolu', 'You become a Mage Noir.ALL spells gain: "Slowcast". (You cannot activate these spells on the same turn they were prepared)ALL spells can be prepared for 1 additional Water Mana so that they don''t have Slowcast.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ritual_of_absolute_zero.png', 'en', 'Ritual of absolute zero', 'https://magenoir.com/collection/EN/water/Ritual-of-absolute-zero.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('robe de yuki onna', 'Pour chaque carte que votre adversaire pioche, il paye 1 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/robe_de_yuki_onna.png', 'fr', 'Robe de Yuki-Onna', 'https://magenoir.com/collection/FR/water/Robe-de-yuki-onna.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('robe de yuki onna', 'Each time the opponent draws a card, they pay 1 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/yuki_onna_s_robe.png', 'en', 'Yuki-Onna''s robe', 'https://magenoir.com/collection/EN/water/Yuki-onna-s-robe.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle brume', 'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.) Renvoyez 3 cartes de votre défausse dans votre deck, puis mélangez votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Souffle-brume.png', 'fr', 'Souffle brume', 'https://magenoir.com/collection/FR/water/Souffle-brume.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle brume', 'Transmutable : Drop (This spell can be used as a Drop component.) Return 3 cards from your discard pile to your deck, then shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Mist-breath.png', 'en', 'Mist breath', 'https://magenoir.com/collection/EN/water/Mist-breath.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle de glace', 'Jusqu''au début de votre prochain tour, les sorts du joueur ciblé coûtent 1 Mana Eau supplémentaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/souffle_de_glace.png', 'fr', 'Souffle de glace', 'https://magenoir.com/collection/FR/water/Souffle-de-glace.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('souffle de glace', 'Until the beginning of your next turn, target player''s spells cost 1 more Water Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/ice_breath.png', 'en', 'Ice breath', 'https://magenoir.com/collection/EN/water/Ice-breath.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('source prodigieuse', 'Vos composants Eau sont comptés 1 fois de plus (Permanents exclus).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Source-prodigieuse.png', 'fr', 'Source prodigieuse', 'https://magenoir.com/collection/FR/water/Source-prodigieuse.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('source prodigieuse', 'Each of your Water components counts as 1 additional instance of that component (Permanents excluded).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Prodigious-source.png', 'en', 'Prodigious source', 'https://magenoir.com/collection/EN/water/Prodigious-source.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tsunami', 'Détruisez tous les Permanents de l''adversaire.Inflige 8 points de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Tsunami.png', 'fr', 'Tsunami', 'https://magenoir.com/collection/FR/water/Tsunami.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tsunami', 'Destroy all of the opponent''s PermanentsInflicts 8 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Tsunami.png', 'en', 'Tsunami', 'https://magenoir.com/collection/EN/water/Tsunami.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague deferlante', 'Inflige 3 points de dégâts à n''importe quelle cible (ou 4 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Vague-deferlante.png', 'fr', 'Vague déferlante', 'https://magenoir.com/collection/FR/water/Vague-deferlante.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague deferlante', 'Inflicts 3 damage to any target (or 4 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Surging-wave.png', 'en', 'Surging wave', 'https://magenoir.com/collection/EN/water/Surging-wave.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague echo', 'Applique les effets d''1 composant Vague que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Vague-echo.png', 'fr', 'Vague écho', 'https://magenoir.com/collection/FR/water/Vague-echo.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague echo', 'Apply the effects of 1 Wave component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Wave-echo.png', 'en', 'Wave echo', 'https://magenoir.com/collection/EN/water/Wave-echo.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague mordante', 'Inflige 2 points de dégâts à n''importe quelle cible.Si vous êtes Mage Noir, verrouillez la Mana Eau de ce sort sous un autre sort que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/vague_mordante.png', 'fr', 'Vague mordante', 'https://magenoir.com/collection/FR/water/Vague-mordante.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague mordante', 'Inflicts 2 damage to any target.If you''re a Mage Noir, put the Mana locked under this spell under another spell you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/biting_wave.png', 'en', 'Biting wave', 'https://magenoir.com/collection/EN/water/Biting-wave.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague purificatrice', 'La cible de votre choix gagne 2 Points de Vie (ou 3 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Eau/Vague-purificatrice.png', 'fr', 'Vague purificatrice', 'https://magenoir.com/collection/FR/water/Vague-purificatrice.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague purificatrice', 'Any target gains 2 Health Points (or 3 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/water/Purifying-wave.png', 'en', 'Purifying wave', 'https://magenoir.com/collection/EN/water/Purifying-wave.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('anneau pourpre', 'Lorsque vous perdez des Points de Vie ou que des dégâts vous sont infligés, vous pouvez payer 1 Mana Feu pour infliger 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Anneau-pourpre.png', 'fr', 'Anneau pourpre', 'https://magenoir.com/collection/FR/fire/Anneau-pourpre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('anneau pourpre', 'Whenever you lose Health Points or damage is inflicted to you, you may pay 1 Fire Mana to inflict 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Crimson-ring.png', 'en', 'Crimson ring', 'https://magenoir.com/collection/EN/fire/Crimson-ring.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('aube', 'Tant que ce sort est en préparation, si un Soleil que vous contrôlez devait être détruit, défaussez ce sort à la place.Lorsque vous activez Aube, si vous êtes Mage Noir, piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/aube.png', 'fr', 'Aube', 'https://magenoir.com/collection/FR/fire/Aube.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('aube', 'While in preparation, if a Sun you control would be destroyed, discard this spell instead.When activated, if you''re a Mage Noir, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/dawn.png', 'en', 'Dawn', 'https://magenoir.com/collection/EN/fire/Dawn.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('boule de feu', 'Vous pouvez défausser 1 carte Feu depuis votre main pour préparer ce sort sans le composant Flamme requis. Inflige 2 points de dégâts à tous les permanents de l''adversaire. Puis inflige 2 points de dégâts à l''adversaire (ou 3 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Boule-de-feu.png', 'fr', 'Boule de feu', 'https://magenoir.com/collection/FR/fire/Boule-de-feu.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('boule de feu', 'You may discard 1 Fire card from your hand to prepare this spell without the required Flame component. Inflicts 2 damage to every Permanent your opponent controls. Then, inflicts 2 damage to the opponent (or 3 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fire-ball.png', 'en', 'Fire ball', 'https://magenoir.com/collection/EN/fire/Fire-ball.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('brulure solaire', 'Inflige 3 points de dégâts à n''importe quelle cible.Zénith: Défaussez 1 composant que vous contrôlez. Puis infligez 1 point de dégâts à l''adversaire. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/brulure_solaire.png', 'fr', 'Brulûre solaire', 'https://magenoir.com/collection/FR/fire/Brulure-solaire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('brulure solaire', 'Inflicts 3 damage to any target.Zenith: Discard 1 component you control. Then, inflict 1 damage to the opponent.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_burn.png', 'en', 'Solar burn', 'https://magenoir.com/collection/EN/fire/Solar-burn.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('catalyseur de soleil', 'Unique Zénith : Vos sorts Solaires coûtent 1 Mana Feu de moins à préparer. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/catalyseur_de_soleil.png', 'fr', 'Catalyseur de soleil', 'https://magenoir.com/collection/FR/fire/Catalyseur-de-soleil.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('catalyseur de soleil', 'UniqueZenith: Your Solar spells cost 1 less Fire Mana to prepare. (Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/sun_catalyst.png', 'en', 'Sun catalyst', 'https://magenoir.com/collection/EN/fire/Sun-catalyst.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('eblouissement', 'Si vous êtes Mage Noir, vous pouvez préparer ce sort sans le composant Lumière requis.Rapide (Vous pouvez activer ce sort à tout moment )Renvoyez 1 sort en préparation dans la main de son propriétaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/eblouissement.png', 'fr', 'Éblouissement', 'https://magenoir.com/collection/FR/fire/Eblouissement.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('eblouissement', 'If you''re a Mage Noir, you may prepare this spell without the required Light component.Quickcast (This spell can be activated at any time)Return 1 prepared spell to its owner''s hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/dazzle.png', 'en', 'Dazzle', 'https://magenoir.com/collection/EN/fire/Dazzle.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('eruption de magma', 'Inflige 7 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Magma-eruption.png', 'fr', 'Éruption de magma', 'https://magenoir.com/collection/FR/fire/Eruption-de-magma.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('eruption de magma', 'Inflicts 7 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Magma-eruption.png', 'en', 'Magma eruption', 'https://magenoir.com/collection/EN/fire/Magma-eruption.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('eruption solaire', 'Ce tour-ci, préparer les sorts suivants coûte 2 Mana de moins de l''élément du sort : Tornade, Engloutissement, Séisme, Mons Igneus, Maelström, Explosion.Quand vous préparez l''un de ces sorts, piochez une carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/eruption_solaire.png', 'fr', 'Éruption solaire', 'https://magenoir.com/collection/FR/fire/Eruption-solaire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('eruption solaire', 'This turn, preparing the following spells costs 2 less Mana of the spell''s element: Maelström, Tornado, Engulfment, Earthquake, Mons Igneus, Explosion.When you prepare one of these spells, draw a card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_eruption.png', 'en', 'Solar eruption', 'https://magenoir.com/collection/EN/fire/Solar-eruption.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('explosion solaire', 'Détruisez TOUS les Soleils.Zénith : Inflige 9 points de dégâts à n''importe quelle cible.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/explosion_solaire.png', 'fr', 'Explosion solaire', 'https://magenoir.com/collection/FR/fire/Explosion-solaire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('explosion solaire', 'Destroy ALL Suns.Zenith: Inflicts 9 damage to any target.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_explosion.png', 'en', 'Solar explosion', 'https://magenoir.com/collection/EN/fire/Solar-explosion.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fission', 'Vous pouvez défausser 1 carte Feu depuis votre main pour préparer ce sort sans le composant Flamme requis. Défaussez-vous d''1 carte en main. Détruisez 1 Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Fission.png', 'fr', 'Fission', 'https://magenoir.com/collection/FR/fire/Fission.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fission', 'You may discard 1 Fire card from your hand to prepare this spell without the required Flame component. Discard 1 card in hand. Destroy 1 Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fission.png', 'en', 'Fission', 'https://magenoir.com/collection/EN/fire/Fission.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme', 'Inflige 1 point de dégâts à n''importe quelle cible. Après que ce sort est utilisé comme composant, défaussez-le.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Flamme.png', 'fr', 'Flamme', 'https://magenoir.com/collection/FR/fire/Flamme.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme', 'Inflicts 1 damage to any target. After this spell is used as a component, discard it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Flame.png', 'en', 'Flame', 'https://magenoir.com/collection/EN/fire/Flame.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme de soufre', 'Ne peut être préparé que par un Mage Noir.Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Flamme-de-soufre.png', 'fr', 'Flamme de soufre', 'https://magenoir.com/collection/FR/fire/Flamme-de-soufre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme de soufre', 'Can only be prepared by a Mage Noir.Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Sulfur-flame.png', 'en', 'Sulfur flame', 'https://magenoir.com/collection/EN/fire/Sulfur-flame.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme draconique', 'Inflige 2 points de dégâts à n''importe quelle cible.Après que ce sort est utilisé comme composant, vous perdez 1 Point de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Flamme-draconique.png', 'fr', 'Flamme draconique', 'https://magenoir.com/collection/FR/fire/Flamme-draconique.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme draconique', 'Inflicts 2 damage to any target.After this spell is used as a component, you lose 1 Health Point.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Draconic-flame.png', 'en', 'Draconic flame', 'https://magenoir.com/collection/EN/fire/Draconic-flame.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme mentale', 'Tant que ce sort est canalisé comme composant :au début de votre tour, payez 1 Mana Feu ou défaussez ce sort.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Flamme-mentale.png', 'fr', 'Flamme mentale', 'https://magenoir.com/collection/FR/fire/Flamme-mentale.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme mentale', 'While channeled as a component:at the start of your turn, pay 1 Fire Mana or discard this spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Mental-flame.png', 'en', 'Mental flame', 'https://magenoir.com/collection/EN/fire/Mental-flame.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme solaire', 'Description à compléter', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/flamme_solaire.png', 'fr', 'Flamme solaire', 'https://magenoir.com/collection/FR/fire/Flamme-solaire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('flamme solaire', 'Description to complete', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_flame.png', 'en', 'Solar flame', 'https://magenoir.com/collection/EN/fire/Solar-flame.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleche ardente', 'Inflige 3 points de dégâts à l''adversaire (ou 4 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Fleche-ardente.png', 'fr', 'Flèche ardente', 'https://magenoir.com/collection/FR/fire/Fleche-ardente.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleche ardente', 'Inflicts 3 damage to the opponent (or 4 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fiery-arrow.png', 'en', 'Fiery arrow', 'https://magenoir.com/collection/EN/fire/Fiery-arrow.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fouet de feu', 'Au début de votre tour, inflige 1 point de dégâts à l''adversaire (ou 2 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Fouet-de-feu.png', 'fr', 'Fouet de feu', 'https://magenoir.com/collection/FR/fire/Fouet-de-feu.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fouet de feu', 'At the beginning of your turn, inflicts 1 damage to the opponent (or 2 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fire-whip.png', 'en', 'Fire whip', 'https://magenoir.com/collection/EN/fire/Fire-whip.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ignition', 'Si vous êtes Mage Noir, ce sort coûte 1 Mana Feu de moins à préparer. Ce tour-ci, à chaque fois qu''un sort va depuis le plateau vers la défausse, inflige 1 point de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Ignition.png', 'fr', 'Ignition', 'https://magenoir.com/collection/FR/fire/Ignition.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ignition', 'If you''re a Mage Noir, this spell costs 1 less Fire Mana to prepare. This turn, whenever a card goes from play to any discard pile, inflict 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Ignition.png', 'en', 'Ignition', 'https://magenoir.com/collection/EN/fire/Ignition.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('invocation solaire', 'Si le sort du dessus de votre défausse est canalisable, mettez-le en jeu, canalisé comme composant (Équipements, Permanent, et Rituels ne sont pas canalisables). Zénith : inflige 2 points de dégâts à n''importe quelle cible.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/invocation_solaire.png', 'fr', 'Invocation solaire', 'https://magenoir.com/collection/FR/fire/Invocation-solaire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('invocation solaire', 'If the top spell of your discard pile can be channeled, put it into play channeled. (Equipment, Permanents and Rituals cannot be channeled)Zenith: Inflicts 2 damage to any target.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_invocation.png', 'en', 'Solar invocation', 'https://magenoir.com/collection/EN/fire/Solar-invocation.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleurs de ronces', 'When a Permanent with HP you control takes damage, inflicts 1 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/bramble_flowers.png', 'en', 'Bramble flowers', 'https://magenoir.com/collection/EN/vegetal/Bramble-flowers.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lame du soleil', 'Au début de votre tour, libère 1 Mana Feu.Dès que Lame du soleil ne verrouille plus de Mana Feu, elle inflige 5 points de dégâts à TOUS les joueurs, puis elle est détruite.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/lame_du_soleil.png', 'fr', 'Lame du soleil', 'https://magenoir.com/collection/FR/fire/Lame-du-soleil.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lame du soleil', 'At the beginning of your turn, releases 1 Fire Mana.As soon as there''s no Fire Mana locked under Sun blade, it inflicts 5 damage to ALL players, then it is destroyed.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/sun_blade.png', 'en', 'Sun blade', 'https://magenoir.com/collection/EN/fire/Sun-blade.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lumiere radieuse', 'Regardez la carte du dessus de votre deck.Vous pouvez la laisser au-dessus, ou la mettre en dessous de votre deck.Puis piochez 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/lumiere_radieuse.png', 'fr', 'Lumière radieuse', 'https://magenoir.com/collection/FR/fire/Lumiere-radieuse.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lumiere radieuse', 'Look at the top card of your deck.You may leave it on top, or put it at the bottom of your deck.Then, draw 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/radiant_light.png', 'en', 'Radiant light', 'https://magenoir.com/collection/EN/fire/Radiant-light.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('masque de feu', 'A tout moment, vous pouvez regarder la carte du dessus de votre deck. Les composants nécessaires plusieurs fois pour préparer vos sorts Feu sont nécessaires 1 fois de moins.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Masque-de-feu.png', 'fr', 'Masque de feu', 'https://magenoir.com/collection/FR/fire/Masque-de-feu.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('masque de feu', 'At any time, you may look at the top card of your deck. Components needed multiple times to prepare your Fire spells are needed 1 less time.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Fire-mask.png', 'en', 'Fire mask', 'https://magenoir.com/collection/EN/fire/Fire-mask.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('minerai d or solaire', 'ForgeZénith : Indestructible (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )Tout Équipement qui utilise ce sort comme composant gagne les effets de Minerai d''or solaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/minerai_d_or_solaire.png', 'fr', 'Minerai d''or solaire', 'https://magenoir.com/collection/FR/fire/Minerai-d-or-solaire.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('minerai d or solaire', 'ForgeZenith: Indestructible (Only activates if you started this turn with an equal number of prepared and channeled spells)Any spell using this spell as a component gains the effects of Solar gold ore.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_gold_ore.png', 'en', 'Solar gold ore', 'https://magenoir.com/collection/EN/fire/Solar-gold-ore.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('pluie de flammes', 'Ne peut être préparé que par un Mage Noir.Inflige 5 points de dégâts, répartis comme vous le souhaitez entre 1 à 5 cibles.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Pluie-de-flammes.png', 'fr', 'Pluie de flammes', 'https://magenoir.com/collection/FR/fire/Pluie-de-flammes.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('pluie de flammes', 'Can only be prepared by a Mage Noir.Inflicts 5 damage distributed as you choose between 1 to 5 targets.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Rain-of-flames.png', 'en', 'Rain of flames', 'https://magenoir.com/collection/EN/fire/Rain-of-flames.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('projectile de flamme', 'Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Projectile-de-flamme.png', 'fr', 'Projectile de flamme', 'https://magenoir.com/collection/FR/fire/Projectile-de-flamme.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('projectile de flamme', 'Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Flame-projectile.png', 'en', 'Flame projectile', 'https://magenoir.com/collection/EN/fire/Flame-projectile.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rayon de lumiere', 'Le prochain sort Végétal que vous préparez ce tour-ci coûte 2 Mana Végétal de moins.Si c''est un Permanent avec PV, il arrive en jeu avec 1 PV supplémentaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/rayon_de_lumiere.png', 'fr', 'Rayon de lumière', 'https://magenoir.com/collection/FR/fire/Rayon-de-lumiere.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rayon de lumiere', 'The next Vegetal spell you prepare this turn costs 2 less Vegetal Mana.If it''s a Permanent with HP, it is put into play with 1 additional HP.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/light_ray.png', 'en', 'Light ray', 'https://magenoir.com/collection/EN/fire/Light-ray.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du zenith', 'Vous passez Mage Noir.Chaque fois qu''un sort que vous contrôlez est canalisé, payez 1 Mana Feu.Zénith : Durant votre phase principale, vous pouvez payer 1 Mana Feu pour activer 1 de vos sorts canalisés. (Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/rituel_du_zenith.png', 'fr', 'Rituel du Zénith', 'https://magenoir.com/collection/FR/fire/Rituel-du-zenith.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du zenith', 'You become a Mage Noir.Each time a spell you control is channeled, pay 1 Fire Mana.Zenith: During your main phase, you may pay 1 Fire Mana to activate 1 of your channeled spells.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/zenith_ritual.png', 'en', 'Zenith ritual', 'https://magenoir.com/collection/EN/fire/Zenith-ritual.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel pourpre', 'Lorsque ce sort arrive en jeu, perdez la moitié de vos Points de Vie actuels, arrondie à l''inférieur. Vous passez Mage Noir. Durant votre phase principale, vous pouvez perdre 1 PV pour prendre 1 Mana Feu dans l''Ether Infini et piocher 1 carte. (Vous pouvez le faire plusieurs fois par tour)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Rituel-pourpre.png', 'fr', 'Rituel pourpre', 'https://magenoir.com/collection/FR/fire/Rituel-pourpre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel pourpre', 'When put into play, lose half of your current Health Points, rounded down. You become a Mage Noir. During your main phase, you may lose 1 HP to take 1 Fire Mana from the infinite Ether and draw 1 card. (You may do this multiple times per turn.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Crimson-ritual.png', 'en', 'Crimson ritual', 'https://magenoir.com/collection/EN/fire/Crimson-ritual.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('robe brulante', 'Chaque fois qu''un sort Feu que vous contrôlez inflige des dégâts à une cible adverse, ils sont augmentés de 1 (ou 2 si vous êtes Mage Noir). Puis, Robe brûlante vous inflige 1 point de dégâts.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Robe-brulante.png', 'fr', 'Robe brûlante', 'https://magenoir.com/collection/FR/fire/Robe-brulante.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('robe brulante', 'If a Fire spell you control would inflict damage to an opposing target, it deals that much damage plus 1 (or 2 if you''re a Mage Noir). Then, Burning robe inflicts 1 damage to you.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Burning-robe.png', 'en', 'Burning robe', 'https://magenoir.com/collection/EN/fire/Burning-robe.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('soleil artificiel', 'Au début de votre tour, Soleil artificiel inflige 1 point de dégâts à TOUS les joueurs. Puis payez 1 Mana Feu ou détruisez Soleil artificiel.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/soleil_artificiel.png', 'fr', 'Soleil artificiel', 'https://magenoir.com/collection/FR/fire/Soleil-artificiel.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('soleil artificiel', 'At the beginning of your turn, Artificial sun inflicts 1 damage to ALL players.Then, pay 1 Fire Mana or destroy Artificial sun.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/artificial_sun.png', 'en', 'Artificial sun', 'https://magenoir.com/collection/EN/fire/Artificial-sun.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague de flammes', 'Inflige 1 point de dégâts à l''adversaire et ses Permanents par composant Flamme que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/Vague-de-flammes.png', 'fr', 'Vague de flammes', 'https://magenoir.com/collection/FR/fire/Vague-de-flammes.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague de flammes', 'Inflicts 1 damage to the opponent and their Permanents for each Flame component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/Wave-of-flames.png', 'en', 'Wave of flames', 'https://magenoir.com/collection/EN/fire/Wave-of-flames.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vents solaires', 'Inflige 3 points de dégâts à n''importe quelle cible.Zénith : Piochez 1 carte.(Ne s''applique que si vous avez commencé ce tour avec le même nombre de sorts en préparation que de sorts canalisés )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Feu/vents_solaires.png', 'fr', 'Vents solaires', 'https://magenoir.com/collection/FR/fire/Vents-solaires.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vents solaires', 'Inflicts 3 damage to any target.Zenith: Draw 1 card.(Only activates if you started this turn with an equal number of prepared and channeled spells)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/fire/solar_winds.png', 'en', 'Solar winds', 'https://magenoir.com/collection/EN/fire/Solar-winds.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('anneau de lithomancie', 'Vos permanents Minéraux ayant au moins un Point de Vie ont "Protecteur". (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/anneau-de-lithomancie.png', 'fr', 'Anneau de lithomancie', 'https://magenoir.com/collection/FR/mineral/Anneau-de-lithomancie.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('anneau de lithomancie', 'Your Mineral Permanents with at least one Health Point have "Protector". (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Lithomancy-ring.png', 'en', 'Lithomancy ring', 'https://magenoir.com/collection/EN/mineral/Lithomancy-ring.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre de pierre', 'Ne peut pas gagner de Points de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Arbre-de-pierre.png', 'fr', 'Arbre de pierre', 'https://magenoir.com/collection/FR/mineral/Arbre-de-pierre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre de pierre', 'Can''t gain Health Points.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Stone-tree.png', 'en', 'Stone tree', 'https://magenoir.com/collection/EN/mineral/Stone-tree.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('armure materialisee', 'Les dégâts que vous subissez sont réduits de 1. Chaque tour, ignorez jusqu''à X point de dégâts qui vous sont infligés. X est égal au nombre de Mana Minéral sous vos autres composants. X est déterminé la première fois que des dégâts vous sont infligés dans le tour. X ne peut être supérieur à 6', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Armure-materialisee.png', 'fr', 'Armure matérialisée', 'https://magenoir.com/collection/FR/mineral/Armure-materialisee.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('armure materialisee', 'Damage you take is reduced by 1. Each turn, ignore up to X damage that is inflicted to you, where X is the amount of Mineral Mana under your other components. X is determined the first time damage is inflicted to you during the turn. X can''t be more than 6.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Materialized-armor.png', 'en', 'Materialized armor', 'https://magenoir.com/collection/EN/mineral/Materialized-armor.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('armure solide', 'Chaque tour, ignorez jusqu''à X point de dégâts qui vous sont infligés. X est égal au nombre de Mana Minéral sous vos autres composants. X est déterminé la première fois que des dégâts vous sont infligés dans le tour. X ne peut être supérieur à 4.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Armure-solide.png', 'fr', 'Armure solide', 'https://magenoir.com/collection/FR/mineral/Armure-solide.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('armure solide', 'Each turn, ignore up to X damage that is inflicted to you, where X is the amount of Mineral Mana under your other components. X is determined the first time damage is inflicted to you during the turn. X can''t be more than 4.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Solid-armor.png', 'en', 'Solid armor', 'https://magenoir.com/collection/EN/mineral/Solid-armor.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('bastion', 'Vous ne pouvez pas subir plus d''1 point de dégâts à la fois.Au début de votre tour, détruisez ce Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/bastion.png', 'fr', 'Bastion', 'https://magenoir.com/collection/FR/mineral/Bastion.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('bastion', 'You cannot take more than 1 damage at once. At the beginning of your turn, destroy Bastion.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/bastion.png', 'en', 'Bastion', 'https://magenoir.com/collection/EN/mineral/Bastion.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('brulure de magma', 'Inflige 5 points de dégâts à n''importe quelle cible. Vous pouvez détruire 1 Anneau.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Brulure-de-magma.png', 'fr', 'Brûlure de magma', 'https://magenoir.com/collection/FR/mineral/Brulure-de-magma.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('brulure de magma', 'Inflicts 5 damage to any target. You may destroy 1 Ring.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Magma-burn.png', 'en', 'Magma burn', 'https://magenoir.com/collection/EN/mineral/Magma-burn.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('colere de ra', 'Mettez 1 sort en jeu (hors Rituel) dans la défausse de son contrôleur. Si vous êtes Mage Noir, cet effet ignore Indestructible.Inflige 5 points de dégâts à l''adversaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/colere_de_ra.png', 'fr', 'Colère de Râ', 'https://magenoir.com/collection/FR/mineral/Colere-de-ra.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('colere de ra', 'Put any 1 spell in play (except a Ritual) into its owner''s discard pile. If you''re a Mage Noir, this ignores Indestructible.Inflicts 5 damage to the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/ra_s_wrath.png', 'en', 'Râ''s wrath', 'https://magenoir.com/collection/EN/mineral/Ra-s-wrath.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('coup de marteau divin', 'Détruisez 1 Équipement.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Coup-de-marteau-divin.png', 'fr', 'Coup de marteau divin', 'https://magenoir.com/collection/FR/mineral/Coup-de-marteau-divin.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('coup de marteau divin', 'Destroy 1 piece of Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Divine-hammer-strike.png', 'en', 'Divine hammer strike', 'https://magenoir.com/collection/EN/mineral/Divine-hammer-strike.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('couronne de la renonciation', 'Ne peut être équipé que par un Mage Noir. Tant que ce sort est en jeu, vous n''êtes pas Mage Noir et vos rituels n''ont pas d''effet. A tout moment payez 1 Mana pour ignorer 1 point de dégâts qui vous est infligé. Si votre réserve de Mana est vide, détruisez cet Équipement.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Couronne-de-la-renonciation.png', 'fr', 'Couronne de la renonciation', 'https://magenoir.com/collection/FR/mineral/Couronne-de-la-renonciation.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('couronne de la renonciation', 'Can only be equipped by a Mage Noir. While this spell is in play, you are not a Mage Noir and your rituals have no effect. At any time, you may pay 1 Mana to ignore 1 damage that would be inflicted to you. When your Mana reserve is empty, destroy this Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Waiver-crown.png', 'en', 'Waiver crown', 'https://magenoir.com/collection/EN/mineral/Waiver-crown.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('crocs du desert', 'Si vous êtes Mage Noir, vous pouvez préparer ce sort en utilisant la Mana verrouillée sous vos composants Sable.Si vous êtes Mage Noir, ce sort gagne : "Rapide" (Ce sort peut être activé à tout moment ).Inflige 3 points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/crocs_du_desert.png', 'fr', 'Crocs du désert', 'https://magenoir.com/collection/FR/mineral/Crocs-du-desert.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('crocs du desert', 'If you''re a Mage Noir, you may prepare this spell using Mana locked under your Sand components.If you''re a Mage Noir, this spell gains: "Quickcast". (This spell can be activated at any time)Inflicts 3 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_fangs.png', 'en', 'Desert fangs', 'https://magenoir.com/collection/EN/mineral/Desert-fangs.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('epee materialisee', 'Une fois par tour, durant votre phase principale, inflige 2 points de dégâts à n''importe quelle cible. Puis la Lame utilisée comme composant pour lancer ce sort applique ses effets (même si celle-ci est dans la défausse).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Lame-materialisee.png', 'fr', 'Épée matérialisée', 'https://magenoir.com/collection/FR/mineral/Epee-materialisee.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('epee materialisee', 'Once per turn during your main phase, inflicts 2 damage to any target. Then, the Blade used as a component to cast this spell also applies its effects (even if it is in the discard pile).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Materialized-sword.png', 'en', 'Materialized sword', 'https://magenoir.com/collection/EN/mineral/Materialized-sword.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine des sables', 'Le dernier sort Permanent ayant utilisé Graine des sables comme composant a l''effet :"Les dégâts infligés à ce Permanent sont réduits de 1."', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/graine_des_sables.png', 'fr', 'Graine des sables', 'https://magenoir.com/collection/FR/mineral/Graine-des-sables.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine des sables', 'The last Permanent spell that used Seed of the sands as a component has the effect:"Damage inflicted to this Permanent is reduced by 1."', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/seed_of_the_sands.png', 'en', 'Seed of the sands', 'https://magenoir.com/collection/EN/mineral/Seed-of-the-sands.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lame forgee', 'Une fois par tour, durant votre phase principale, inflige 1 point de dégât à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Lame-forgee.png', 'fr', 'Lame forgée', 'https://magenoir.com/collection/FR/mineral/Lame-forgee.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('lame forgee', 'Once per turn during your main phase, inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Forged-blade.png', 'en', 'Forged blade', 'https://magenoir.com/collection/EN/mineral/Forged-blade.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('main du desert', 'Au début de votre tour, inflige 1 point de dégâts à l''adversaire.Si vous contrôlez au moins 2 composants Sable, ce Permanent a Protecteur.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/main_du_desert.png', 'fr', 'Main du désert', 'https://magenoir.com/collection/FR/mineral/Main-du-desert.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('main du desert', 'At the beginning of your turn, inflicts 1 damage to the opponent.If you control at least 2 Sand components, this Permanent has Protector.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_hand.png', 'en', 'Desert hand', 'https://magenoir.com/collection/EN/mineral/Desert-hand.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('meteore d ina', 'Si vous êtes Mage Noir, pour préparer ce sort, vous pouvez utiliser 4 roches au lieu d''1 composant Météore. Inflige X points de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Meteore-d-ina.png', 'fr', 'Météore d''Ina', 'https://magenoir.com/collection/FR/mineral/Meteore-d-ina.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('meteore d ina', 'If you''re a Mage Noir, you may use 4 Rocks instead of 1 Meteor component to prepare this spell. Inflicts X damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Inas-meteor.png', 'en', 'Ina''s meteor', 'https://magenoir.com/collection/EN/mineral/Inas-meteor.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('meteore du desert', 'Si vous êtes Mage Noir, ce sort coûte 1 Mana Minéral de moins à préparer.Inflige 1 point de dégâts à n''importe quelle cible par composant Sable que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/meteore_du_desert.png', 'fr', 'Météore du désert', 'https://magenoir.com/collection/FR/mineral/Meteore-du-desert.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('meteore du desert', 'If you''re a Mage Noir, this spell costs 1 less Mineral Mana to prepare.Inflicts 1 damage to any target for each Sand component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_meteor.png', 'en', 'Desert meteor', 'https://magenoir.com/collection/EN/mineral/Desert-meteor.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mine souterraine', 'Durant votre phase principale, vous pouvez payer 1 Mana Minéral pour regarder la carte du dessus de votre deck.Si c''est une Roche, vous pouvez la montrer à votre adversaire et la mettre dans votre main.Sinon, mettez-la au-dessous de votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/mine_souterraine.png', 'fr', 'Mine souterraine', 'https://magenoir.com/collection/FR/mineral/Mine-souterraine.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mine souterraine', 'During your main phase, you may pay 1 Mineral Mana to look at the top card of your deck.If it''s a Rock, you may show it to the opponent and put it into your hand.Otherwise, put it at the bottom of your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/underground_mine.png', 'en', 'Underground mine', 'https://magenoir.com/collection/EN/mineral/Underground-mine.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('minerai des temps', 'Tout Équipement qui utilise ce sort comme composant coûte 1 Mana Minéral de moins.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/minerai_des_temps.png', 'fr', 'Minerai des temps', 'https://magenoir.com/collection/FR/mineral/Minerai-des-temps.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('minerai des temps', 'Any Equipment using this spell as a component costs 1 less Mineral Mana to prepare.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/time_ore.png', 'en', 'Time ore', 'https://magenoir.com/collection/EN/mineral/Time-ore.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mons igneus', 'Inflige 5 points de dégâts à n''importe quelle cible, puis 1 composant Séisme et 1 composant Magma que vous contrôlez appliquent leurs effets.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Mons-igneus.png', 'fr', 'Mons igneus', 'https://magenoir.com/collection/FR/mineral/Mons-igneus.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mons igneus', 'Inflicts 5 damage to any target, then apply the effects of 1 Earthquake and 1 Magma component you control', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Mons-igneus.png', 'en', 'Mons igneus', 'https://magenoir.com/collection/EN/mineral/Mons-igneus.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mur de roche', 'Lorsque ce Permanent a moins de un Point de Vie, libérez sa Mana et canalisez-le en composant plutôt que de le détruire. Celui-ci ne compte alors plus comme composant Mur.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Mur-de-roche.png', 'fr', 'Mur de roche', 'https://magenoir.com/collection/FR/mineral/Mur-de-roche.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mur de roche', 'Once this Permanent has less than one Health Point, release its Mana and channel it as a Rock component instead of destroying it. It does not count as a Wall component anymore.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Rock-wall.png', 'en', 'Rock wall', 'https://magenoir.com/collection/EN/mineral/Rock-wall.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mur du desert', 'Lorsqu''il arrive en jeu, déplacez autant de Mana Minéral que vous le souhaitez de vos composants Sable sous ce Permanent.Mur du désert arrive en jeu avec autant de PV qu''il verrouille de Mana Minéral.Si vous êtes Mage Noir, ce Permanent a Protecteur.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/mur_du_desert.png', 'fr', 'Mur du désert', 'https://magenoir.com/collection/FR/mineral/Mur-du-desert.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('mur du desert', 'When put into play, move any amount of Mineral Mana from your Sand components under Desert wall.Desert wall is put into play with HP equal to the amount of Mineral Mana locked under it.If you''re a Mage Noir, this Permanent has Protector.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_wall.png', 'en', 'Desert wall', 'https://magenoir.com/collection/EN/mineral/Desert-wall.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('oasis', 'Lorsque vous activez un sort Désert, vous pouvez payer 1 Mana Eau pour le renvoyer dans votre main au lieu de le défausser.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/oasis.png', 'fr', 'Oasis', 'https://magenoir.com/collection/FR/mineral/Oasis.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('oasis', 'Whenever you activate a Desert spell, you may pay 1 Water Mana to return it to your hand instead of discarding it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/oasis.png', 'en', 'Oasis', 'https://magenoir.com/collection/EN/mineral/Oasis.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('poing meteore', 'Inflige 5 points de dégâts à l''adversaire. Puis vous inflige 2 points de dégâts. Puis inflige 2 points de dégâts à TOUS les Permanents.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Poing-meteore.png', 'fr', 'Poing météore', 'https://magenoir.com/collection/FR/mineral/Poing-meteore.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('poing meteore', 'Inflicts 5 damage to the opponent. Then, inflicts 2 damage to you. Then, inflicts 2 damage to EVERY Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Meteor-punch.png', 'en', 'Meteor punch', 'https://magenoir.com/collection/EN/mineral/Meteor-punch.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('reforger', 'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé ) Les dégâts d''un Équipement de votre choix sont augmentés de 1.Puis vous pouvez payer 1 Mana Eau pour renvoyer Reforger dans votre main au lieu de le défausser.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/reforger.png', 'fr', 'Reforger', 'https://magenoir.com/collection/FR/mineral/Reforger.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('reforger', 'Slowcast (This spell can''t be activated on the turn it was prepared)Damage inflicted by target Equipment you control is increased by 1.Then, you may pay 1 Water Mana to return Reforge to your hand instead of discarding it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/reforge.png', 'en', 'Reforge', 'https://magenoir.com/collection/EN/mineral/Reforge.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('replique de verre', 'Prenez 1 Équipement dans votre deck. Il perd tous ses effets. Mettez-le en jeu. Il est toujours un Équipement et correspond toujours à son emplacement désigné.Mélangez votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/replique_de_verre.png', 'fr', 'Réplique de verre', 'https://magenoir.com/collection/FR/mineral/Replique-de-verre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('replique de verre', 'Take 1 piece of Equipment from your deck. It loses all its effects. Put it into play. It retains its card type and Equipment type.Shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/glass_replica.png', 'en', 'Glass replica', 'https://magenoir.com/collection/EN/mineral/Glass-replica.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel d exuviation', 'Vous passez Mage Noir.Vos sorts coûtent 1 Mana Minéral de moins à préparer.Les dégâts qui vous sont infligés sont augmentés de 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/rituel_d_exuviation.png', 'fr', 'Rituel d''exuviation', 'https://magenoir.com/collection/FR/mineral/Rituel-d-exuviation.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel d exuviation', 'You become a Mage Noir.Your spells cost 1 less Mineral Mana to prepare.Damage inflicted to you is increased by 1.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/ecdysis_ritual.png', 'en', 'Ecdysis ritual', 'https://magenoir.com/collection/EN/mineral/Ecdysis-ritual.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du guerrier mage', 'Vous passez Mage Noir. A la fin de votre tour, détruisez tous les Équipements que vous avez joué ce tour-ci. Les dégâts infligés par vos Équipements sont augmentés de 1. A tout moment vous pouvez défausser 1 carte de votre main pour que l''Équipement ciblé soit indestructible ce tour-ci.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Rituel-du-guerrier-mage.png', 'fr', 'Rituel du guerrier-mage', 'https://magenoir.com/collection/FR/mineral/Rituel-du-guerrier-mage.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel du guerrier mage', 'You become a Mage Noir. At the end of your turn, destroy all Equipment you played this turn. Damage inflicted by your Equipment is increased by 1. At any time, you may discard 1 card to make target Equipment you control indestructible until the end of the turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Warrior-mage-ritual.png', 'en', 'Warrior-mage ritual', 'https://magenoir.com/collection/EN/mineral/Warrior-mage-ritual.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roche', 'Si vous contrôlez 2 exemplaires de ce sort, ils ont "Transmutable : Minerai". Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.) Prenez 1 Mana Minéral dans l''Ether disponible puis infligez 1 point de dégât à 1 Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Roche.png', 'fr', 'Roche', 'https://magenoir.com/collection/FR/mineral/Roche.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roche', 'If you control 2 copies of this spell, they have "Transmutable : Ore". (These spells can be used as Ore components.) Forge. (Is discarded once used as a component for Equipment.) Take 1 Mineral Mana from the Available Ether and deal 1 damage to 1 Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Iron-rock.png', 'en', 'Rock', 'https://magenoir.com/collection/EN/mineral/Rock.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roche d obsidienne', 'Lorsque des dégâts vous sont infligés, ce sort libère 1 Mana Minéral. Lorsqu''il ne verrouille plus de Mana, ce sort a Transmutable : Minerai (Ce sort est utilisable comme composant Minerai.) Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.) Ajoutez 1 à chaque chiffre dans l''effet de tout Équipement utilisant ce sort comme composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Roche-d-obsidienne.png', 'fr', 'Roche d''obsidienne', 'https://magenoir.com/collection/FR/mineral/Roche-d-obsidienne.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roche d obsidienne', 'When damage is inflicted to you, this spell releases 1 Mineral Mana. As soon as there''s no Mana locked under it, this spell gains "Transmutable : Ore" (This spell can be used as a Ore component.) Forge. (Is discarded once used as a component for Equipment.) Add 1 to every number in the effects of any Equipment using this spell as a component.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Obsidian-rock.png', 'en', 'Obsidian rock', 'https://magenoir.com/collection/EN/mineral/Obsidian-rock.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roche ferreuse', 'Durant votre phase principale, vous pouvez placer 1 Mana Feu de votre réserve de Mana sous ce sort. Il gagne alors "Transmutable : Minerai" (Ce sort est utilisable comme composant Minerai.) Forge. (Est défaussé lorsqu''utilisé comme composant pour un Équipement.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Roche-ferreuse.png', 'fr', 'Roche ferreuse', 'https://magenoir.com/collection/FR/mineral/Roche-ferreuse.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roche ferreuse', 'During your main phase, you may put 1 Fire Mana from your Mana reserve under this spell. Then, it gains "Transmutable : Ore" (This spell can be used as an Ore component.). Forge.(Is discarded once used as a component for Equipment.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Solid-rock.png', 'en', 'Iron rock', 'https://magenoir.com/collection/EN/mineral/Iron-rock.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roche friable', 'Durant votre phase principale, vous pouvez payer 1 Mana Minéral pour que ce sort gagne "Transmutable : Sable" jusqu''à la fin du tour.Lorsque vous activez Roche friable, inflige 1 point de dégâts à n''importe quelle cible.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/roche_friable.png', 'fr', 'Roche friable', 'https://magenoir.com/collection/FR/mineral/Roche-friable.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roche friable', 'During your main phase, you may pay 1 Mineral Mana to have this spell gain: "Transmutable: Sand" until the end of your turn.When activated, inflicts 1 damage to any target.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/crumbling_rock.png', 'en', 'Crumbling rock', 'https://magenoir.com/collection/EN/mineral/Crumbling-rock.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('sable fin', 'Si Sable fin verrouille plus d''1 Mana, toute Mana en excédent est immédiatement libérée, sauf si vous êtes Mage Noir.Lorsqu''un Désert va à la défausse, verrouillez 1 Mana Minéral de celui-ci sous Sable fin au lieu de la libérer.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/sable_fin.png', 'fr', 'Sable fin', 'https://magenoir.com/collection/FR/mineral/Sable-fin.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('sable fin', 'Whenever Fine sand locks more than 1 Mana, any excess Mana is instantly released, unless you''re a Mage Noir.When a Desert spell goes to the discard pile, lock 1 Mineral Mana from it under Fine sand instead of releasing it.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/fine_sand.png', 'en', 'Fine sand', 'https://magenoir.com/collection/EN/mineral/Fine-sand.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('sables mouvants', 'Transmutable : GoutteRapide (Ce sort peut être activé à tout moment )1 sort en préparation de votre choix gagne : "Lent". (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/sables_mouvants.png', 'fr', 'Sables mouvants', 'https://magenoir.com/collection/FR/mineral/Sables-mouvants.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('sables mouvants', 'Transmutable: Drop, SandQuickcast (This spell can be activated at any time)1 prepared spell gains: "Slowcast". (This spell can''t be activated on the turn it was prepared)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/quicksand.png', 'en', 'Quicksand', 'https://magenoir.com/collection/EN/mineral/Quicksand.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('seisme', 'Inflige 4 points de dégâts à l''adversaire. Si vous êtes Mage Noir, détruisez TOUS les Permanents.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Seisme.png', 'fr', 'Séisme', 'https://magenoir.com/collection/FR/mineral/Seisme.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('seisme', 'Inflicts 4 damage to the opponent. If you''re a Mage Noir, destroy EVERY Permanent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Earthquake.png', 'en', 'Earthquake', 'https://magenoir.com/collection/EN/mineral/Earthquake.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('sirocco', 'Transmutable : Sable, SoufflePiochez 1 carte.Si vous êtes Mage Noir, renvoyez 1 sort canalisé dans la main de son propriétaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/sirocco.png', 'fr', 'Sirocco', 'https://magenoir.com/collection/FR/mineral/Sirocco.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('sirocco', 'Transmutable: Sand, BreathDraw 1 card.If you''re a Mage Noir, return 1 channeled spell to its owner''s hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/sirocco.png', 'en', 'Sirocco', 'https://magenoir.com/collection/EN/mineral/Sirocco.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague du desert', 'Lorsque vous préparez ce sort, déplacez autant de Mana Minéral que vous le souhaitez depuis vos composants Sable sous Vague du désert.Inflige X points de dégâts à n''importe quelle cible.X est égal au nombre de Mana Minéral verrouillée par ce sort.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/vague_du_desert.png', 'fr', 'Vague du désert', 'https://magenoir.com/collection/FR/mineral/Vague-du-desert.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('vague du desert', 'When you prepare this spell, move any amount of Mineral Mana from your Sand components under Desert wave. Inflicts X damage to any target, where X is the amount of Mineral Mana locked under this spell.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/desert_wave.png', 'en', 'Desert wave', 'https://magenoir.com/collection/EN/mineral/Desert-wave.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('volee aiguisee', 'Vous inflige 1 point de dégâts 5 fois, à moins que vous ne soyez Mage Noir. Inflige 1 point de dégâts à l''adversaire 5 fois.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Mineral/Volee-aiguisee.png', 'fr', 'Volée aiguisée', 'https://magenoir.com/collection/FR/mineral/Volee-aiguisee.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('volee aiguisee', 'Inflicts 1 damage to you 5 times, unless you''re a Mage Noir. Inflicts 1 damage to the opponent 5 times.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/mineral/Sharp-volley.png', 'en', 'Sharp volley', 'https://magenoir.com/collection/EN/mineral/Sharp-volley.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('anneau du druide', 'Les dégâts infligés par les Permanents Végétaux que vous contrôlez sont augmentés de 2.Si vous êtes Mage Noir, lorsque vous ajoutez de la Mana dans l''Ether disponible au début de votre tour, ajoutez 1 Mana Végétal supplémentaire.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Anneau-du-druide.png', 'fr', 'Anneau du druide', 'https://magenoir.com/collection/FR/vegetal/Anneau-du-druide.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('anneau du druide', 'Damage inflicted by Vegetal Permanents you control is increased by 2.If you''re a Mage Noir, when you add Mana to the Available Ether at the beginning of your turn, add 1 additional Vegetal Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Druid-ring.png', 'en', 'Druid ring', 'https://magenoir.com/collection/EN/vegetal/Druid-ring.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre anime', 'Lorsqu''il arrive en jeu, défausse la Graine utilisée comme composant.Au début de votre tour, inflige 2 points de dégâts à l''adversaire, puis vous pouvez mettre 1 Graine en préparation depuis votre défausse.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Arbre-anime.png', 'fr', 'Arbre animé', 'https://magenoir.com/collection/FR/vegetal/Arbre-anime.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre anime', 'When put into play, discard the Seed component used to cast it.At the beginning of your turn, inflicts 2 damage to the opponent, then you may put 1 Seed from your discard pile into play prepared.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Animated-tree.png', 'en', 'Animated tree', 'https://magenoir.com/collection/EN/vegetal/Animated-tree.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre en flammes', 'Si vous êtes Mage Noir, préparer ce sort nécessite 1 composant de moins.Au début de votre tour, ce Permanent inflige 2 points de dégâts à l''adversaire, puis il perd 1 Point de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Arbre-en-flammes.png', 'fr', 'Arbre en flammes', 'https://magenoir.com/collection/FR/vegetal/Arbre-en-flammes.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre en flammes', 'If you''re a Mage Noir, preparing this spell requires 1 less component.At the beginning of your turn, this Permanent inflicts 2 damage to the opponent, then loses 1 Health Point.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Tree-in-flames.png', 'en', 'Tree in flames', 'https://magenoir.com/collection/EN/vegetal/Tree-in-flames.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre mort', 'Si vous êtes Mage Noir, ce Permanent a Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Arbre-mort.png', 'fr', 'Arbre mort', 'https://magenoir.com/collection/FR/vegetal/Arbre-mort.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('arbre mort', 'If you''re a Mage Noir, this Permanent has Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Dead-tree.png', 'en', 'Dead tree', 'https://magenoir.com/collection/EN/vegetal/Dead-tree.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('armure d ecorce', 'Chaque tour, ignorez jusqu''à 1 point de dégâts adverses qui vous sont infligés.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Armure-d-ecorce.png', 'fr', 'Armure d''écorce', 'https://magenoir.com/collection/FR/vegetal/Armure-d-ecorce.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('armure d ecorce', 'Each turn, ignore up to 1 inflicted damage you receive from the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Bark-armor.png', 'en', 'Bark armor', 'https://magenoir.com/collection/EN/vegetal/Bark-armor.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('armure de druide', 'Chaque tour, ignorez jusqu''à 3 points de dégâts adverses qui vous sont infligés.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Armure-de-druide.png', 'fr', 'Armure de druide', 'https://magenoir.com/collection/FR/vegetal/Armure-de-druide.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('armure de druide', 'Each turn, ignore up to 3 inflicted damage you receive from the opponent.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Druid-armor.png', 'en', 'Druid armor', 'https://magenoir.com/collection/EN/vegetal/Druid-armor.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('baguette de druide', 'Au début de votre tour, inflige 1 point de dégâts par Équipement Druide que vous contrôlez à n''importe quelle cible.Si vous êtes Mage Noir, Baguette de druide ne détruit pas les Équipements qu''elle utilise comme composants, et elle n''est pas détruite lorsqu''un Équipement l''utilise comme composant.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/baguette_de_druide.png', 'fr', 'Baguette de druide', 'https://magenoir.com/collection/FR/vegetal/Baguette-de-druide.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('baguette de druide', 'At the beginning of your turn, inflicts 1 damage per Druid Equipment you control to any target.If you are a Mage Noir, this piece of Equipment does not destroy Equipment that it uses as a component, and it is not destroyed when used as a component to prepare other Equipment.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/druid_wand.png', 'en', 'Druid wand', 'https://magenoir.com/collection/EN/vegetal/Druid-wand.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('champ de tournesols', 'Transmutable : FleurLorsqu''il arrive en jeu, allez chercher 1 sort Soleil dans votre deck, montrez-le à votre adversaire, mettez-le dans votre main, puis mélangez votre deck.Vos sorts Soleil coûtent 1 Mana Feu de moins à préparer.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/champ_de_tournesol.png', 'fr', 'Champ de tournesols', 'https://magenoir.com/collection/FR/vegetal/Champ-de-tournesols.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('champ de tournesols', 'Transmutable : FlowerWhen put into play, take 1 Sun card from your deck, show it to the opponent, put it into your hand and shuffle your deck.Your Sun spells cost 1 less Fire Mana to prepare.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/sunflower_field.png', 'en', 'Sunflower field', 'https://magenoir.com/collection/EN/vegetal/Sunflower-field.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('cornes de druide', 'A tout moment, vous pouvez regarder la carte du dessus de votre deck. Si c''est une Graine, montrez-la à votre adversaire et mettez-la dans votre main.Vos Graines coûtent 1 Mana Végétal de moins. Si vous êtes Mage Noir, vos Graines coûtent 0 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Cornes-de-druide.png', 'fr', 'Cornes de druide', 'https://magenoir.com/collection/FR/vegetal/Cornes-de-druide.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('cornes de druide', 'At any time, you may look at the top card of your deck. If it''s a Seed, show it to your opponent and put it into your hand.Your Seeds cost 1 less Vegetal Mana. If you''re a Mage Noir, your Seeds cost 0 Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Druid-horns.png', 'en', 'Druid horns', 'https://magenoir.com/collection/EN/vegetal/Druid-horns.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('croissance de fleur', 'La cible de votre choix gagne 2 PV.Regardez les 3 cartes du dessus de votre deck. Vous pouvez choisir 1 carte Fleur parmi celles-ci, la montrer à votre adversaire, puis la mettre dans votre main. Mettez le reste au dessous de votre deck dans l''ordre de votre choix.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/croissance_de_fleurs.png', 'fr', 'Croissance de fleur', 'https://magenoir.com/collection/FR/vegetal/Croissance-de-fleur.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('croissance de fleur', 'Any target gains 2 HP.Look at the top 3 cards of your deck. You may take 1 Flower card from them, show it to the opponent and then put it in your hand.Put the rest at the bottom of your deck in any order.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/flower_growth.png', 'en', 'Flower growth', 'https://magenoir.com/collection/EN/vegetal/Flower-growth.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('distillation de seve', 'Prenez 3 Mana de votre choix dans l''Éther Infini (ou 4 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/distillation_de_seve.png', 'fr', 'Distillation de sève', 'https://magenoir.com/collection/FR/vegetal/Distillation-de-seve.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('distillation de seve', 'Take 3 Mana of your choice from the Infinite Ether (or 4 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/sap_distillation.png', 'en', 'Sap distillation', 'https://magenoir.com/collection/EN/vegetal/Sap-distillation.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleur de kerloc h', 'Unique, sauf si vous êtes Mage Noir.Au début de votre tour, inflige 2 points de dégâts à l''adversaire, puis ce permanent gagne 1 PV (ou 2 si vous contrôlez au moins 4 composants Goutte).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleur_de_kerloc_h.png', 'fr', 'Fleur de Kerloc''h', 'https://magenoir.com/collection/FR/vegetal/Fleur-de-kerloc-h.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleur de kerloc h', 'Unique, unless you''re a Mage Noir.At the beginning of your turn, inflicts 2 damage to the opponent, then this Permanent gains 1 HP (or 2 if you control at least 4 Drop components).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/kerloch_s_flower.png', 'en', 'Kerloc''h''s flower', 'https://magenoir.com/collection/EN/vegetal/Kerloc-h-s-flower.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleur fractale', 'Au début de votre tour, inflige 1 point de dégâts à l''adversaire, puis, si vous êtes Mage Noir, choisissez une carte Fleur dans votre défausse et mettez-la dans votre main.Automne (Lorsqu''il est détruit, ce Permanent applique ses effets de début de tour )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleur_fractale.png', 'fr', 'Fleur fractale', 'https://magenoir.com/collection/FR/vegetal/Fleur-fractale.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleur fractale', 'At the beginning of your turn, inflicts 1 damage to the opponent, then, if you''re a Mage Noir, return 1 Flower spell from your discard pile to your hand.Autumn (When it is destroyed, this Permanent applies its start-of-turn effects)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/fractal_flower.png', 'en', 'Fractal flower', 'https://magenoir.com/collection/EN/vegetal/Fractal-flower.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleur hypnotique', 'Votre adversaire perd 2 Points de Vie (ou 3 si vous êtes Mage Noir).Votre adversaire pioche 1 carte.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleur_hypnotique.png', 'fr', 'Fleur hypnotique', 'https://magenoir.com/collection/FR/vegetal/Fleur-hypnotique.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleur hypnotique', 'The opponent loses 2 HP (or 3 if you''re a Mage Noir).The opponent draws 1 card.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/hypnotic_flower.png', 'en', 'Hypnotic flower', 'https://magenoir.com/collection/EN/vegetal/Hypnotic-flower.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleurs d arbre', 'Chaque Permanent Végétal que vous contrôlez libère 1 Mana Végétal.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/fleurs_d_arbre.png', 'fr', 'Fleurs d''arbre', 'https://magenoir.com/collection/FR/vegetal/Fleurs-d-arbre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('fleurs d arbre', 'Each Vegetal Permanent you control releases 1 Vegetal Mana.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/tree_flowers.png', 'en', 'Tree flowers', 'https://magenoir.com/collection/EN/vegetal/Tree-flowers.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('floraison letale', 'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )L''adversaire perd 5 PV.Défaussez 1 composant Fleur que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/floraison_letale.png', 'fr', 'Floraison létale', 'https://magenoir.com/collection/FR/vegetal/Floraison-letale.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('floraison letale', 'Slowcast (This spell can''t be activated on the turn it was prepared) The opponent loses 5 HP.Discard 1 Flower component you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/lethal_flourish.png', 'en', 'Lethal flourish', 'https://magenoir.com/collection/EN/vegetal/Lethal-flourish.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('foret enchantee', 'Au début de votre tour, vous et vos Permanents Végétaux qui ont des Points de Vie gagnez 2 Points de Vie.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Foret-enchantee.png', 'fr', 'Forêt enchantée', 'https://magenoir.com/collection/FR/vegetal/Foret-enchantee.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('foret enchantee', 'At the beginning of your turn, you and your Vegetal Permanents with Health Points gain 2 HP.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Enchanted-forest.png', 'en', 'Enchanted Forest', 'https://magenoir.com/collection/EN/vegetal/Enchanted-forest.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('foret hostile', 'Au début de votre tour, inflige X points de dégâts à n''importe quelle cible, X étant les Points de Vie actuels de ce Permanent.Protecteur (Vous pouvez rediriger les dégâts adverses sur ce Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Foret-hostile.png', 'fr', 'Forêt hostile', 'https://magenoir.com/collection/FR/vegetal/Foret-hostile.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('foret hostile', 'At the beginning of your turn, inflicts X damage to any target, where X is the current Health Points of this Permanent.Protector (You may redirect damage the opponent controls onto this Permanent)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Hostile-forest.png', 'en', 'Hostile forest', 'https://magenoir.com/collection/EN/vegetal/Hostile-forest.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine', 'Vous gagnez 1 Point de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Graine.png', 'fr', 'Graine', 'https://magenoir.com/collection/FR/vegetal/Graine.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine', 'You gain 1 Health Point.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Seed.png', 'en', 'Seed', 'https://magenoir.com/collection/EN/vegetal/seed.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine bourgeonnante', 'Lent (Ce sort ne peut pas être activé le tour durant lequel il a été préparé )Allez chercher 1 carte Fleur dans votre deck, montrez-la à votre adversaire, mettez-la dans votre main, puis mélangez votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/graine_bourgeonnante.png', 'fr', 'Graine bourgeonnante', 'https://magenoir.com/collection/FR/vegetal/Graine-bourgeonnante.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine bourgeonnante', 'Slowcast (This spell can''t be activated on the turn it was prepared) Take 1 Flower card from your deck, show it to the opponent, put it into your hand and shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/budding_seed.png', 'en', 'Budding seed', 'https://magenoir.com/collection/EN/vegetal/Budding-seed.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine germee', 'Transmutable : Goutte (Ce sort est utilisable comme composant Goutte.)Allez chercher 1 carte Arbre dans votre deck, montrez-la à votre adversaire, mettez-la dans votre main, puis mélangez votre deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Graine-germee.png', 'fr', 'Graine germée', 'https://magenoir.com/collection/FR/vegetal/Graine-germee.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('graine germee', 'Transmutable : Drop (This spell can be used as a Drop component.)Take 1 Tree card from your deck, show it to the opponent, put it into your hand and shuffle your deck.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Sprouted-seed.png', 'en', 'Sprouted seed', 'https://magenoir.com/collection/EN/vegetal/Sprouted-seed.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('infusion florale', 'Tant que ce sort est en préparation, au début de votre tour, mettez 1 Mana Végétal de l''Éther Infini sous ce sort.Lorsque vous l''activez, piochez X cartes, où X est le nombre de Mana verrouillées par ce sort. X ne peut être supérieur au nombre de composants Gouttes que vous contrôlez.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/infusion_florale.png', 'fr', 'Infusion florale', 'https://magenoir.com/collection/FR/vegetal/Infusion-florale.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('infusion florale', 'While in preparation:At the start of your turn, lock 1 Vegetal Mana from the Infinite Ether under this spell.When activated, draw X cards, where X is the amount of Mana this spell locks. X can''t be more than the number of Drop components you control.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/floral_infusion.png', 'en', 'Floral infusion', 'https://magenoir.com/collection/EN/vegetal/Floral-infusion.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('la guerisseuse sylvestre', 'Choisissez 1 option :- Le Permanent Végétal avec des Points de Vie ciblé gagne 4 Points de Vie.- Vous gagnez 3 Points de Vie.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/La-guerisseuse-sylvestre.png', 'fr', 'La guérisseuse sylvestre', 'https://magenoir.com/collection/FR/vegetal/La-guerisseuse-sylvestre.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('la guerisseuse sylvestre', 'Choose 1 option:-Target Vegetal Permanent with Health Points gains 4 HP.-You gain 3 HP.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/The-sylvan-healer.png', 'en', 'The sylvan healer', 'https://magenoir.com/collection/EN/vegetal/The-sylvan-healer.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('petales tranchants', 'Inflige 3 points de dégâts à n''importe quelle cible.Inflige 2 points de dégâts à un Permanent Végétal que vous contrôlez (ou 1 si vous êtes Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/petales_tranchants.png', 'fr', 'Pétales tranchants', 'https://magenoir.com/collection/FR/vegetal/Petales-tranchants.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('petales tranchants', 'Inflicts 3 damage to any target.Inflicts 2 damage to a Vegetal Permanent you control (or 1 if you''re a Mage Noir).', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/sharp_petals.png', 'en', 'Sharp petals', 'https://magenoir.com/collection/EN/vegetal/Sharp-petals.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('photosynthese', 'Rapide (Ce sort peut être activé à tout moment )1 Permanent Végétal que vous contrôlez gagne 2 PV.Si vous contrôlez un composant Soleil, il gagne 2 PV de plus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/photosynthese.png', 'fr', 'Photosynthese', 'https://magenoir.com/collection/FR/vegetal/Photosynthese.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('photosynthese', 'Quickcast (This spell can be activated at any time) 1 Vegetal Permanent you control gains 2 HP.If you control a Sun component, it gains 2 additional HP.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/photosynthesis.png', 'en', 'Photosynthesis', 'https://magenoir.com/collection/EN/vegetal/Photosynthesis.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('renouveau', 'Si vous êtes Mage Noir, ce sort gagne: "Rapide" (Ce sort peut être activé à tout moment)Détruisez un Permanent Végétal.À la fin de ce tour, remettez-le en jeu depuis la défausse.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/renouveau.png', 'fr', 'Renouveau', 'https://magenoir.com/collection/FR/vegetal/Renouveau.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('renouveau', 'If you''re a Mage Noir, this spell gains: "Quickcast" (This spell can be activated at any time)Destroy a Vegetal Permanent. At the end of the turn, put it back into play from the discard pile.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/renewal.png', 'en', 'Renewal', 'https://magenoir.com/collection/EN/vegetal/Renewal.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel de decomposition', 'Vous passez Mage Noir.Au début de votre tour, perdez 1 Point de Vie.Durant votre phase principale, vous pouvez détruire 1 Permanent que vous contrôlez pour infliger un montant de dégâts égal à ses Points de Vie à n''importe quelle cible.(Vous pouvez le faire plusieurs fois par tour)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Rituel-de-decomposition.png', 'fr', 'Rituel de décomposition', 'https://magenoir.com/collection/FR/vegetal/Rituel-de-decomposition.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel de decomposition', 'You become a Mage Noir.At the beginning of your turn, you lose 1 Health Point.During your main phase, you may destroy 1 Permanent you control to inflict damage equal to its HP to any target.(You may do this multiple times per turn.)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Ritual-of-decomposition.png', 'en', 'Ritual of decomposition', 'https://magenoir.com/collection/EN/vegetal/Ritual-of-decomposition.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel des saisons', 'Vous passez Mage Noir.Lorsque ce sort arrive en jeu, vos Permanents Végétaux perdent 1 PV.Durant votre phase principale, vous pouvez faire perdre 1 PV à un Permanent que vous contrôlez, puis celui-ci gagne : "Automne". (Lorsqu''il est détruit, ce Permanent applique ses effets de début de tour )', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/rituel_des_saisons.png', 'fr', 'Rituel des saisons', 'https://magenoir.com/collection/FR/vegetal/Rituel-des-saisons.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('rituel des saisons', 'You become a Mage Noir.When put into play, your Vegetal Permanents lose 1 HP.During your main phase, you may have a Permanent you control lose 1 HP, then it gains: "Autumn". (When it is destroyed, this Permanent applies its start-of-turn effects)', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/ritual_of_seasons.png', 'en', 'Ritual of seasons', 'https://magenoir.com/collection/EN/vegetal/Ritual-of-seasons.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('robe de kerloch', 'Les dégâts des sorts Végétaux (dont Permanents) que vous contrôlez sont augmentés de 3.Les dégâts qui vous sont infligés sont réduits de 2.A tout moment, vous pouvez détruire cet Équipement et défausser toute votre main pour annuler les dégâts qui vous sont infligés jusqu''à la fin du tour.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Robe-de-kerloch.png', 'fr', 'Robe de Kerloc''h', 'https://magenoir.com/collection/FR/vegetal/Robe-de-kerloch.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('robe de kerloch', 'Damage from Vegetal spells you control (Permanents included) is increased by 3.Inflicted damage you take is reduced by 2.At any time, you may sacrifice this Equipment and discard your hand to prevent all damage you would take until the end of the turn.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/kerlochs-robe.png', 'en', 'Kerloc''h''s robe', 'https://magenoir.com/collection/EN/vegetal/Kerlochs-robe.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roi des arbres', 'Unique (Vous ne pouvez contrôler qu''un seul exemplaire de cette carte)Au début de votre tour, inflige 2 points de dégâts à l''adversaire pour chaque Arbre sur le plateau.Si vous êtes Mage Noir, vos autres Arbres appliquent leurs effets 1 fois de plus.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Roi-des-arbres.png', 'fr', 'Roi des arbres', 'https://magenoir.com/collection/FR/vegetal/Roi-des-arbres.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('roi des arbres', 'Unique (You may only control one copy of this card)At the beginning of your turn, inflicts 2 damage to the opponent for every Tree in play.If you''re a Mage Noir, your other Trees apply their effects 1 more time.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/King_of_trees.png', 'en', 'King of Trees', 'https://magenoir.com/collection/EN/vegetal/King-of-trees.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ronces ephemeres', 'L''adversaire choisit 1 option :- Il défausse 1 carte de sa main- Il perd 3 Points de Vie', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Ronces-ephemeres.png', 'fr', 'Ronces éphémères', 'https://magenoir.com/collection/FR/vegetal/Ronces-ephemeres.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('ronces ephemeres', 'The opponent chooses 1 option:- They discard 1 card in hand.- They lose 3 Health Points.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Ephemeral-brambles.png', 'en', 'Ephemeral brambles', 'https://magenoir.com/collection/EN/vegetal/Ephemeral-brambles.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('semee prodigieuse', 'Tant que ce Permanent est en jeu, jusqu''à 3 composants Graine que vous contrôlez ont : "Transmutable : Arbre" (Ce sort est utilisable comme composant Arbre.)Au début de votre tour, payez 1 Mana Végétal et 1 Mana Eau ou détruisez Semée prodigieuse.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/Semee-prodigieuse.png', 'fr', 'Semée prodigieuse', 'https://magenoir.com/collection/FR/vegetal/Semee-prodigieuse.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('semee prodigieuse', 'As long as this Permanent is in play, up to 3 Seed components you control have Transmutable : Tree (This spell can be used as a Tree component.)At the beginning of your turn, pay 1 Vegetal Mana and 1 Water Mana or destroy Prodigious sowing.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/Prodigious-sowing.png', 'en', 'Prodigious sowing', 'https://magenoir.com/collection/EN/vegetal/Prodigious-sowing.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tourment d epines', 'Si l''adversaire a pioché plus d''1 carte ce tour-ci, ce sort est Rapide. (Ce sort peut être activé à tout moment )L''adversaire peut défausser autant de cartes de sa main qu''il le souhaite.Puis ce sort lui inflige 1 point de dégâts par carte qu''il a en main.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/FR/Vegetal/tourment_d_epines.png', 'fr', 'Tourment d''épines', 'https://magenoir.com/collection/FR/vegetal/Tourment-d-epines.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;
INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ('tourment d epines', 'If the opponent drew more than 1 card this turn, this spell has Quickcast. (This spell can be activated at any time) The opponent may discard any number of cards from hand.Then, this spell inflicts 1 damage to them per card they have in hand.', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main/cards/EN/vegetal/thorn_torment.png', 'en', 'Thorn torment', 'https://magenoir.com/collection/EN/vegetal/Thorn-torment.html')
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;

COMMIT;

-- Réactiver les contraintes de clés étrangères
SET session_replication_role = DEFAULT;

-- Script terminé. 410 entrées traitées.