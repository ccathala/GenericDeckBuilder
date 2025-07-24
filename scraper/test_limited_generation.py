#!/usr/bin/env python3
"""
Test du générateur SQL complet avec extraction des coûts de mana - version limitée
"""

import json
from sql_generator_v2 import MageNoirSQLGeneratorV2

def test_limited_generation():
    """Test avec seulement quelques cartes pour valider le processus"""
    generator = MageNoirSQLGeneratorV2()
    
    # Charger les données complètes
    print("📂 Chargement des données...")
    urls_data = generator.load_urls_data('exact_410_card_urls_and_images_fr_en.json')
    
    # Limiter à seulement les 3 premières cartes pour le test
    limited_data = {
        'french_card_urls': urls_data['french_card_urls'][:3],
        'english_card_urls': urls_data['english_card_urls'][:3],
        'french_image_urls': urls_data['french_image_urls'][:3], 
        'english_image_urls': urls_data['english_image_urls'][:3]
    }
    
    print(f"🧪 Test avec {len(limited_data['french_card_urls'])} cartes FR et {len(limited_data['english_card_urls'])} cartes EN")
    
    # Traiter les données avec extraction des coûts
    cards_data = generator.process_urls_data(limited_data)
    
    print(f"✅ {len(cards_data)} cartes traitées")
    
    # Générer le SQL
    sql_content = generator.generate_sql(cards_data)
    
    # Sauvegarder le résultat
    output_file = '../backend/src/main/resources/mage_noir_test_limited.sql'
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    print(f"📝 SQL généré et sauvegardé: {output_file}")
    
    # Afficher un exemple de carte
    if cards_data:
        example_card = cards_data[0]
        print(f"\n📊 Exemple de carte traitée:")
        print(f"  ID: {example_card['card_id']}")
        print(f"  Élément: {example_card['element']}")
        print(f"  Total mana: {example_card.get('total_cost', 'N/A')}")
        print(f"  Coûts: {example_card.get('mana_costs', 'N/A')}")
        print(f"  Composants: {example_card.get('components', 'N/A')}")

if __name__ == "__main__":
    test_limited_generation()
