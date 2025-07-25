#!/usr/bin/env python3
"""
Générateur SQL amélioré pour les cartes Mage Noir avec correspondance automatique FR/EN
"""

import json
import re
import time
import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse

class MageNoirSQLGeneratorV2:
    def __init__(self):
        self.element_mapping = {
            'air': 'Air',
            'vegetal': 'Végétal', 
            'fire': 'Feu',
            'feu': 'Feu',
            'water': 'Eau',
            'eau': 'Eau',
            'mineral': 'Minéral',
            'arcane': 'Arcane'
        }
        
        # Charger le mapping manuel des correspondances FR/EN
        self.manual_mapping = self.load_manual_mapping()
        
    def load_manual_mapping(self):
        """Charge le mapping manuel des correspondances FR/EN"""
        try:
            with open('card_mapping_fr_en_structure.json', 'r', encoding='utf-8') as f:
                return json.load(f)
        except Exception as e:
            print(f"Impossible de charger le mapping manuel: {e}")
            return {"mappings": {}, "reverse_mappings": {}}
        
    def load_urls_data(self, json_file):
        """Charge les données des URLs depuis le fichier JSON"""
        with open(json_file, 'r', encoding='utf-8') as f:
            return json.load(f)
    
    def extract_mana_cost_from_webpage(self, url):
        """Extrait toutes les informations de la carte depuis la page web"""
        try:
            print(f"  Extraction donnees: {url}")
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
            }
            
            response = requests.get(url, headers=headers, timeout=10)
            response.raise_for_status()
            response.encoding = 'utf-8'
            
            soup = BeautifulSoup(response.text, 'html.parser')
            text_content = soup.get_text()
            
            # Initialiser les données de la carte
            card_data = {
                'total_cost': 0,
                'mana_costs': {
                    'manaVegetal': 0,
                    'manaFeu': 0,
                    'manaAir': 0,
                    'manaEau': 0,
                    'manaMineral': 0,
                    'manaArcane': 0
                },
                'component_costs': [],
                'type': 'Sort',  # Valeur par défaut
                'extension': 'Jeu de base',  # Valeur par défaut
                'artwork': 'Artiste inconnu',  # Valeur par défaut
                'description': '',
                'effects': ''
            }
            
            # Extraire le Type (FR/EN)
            type_match = re.search(r'(Type|Type)\s*:\s*([^\n\r]+)', text_content)
            if type_match:
                card_data['type'] = type_match.group(2).strip()
            
            # Extraire l'Extension (FR/EN)
            extension_match = re.search(r'(Extension|Extension)\s*:\s*([^\n\r]+)', text_content)
            if extension_match:
                card_data['extension'] = extension_match.group(2).strip()
            
            # Extraire l'Illustration/Artwork (FR/EN)
            artwork_match = re.search(r'(Illustration|Artwork)\s*:\s*([^\n\r]+)', text_content)
            if artwork_match:
                card_data['artwork'] = artwork_match.group(2).strip()
            
            # Extraire les Effets/Description (FR/EN)
            effects_match = re.search(r'(Effets|Effects|Effect)\s*:\s*(.*?)(?=Illustration|Artwork|Texte d\'ambiance|Flavor text|Extension|$)', text_content, re.DOTALL)
            if effects_match:
                effects_text = effects_match.group(2).strip()
                # Nettoyer le texte des effets
                effects_text = re.sub(r'\s+', ' ', effects_text)
                effects_text = re.sub(r'(Notes|Notes)\s*:.*$', '', effects_text).strip()
                # Supprimer les patterns d'illustration qui pourraient traîner
                effects_text = re.sub(r'(Illustration|Artwork)\s*:.*$', '', effects_text).strip()
                card_data['description'] = effects_text
                card_data['effects'] = effects_text
            
            # Extraire les coûts de mana et calculer le total (FR/EN)
            total_mana_cost = 0
            mana_patterns = [
                (r'(\d+)\s+(Air|Air)', 'manaAir'),
                (r'(\d+)\s+(Feu|Fire)', 'manaFeu'),
                (r'(\d+)\s+(Eau|Water)', 'manaEau'),
                (r'(\d+)\s+(Végétal|Plant)', 'manaVegetal'),
                (r'(\d+)\s+(Minéral|Mineral)', 'manaMineral'),
                (r'(\d+)\s+(Arcane|Arcane)', 'manaArcane')
            ]
            
            for pattern, mana_type in mana_patterns:
                matches = re.findall(pattern, text_content)
                if matches:
                    cost = int(matches[0][0])  # Le premier groupe de capture contient le nombre
                    card_data['mana_costs'][mana_type] = cost
                    total_mana_cost += cost
            
            card_data['total_cost'] = total_mana_cost
            
            # Extraire les composants requis (FR/EN)
            component_match = re.search(r'(Composants requis|Composants nécessaires|Required components)\s*:\s*(\d+)\s+(\w+)', text_content)
            if component_match:
                component_count = int(component_match.group(2))
                component_name = component_match.group(3)
                
                card_data['component_costs'].append({
                    'componentName': component_name,
                    'quantity': component_count
                })
            
            return card_data
            
        except Exception as e:
            print(f"    Erreur extraction {url}: {e}")
            # Retourner des valeurs par défaut en cas d'erreur
            return {
                'total_cost': 0,
                'mana_costs': {
                    'manaVegetal': 0,
                    'manaFeu': 0,
                    'manaAir': 0,
                    'manaEau': 0,
                    'manaMineral': 0,
                    'manaArcane': 0
                },
                'component_costs': [],
                'type': 'Sort',
                'extension': 'Jeu de base',
                'artwork': 'Artiste inconnu',
                'description': 'Description à compléter',
                'effects': ''
            }

    def extract_card_info_from_url(self, url):
        """Extrait les informations de la carte depuis l'URL"""
        parsed = urlparse(url)
        path_parts = parsed.path.split('/')
        
        if len(path_parts) >= 5:
            lang_code = path_parts[2]
            element = path_parts[3] 
            card_filename = path_parts[4]
            
            # Enlever l'extension .html
            card_name_raw = card_filename.replace('.html', '')
            
            return {
                'language_code': lang_code,
                'element_raw': element,
                'element': self.element_mapping.get(element.lower(), element),
                'card_name_raw': card_name_raw,
                'card_name_normalized': self.normalize_card_name(card_name_raw),
                'card_name_display': self.clean_card_name(card_name_raw),
                'url': url
            }
        return None
    
    def normalize_card_name(self, card_name_raw):
        """Normalise le nom de carte pour faciliter la correspondance"""
        name = card_name_raw.lower()
        name = name.replace('_', ' ').replace('-', ' ')
        name = re.sub(r'[^a-zàâäçéèêëïîôùûüÿñæœ0-9\s]', '', name)
        name = re.sub(r'\s+', ' ', name).strip()
        
        return name
    
    def clean_card_name(self, card_name_raw):
        """Nettoie le nom de la carte pour l'affichage"""
        name = card_name_raw.replace('_', ' ').replace('-', ' ')
        name = re.sub(r'\s+', ' ', name).strip()
        # Capitaliser proprement
        return ' '.join(word.capitalize() for word in name.split())
    

    def find_manual_match(self, french_card, english_cards):
        """Trouve la correspondance anglaise via le mapping manuel"""
        fr_name = french_card['card_name_normalized']
        fr_element = french_card['element'].lower()
        
        # Convertir l'élément français vers l'élément utilisé dans le mapping JSON
        element_for_mapping = fr_element
        if fr_element == 'feu':
            element_for_mapping = 'fire'
        elif fr_element == 'eau':
            element_for_mapping = 'water'
        elif fr_element == 'végétal':
            element_for_mapping = 'vegetal'
        elif fr_element == 'minéral':
            element_for_mapping = 'mineral'
        
        # Chercher dans le mapping manuel
        element_mappings = self.manual_mapping.get('mappings', {}).get(element_for_mapping, {})
        expected_en_name = element_mappings.get(fr_name)
        
        # Vérifier que ce n'est pas un placeholder
        if expected_en_name and not expected_en_name.startswith('EN_NAME_FOR_'):
            # Chercher la carte anglaise correspondante
            for en_card in english_cards:
                if en_card['card_name_normalized'] == expected_en_name:
                    print(f"    Correspondance manuelle trouvee: {fr_name} <-> {expected_en_name}")
                    return en_card, 1.0  # Score parfait pour les correspondances manuelles
        
        return None, 0
    
    def find_matching_image_url(self, card_info, image_urls):
        """Trouve l'URL de l'image correspondante"""
        element_raw = card_info['element_raw']
        card_name_raw = card_info['card_name_raw']
        lang_code = card_info['language_code']
        
        # Chercher une correspondance exacte ou approximative
        for image_url in image_urls:
            if (lang_code in image_url and 
                element_raw.lower() in image_url.lower()):
                
                # Vérifier le nom de la carte (avec variations)
                url_name = image_url.split('/')[-1].replace('.png', '').lower()
                card_name_variants = [
                    card_name_raw.lower(),
                    card_name_raw.lower().replace('_', '-'),
                    card_name_raw.lower().replace('-', '_'),
                    card_name_raw.lower().replace('_', '').replace('-', ''),
                ]
                
                for variant in card_name_variants:
                    if variant in url_name or url_name in variant:
                        return image_url
                        
        return None
    
    def process_urls_data(self, urls_data):
        """Traite toutes les URLs et génère les données des cartes avec correspondance FR/EN"""
        french_cards = []
        english_cards = []
        
        # Extraire les informations des cartes françaises
        for fr_url in urls_data['french_card_urls']:
            card_info = self.extract_card_info_from_url(fr_url)
            if card_info:
                french_cards.append(card_info)
        
        # Extraire les informations des cartes anglaises
        for en_url in urls_data['english_card_urls']:
            card_info = self.extract_card_info_from_url(en_url)
            if card_info:
                english_cards.append(card_info)
        
        print(f"Correspondance de {len(french_cards)} cartes francaises avec {len(english_cards)} cartes anglaises...")
        
        # Trier les cartes par élément et par ordre alphabétique pour faciliter la correspondance
        french_cards_sorted = sorted(french_cards, key=lambda x: (x['element'], x['card_name_normalized']))
        english_cards_sorted = sorted(english_cards, key=lambda x: (x['element'], x['card_name_normalized']))
        
        # Grouper par élément
        fr_by_element = {}
        en_by_element = {}
        
        for card in french_cards_sorted:
            element = card['element']
            if element not in fr_by_element:
                fr_by_element[element] = []
            fr_by_element[element].append(card)
            
        for card in english_cards_sorted:
            element = card['element']
            if element not in en_by_element:
                en_by_element[element] = []
            en_by_element[element].append(card)
        
        # Créer les correspondances carte par carte
        matched_cards = []
        card_counter = 1
        
        for element in sorted(fr_by_element.keys()):
            fr_cards_in_element = fr_by_element[element]
            en_cards_in_element = en_by_element.get(element, [])
            
            print(f"  {element}: {len(fr_cards_in_element)} FR, {len(en_cards_in_element)} EN")
            
            # Créer une copie de la liste anglaise pour pouvoir enlever les cartes déjà matchées
            remaining_en_cards = en_cards_in_element.copy()
            
            # Pour chaque carte française, chercher la correspondance anglaise via le mapping manuel
            for fr_card in fr_cards_in_element:
                # Chercher la correspondance anglaise via le mapping manuel uniquement
                en_match, match_score = self.find_manual_match(fr_card, remaining_en_cards)
                
                # Générer un ID basé sur la carte française
                base_name = fr_card['card_name_normalized']
                card_id = base_name.lower().strip()
                
                # Construire la carte avec ses localisations
                card_data = {
                    'card_id': card_id,
                    'element': fr_card['element'],
                    'localizations': {},
                    'match_score': match_score if en_match else 0.5,
                    'total_cost': 0,
                    'mana_costs': {
                        'manaVegetal': 0,
                        'manaFeu': 0,
                        'manaAir': 0,
                        'manaEau': 0,
                        'manaMineral': 0,
                        'manaArcane': 0
                    },
                    'component_costs': [],
                    'type': 'Sort',
                    'extension': 'Jeu de base',
                    'artwork': 'Artiste inconnu'
                }
                
                # Ajouter la localisation française et extraire les coûts depuis la page FR
                fr_image = self.find_matching_image_url(fr_card, urls_data['french_image_urls'])
                card_data['localizations']['fr'] = {
                    'name': fr_card['card_name_display'],
                    'image_url': fr_image or '',
                    'card_url': fr_card['url'],
                    'description': ''  # Sera rempli après extraction
                }
                
                # Extraire toutes les données depuis la page française
                print(f"  Extraction donnees: {fr_card['card_name_display']}")
                card_info = self.extract_mana_cost_from_webpage(fr_card['url'])
                card_data['total_cost'] = card_info['total_cost']
                card_data['mana_costs'] = card_info['mana_costs']
                card_data['component_costs'] = card_info['component_costs']
                card_data['type'] = card_info['type']
                card_data['extension'] = card_info['extension']
                card_data['artwork'] = card_info['artwork']
                
                # Ajouter la description française
                card_data['localizations']['fr']['description'] = card_info['description']
                
                # Petite pause pour éviter de surcharger le serveur
                time.sleep(0.5)
                
                # Traiter SEULEMENT les cartes avec correspondance manuelle
                if en_match:
                    en_image = self.find_matching_image_url(en_match, urls_data['english_image_urls'])
                    card_data['localizations']['en'] = {
                        'name': en_match['card_name_display'],
                        'image_url': en_image or '',
                        'card_url': en_match['url'],
                        'description': ''  # Sera rempli après extraction
                    }
                    
                    # Toujours extraire les données depuis la page anglaise pour la localisation
                    print(f"  Extraction donnees (EN): {en_match['card_name_display']}")
                    en_card_info = self.extract_mana_cost_from_webpage(en_match['url'])
                    
                    # Toujours utiliser la description anglaise pour la localisation EN
                    card_data['localizations']['en']['description'] = en_card_info['description']
                    
                    # Retirer la carte anglaise de la liste des cartes disponibles
                    remaining_en_cards.remove(en_match)
                    
                    # Petite pause pour éviter de surcharger le serveur
                    time.sleep(0.5)
                    
                    # Ajouter la carte SEULEMENT si correspondance manuelle trouvée
                    matched_cards.append(card_data)
                    card_counter += 1
                else:
                    print(f"    IGNORE - Aucune correspondance manuelle trouvee pour: {fr_card['card_name_display']}")
                    # Ne pas ajouter la carte sans correspondance manuelle
        
        return matched_cards
    
    def generate_sql(self, cards_data):
        """Génère le script SQL complet"""
        sql_lines = []
        
        # En-tête du fichier
        sql_lines.append("-- Fichier SQL généré automatiquement pour les cartes Mage Noir")
        sql_lines.append(f"-- Généré le : {time.strftime('%Y-%m-%d %H:%M:%S')}")
        sql_lines.append(f"-- Nombre de cartes : {len(cards_data)}")
        
        # Statistiques de correspondance
        matched_count = sum(1 for card in cards_data if card['match_score'] > 0)
        sql_lines.append(f"-- Cartes avec correspondance FR/EN : {matched_count}")
        sql_lines.append("")
        
        # Suppression des données existantes
        sql_lines.append("-- Delete CardLocalization")
        sql_lines.append("DELETE FROM card_localization")
        sql_lines.append("WHERE card_id IN (")
        sql_lines.append("  SELECT id FROM card WHERE game_id = 'mage_noir'")
        sql_lines.append(");")
        sql_lines.append("")
        sql_lines.append("-- Delete Card")
        sql_lines.append("DELETE FROM card")
        sql_lines.append("WHERE game_id = 'mage_noir';")
        sql_lines.append("")
        
        # Générer les cartes par élément
        elements = {}
        for card in cards_data:
            element = card['element']
            if element not in elements:
                elements[element] = []
            elements[element].append(card)
        
        for element, element_cards in sorted(elements.items()):
            sql_lines.append("=" * 120)
            sql_lines.append(f"-- {element}")
            sql_lines.append("=" * 120)
            sql_lines.append("")
            
            for card in sorted(element_cards, key=lambda x: x['card_id']):
                self.generate_card_sql(card, sql_lines)
                sql_lines.append("")
        
        return '\n'.join(sql_lines)

    def generate_card_sql(self, card, sql_lines):
        """Génère le SQL pour une carte individuelle"""
        card_id = card['card_id']
        element = card['element']
        
        # Nom d'affichage (français en priorité)
        display_name = card['localizations'].get('fr', {}).get('name', 
                      card['localizations'].get('en', {}).get('name', card_id))
        
        # Utiliser les données extraites des pages web
        total_cost = card.get('total_cost', 0)
        mana_costs = card.get('mana_costs', {
            'manaVegetal': 0,
            'manaFeu': 0,
            'manaAir': 0,
            'manaEau': 0,
            'manaMineral': 0,
            'manaArcane': 0
        })
        component_costs = card.get('component_costs', [])
        card_type = card.get('type', 'Sort')
        extension = card.get('extension', 'Jeu de base')
        artwork = card.get('artwork', 'Artiste inconnu')
        
        # Commentaire de séparation
        sql_lines.append("=" * 120)
        sql_lines.append(f"-- {display_name}")
        sql_lines.append("=" * 120)
        
        # INSERT pour la carte principale
        sql_lines.append(f"INSERT INTO card (id, game_id, properties) VALUES")
        sql_lines.append(f"('{card_id}', 'mage_noir', '{{")
        sql_lines.append(f'  "type": "{card_type}",')
        sql_lines.append(f'  "element": "{element}",')
        sql_lines.append('  "manaCost": {')
        sql_lines.append(f'    "total": {total_cost},')
        sql_lines.append(f'    "manaVegetal": {mana_costs["manaVegetal"]},')
        sql_lines.append(f'    "manaFeu": {mana_costs["manaFeu"]},')
        sql_lines.append(f'    "manaAir": {mana_costs["manaAir"]},')
        sql_lines.append(f'    "manaEau": {mana_costs["manaEau"]},')
        sql_lines.append(f'    "manaMineral": {mana_costs["manaMineral"]},')
        sql_lines.append(f'    "manaArcane": {mana_costs["manaArcane"]}')
        sql_lines.append('  },')
        
        # Components reste toujours vide selon les spécifications
        sql_lines.append('  "components": [],')
        
        # ComponentCost : tableau d'objets avec componentName et quantity
        if component_costs:
            sql_lines.append('  "componentCost": [')
            for i, component_obj in enumerate(component_costs):
                comma = ',' if i < len(component_costs) - 1 else ''
                component_name = component_obj['componentName']
                quantity = component_obj['quantity']
                sql_lines.append(f'    {{"componentName": "{component_name}", "quantity": {quantity}}}{comma}')
            sql_lines.append('  ],')
        else:
            sql_lines.append('  "componentCost": [],')
        
        sql_lines.append(f'  "extension": "{extension}",')
        sql_lines.append(f'  "artwork": "{artwork}"')
        sql_lines.append("}');")
        sql_lines.append("")
        
        # Commentaire pour les localisations
        sql_lines.append(f"-- Localisations pour {display_name}")
        sql_lines.append("INSERT INTO public.card_localization")
        sql_lines.append("(card_id, description, image_url, locale, \"name\")")
        sql_lines.append("VALUES")
        
        localizations = []
        
        # Localisation française (obligatoire)
        if 'fr' in card['localizations']:
            fr_loc = card['localizations']['fr']
            fr_name = fr_loc.get('name', card_id)
            fr_image = fr_loc.get('image_url', '')
            fr_description = fr_loc.get('description', 'Description à compléter')
            # Échapper les apostrophes pour PostgreSQL
            fr_description_escaped = fr_description.replace("'", "''")
            localizations.append(f"('{card_id}', E'{fr_description_escaped}', '{fr_image}', 'fr', '{fr_name}')")
        else:
            # Si pas de français, utiliser un placeholder
            localizations.append(f"('{card_id}', E'Description à compléter', '', 'fr', '{display_name}')")
        
        # Localisation anglaise (obligatoire)
        if 'en' in card['localizations']:
            en_loc = card['localizations']['en']
            en_name = en_loc.get('name', card_id)
            en_image = en_loc.get('image_url', '')
            en_description = en_loc.get('description', 'Description to complete')
            # Échapper les apostrophes pour PostgreSQL
            en_description_escaped = en_description.replace("'", "''")
            localizations.append(f"('{card_id}', E'{en_description_escaped}', '{en_image}', 'en', '{en_name}')")
        else:
            # Si pas d'anglais, utiliser un placeholder
            localizations.append(f"('{card_id}', E'Description to complete', '', 'en', '{display_name}')")
        
        # Joindre les localisations avec des virgules
        sql_lines.append(',\n'.join(localizations) + ';')

def main():
    """Fonction principale"""
    print("GENERATION DU SCRIPT SQL MAGE NOIR V2 (avec correspondance FR/EN)")
    print("=" * 80)
    
    generator = MageNoirSQLGeneratorV2()
    
    # Charger les données des URLs
    print("Chargement des donnees des URLs...")
    urls_data = generator.load_urls_data('exact_410_card_urls_and_images_fr_en.json')
    print(f"{urls_data['cards_total_count']} cartes et {urls_data['images_total_count']} images chargees")
    
    # Traiter les URLs avec correspondance FR/EN
    print("\nTraitement des URLs avec correspondance FR/EN...")
    cards_data = generator.process_urls_data(urls_data)
    print(f"{len(cards_data)} cartes traitees")
    
    # Générer le SQL
    print("\nGeneration du script SQL...")
    sql_content = generator.generate_sql(cards_data)
    
    # Sauvegarder le fichier SQL
    output_file = '../backend/src/main/resources/mage_noir_card_init_generated_v2.sql'
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    print(f"✅ Script SQL généré : {output_file}")
    print(f"📊 Nombre de cartes : {len(cards_data)}")
    
    # Statistiques de correspondance
    matched_count = sum(1 for card in cards_data if card['match_score'] > 0)
    print(f"📊 Cartes avec correspondance FR/EN : {matched_count}/{len(cards_data)}")
    
    # Statistiques par élément
    elements_count = {}
    for card in cards_data:
        element = card['element']
        elements_count[element] = elements_count.get(element, 0) + 1
    
    print("\n📊 Répartition par élément :")
    for element, count in sorted(elements_count.items()):
        print(f"  {element}: {count} cartes")

if __name__ == "__main__":
    main()
