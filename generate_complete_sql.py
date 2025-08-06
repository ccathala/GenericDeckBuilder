#!/usr/bin/env python3
"""
Générateur SQL complet pour mise à jour des card_url depuis le CSV
"""

import csv
import os

def get_element_from_url(card_url):
    """Détermine l'élément depuis l'URL"""
    url_lower = card_url.lower()
    if '/air/' in url_lower:
        return 'AIR'
    elif '/arcane/' in url_lower:
        return 'ARCANE'
    elif '/feu/' in url_lower or '/fire/' in url_lower:
        return 'FEU'
    elif '/eau/' in url_lower or '/water/' in url_lower:
        return 'EAU'
    elif '/vegetal/' in url_lower or '/plant/' in url_lower:
        return 'VÉGÉTAL'
    elif '/mineral/' in url_lower:
        return 'MINÉRAL'
    else:
        return 'AUTRE'

def escape_sql_string(text):
    """Échapper les apostrophes pour SQL"""
    return text.replace("'", "''")

def generate_complete_sql():
    """Génère le script SQL complet"""
    
    # Chemin vers le fichier CSV (à ajuster selon votre environnement)
    csv_paths = [
        'c:/Users/Charles/card_localization_202508062027_export_card_localization.csv',
        '../card_localization_202508062027_export_card_localization.csv',
        'card_localization_202508062027_export_card_localization.csv'
    ]
    
    csv_file = None
    for path in csv_paths:
        if os.path.exists(path):
            csv_file = path
            break
    
    if not csv_file:
        print("❌ Fichier CSV non trouvé. Veuillez copier le fichier dans le workspace.")
        return False
    
    print(f"📁 Lecture du fichier: {csv_file}")
    
    sql_lines = []
    
    # En-tête
    sql_lines.append("-- Script SQL pour mise à jour de la table card_localization avec les card_url")
    sql_lines.append("-- Généré automatiquement à partir du fichier CSV export complet")
    sql_lines.append("-- Date de génération : 2025-08-06")
    sql_lines.append("")
    
    # Dictionnaire pour grouper par élément
    elements_cards = {}
    total_count = 0
    
    try:
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            
            for row in reader:
                card_id = row['card_id'].strip()
                locale = row['locale']
                card_url = row['card_url']
                name = row['name']
                
                element = get_element_from_url(card_url)
                
                if element not in elements_cards:
                    elements_cards[element] = []
                    
                elements_cards[element].append({
                    'card_id': card_id,
                    'locale': locale,
                    'card_url': card_url,
                    'name': name
                })
                total_count += 1
        
        sql_lines.append(f"-- Nombre d'enregistrements à mettre à jour : {total_count}")
        sql_lines.append("")
        
        # Générer les updates par élément
        for element in sorted(elements_cards.keys()):
            sql_lines.append("-- " + "=" * 70)
            sql_lines.append(f"-- {element} - Cartes de {element}")
            sql_lines.append("-- " + "=" * 70)
            sql_lines.append("")
            
            # Grouper par card_id pour avoir FR et EN ensemble
            cards_by_id = {}
            for card in elements_cards[element]:
                card_id = card['card_id']
                if card_id not in cards_by_id:
                    cards_by_id[card_id] = []
                cards_by_id[card_id].append(card)
            
            # Générer les updates pour chaque carte
            for card_id in sorted(cards_by_id.keys()):
                cards = cards_by_id[card_id]
                
                # Obtenir le nom français pour le commentaire
                fr_name = None
                for card in cards:
                    if card['locale'] == 'fr':
                        fr_name = card['name']
                        break
                
                if fr_name:
                    sql_lines.append(f"-- {fr_name}")
                else:
                    sql_lines.append(f"-- {card_id}")
                    
                # Générer les updates pour FR et EN
                for card in sorted(cards, key=lambda x: x['locale']):
                    locale = card['locale']
                    card_url = card['card_url']
                    
                    sql_lines.append("UPDATE card_localization")
                    sql_lines.append(f"SET card_url = '{card_url}'")
                    sql_lines.append(f"WHERE card_id = '{card_id}' AND locale = '{locale}';")
                    sql_lines.append("")
        
        # Vérification finale
        sql_lines.append("-- " + "=" * 70)
        sql_lines.append("-- VÉRIFICATION FINALE")
        sql_lines.append("-- " + "=" * 70)
        sql_lines.append("")
        sql_lines.append("-- Nombre d'enregistrements mis à jour")
        sql_lines.append("SELECT COUNT(*) as \"Enregistrements avec card_url\"")
        sql_lines.append("FROM card_localization")
        sql_lines.append("WHERE card_url IS NOT NULL AND card_url != '';")
        sql_lines.append("")
        sql_lines.append("-- Vérification par élément")
        sql_lines.append("SELECT ")
        sql_lines.append("  CASE ")
        sql_lines.append("    WHEN card_url LIKE '%/air/%' THEN 'AIR'")
        sql_lines.append("    WHEN card_url LIKE '%/arcane/%' THEN 'ARCANE'")
        sql_lines.append("    WHEN card_url LIKE '%/feu/%' OR card_url LIKE '%/fire/%' THEN 'FEU'")
        sql_lines.append("    WHEN card_url LIKE '%/eau/%' OR card_url LIKE '%/water/%' THEN 'EAU'")
        sql_lines.append("    WHEN card_url LIKE '%/vegetal/%' OR card_url LIKE '%/plant/%' THEN 'VÉGÉTAL'")
        sql_lines.append("    WHEN card_url LIKE '%/mineral/%' THEN 'MINÉRAL'")
        sql_lines.append("    ELSE 'AUTRE'")
        sql_lines.append("  END as element,")
        sql_lines.append("  COUNT(*) as nombre")
        sql_lines.append("FROM card_localization")
        sql_lines.append("WHERE card_url IS NOT NULL AND card_url != ''")
        sql_lines.append("GROUP BY ")
        sql_lines.append("  CASE ")
        sql_lines.append("    WHEN card_url LIKE '%/air/%' THEN 'AIR'")
        sql_lines.append("    WHEN card_url LIKE '%/arcane/%' THEN 'ARCANE'")
        sql_lines.append("    WHEN card_url LIKE '%/feu/%' OR card_url LIKE '%/fire/%' THEN 'FEU'")
        sql_lines.append("    WHEN card_url LIKE '%/eau/%' OR card_url LIKE '%/water/%' THEN 'EAU'")
        sql_lines.append("    WHEN card_url LIKE '%/vegetal/%' OR card_url LIKE '%/plant/%' THEN 'VÉGÉTAL'")
        sql_lines.append("    WHEN card_url LIKE '%/mineral/%' THEN 'MINÉRAL'")
        sql_lines.append("    ELSE 'AUTRE'")
        sql_lines.append("  END")
        sql_lines.append("ORDER BY element;")
        sql_lines.append("")
        sql_lines.append("-- Fin du script")
        
        # Écrire le fichier SQL complet
        output_file = 'update_card_localization_with_card_url_COMPLETE.sql'
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write('\n'.join(sql_lines))
        
        print(f"✅ Script SQL complet généré: {output_file}")
        print(f"📊 Nombre total d'éléments: {len(elements_cards)}")
        print(f"📊 Nombre total d'enregistrements: {total_count}")
        
        print("\n📋 Répartition par élément:")
        for element in sorted(elements_cards.keys()):
            count = len(elements_cards[element])
            print(f"  {element}: {count} entrées")
        
        return True
        
    except Exception as e:
        print(f"❌ Erreur lors de la lecture du CSV: {e}")
        return False

if __name__ == "__main__":
    print("🔧 Génération du script SQL complet pour card_url")
    print("=" * 60)
    
    success = generate_complete_sql()
    
    if success:
        print("\n🎉 Génération terminée avec succès!")
        print("📝 Vous pouvez maintenant exécuter le script SQL généré.")
    else:
        print("\n❌ Génération échouée.")
        print("📝 Veuillez vérifier que le fichier CSV est accessible.")
