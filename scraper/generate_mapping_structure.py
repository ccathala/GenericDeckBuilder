#!/usr/bin/env python3
"""
Générateur de structure de mapping pour toutes les cartes françaises
"""

import json
import re
from urllib.parse import urlparse

def normalize_card_name(card_name_raw):
    """Normalise le nom de carte"""
    name = card_name_raw.lower()
    name = name.replace('_', ' ').replace('-', ' ')
    name = re.sub(r'[^a-zàâäçéèêëïîôùûüÿñæœ0-9\s]', '', name)
    name = re.sub(r'\s+', ' ', name).strip()
    return name

def extract_card_info_from_url(url):
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
            'card_name_raw': card_name_raw,
            'card_name_normalized': normalize_card_name(card_name_raw),
        }
    return None

def generate_mapping_structure():
    """Génère la structure du mapping avec toutes les cartes françaises"""
    print("📂 Chargement des URLs...")
    
    # Charger les données des URLs
    with open('exact_410_card_urls_and_images_fr_en.json', 'r', encoding='utf-8') as f:
        urls_data = json.load(f)
    
    # Extraire toutes les cartes françaises
    french_cards = []
    for fr_url in urls_data['french_card_urls']:
        card_info = extract_card_info_from_url(fr_url)
        if card_info:
            french_cards.append(card_info)
    
    print(f"✅ {len(french_cards)} cartes françaises trouvées")
    
    # Grouper par élément
    cards_by_element = {}
    for card in french_cards:
        element = card['element_raw'].lower()
        if element not in cards_by_element:
            cards_by_element[element] = []
        cards_by_element[element].append(card)
    
    # Trier les cartes par nom dans chaque élément
    for element in cards_by_element:
        cards_by_element[element].sort(key=lambda x: x['card_name_normalized'])
    
    # Générer la structure du mapping
    mappings = {}
    
    for element, cards in sorted(cards_by_element.items()):
        print(f"📊 {element.capitalize()}: {len(cards)} cartes")
        
        mappings[element] = {}
        
        for card in cards:
            fr_name = card['card_name_normalized']
            # Placeholder pour le nom anglais
            en_placeholder = f"EN_NAME_FOR_{card['card_name_raw'].upper()}"
            
            mappings[element][fr_name] = en_placeholder
    
    # Créer la structure complète
    mapping_structure = {
        "description": "Mapping manuel des correspondances entre cartes françaises et anglaises",
        "version": "2.0",
        "instructions": [
            "REMPLACER LES PLACEHOLDERS EN_NAME_FOR_* PAR LES VRAIS NOMS ANGLAIS",
            "Utiliser des noms normalisés (minuscules, espaces au lieu de tirets/underscores)",
            "Exemple: remplacer 'EN_NAME_FOR_ACCELERATION' par 'acceleration'"
        ],
        "stats": {
            "total_french_cards": len(french_cards),
            "elements": {element: len(cards) for element, cards in cards_by_element.items()}
        },
        "mappings": mappings
    }
    
    # Sauvegarder
    output_file = 'card_mapping_fr_en_structure.json'
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(mapping_structure, f, indent=2, ensure_ascii=False)
    
    print(f"✅ Structure générée: {output_file}")
    print(f"📊 Total: {len(french_cards)} cartes dans {len(cards_by_element)} éléments")
    
    # Afficher un aperçu
    print("\n📋 Aperçu de la structure générée:")
    for element, cards in list(cards_by_element.items())[:2]:  # Premiers 2 éléments
        print(f"\n  {element.upper()}:")
        for card in cards[:3]:  # Premières 3 cartes
            fr_name = card['card_name_normalized']
            print(f"    '{fr_name}': 'EN_NAME_FOR_{card['card_name_raw'].upper()}'")
        if len(cards) > 3:
            print(f"    ... et {len(cards) - 3} autres cartes")

if __name__ == "__main__":
    generate_mapping_structure()
