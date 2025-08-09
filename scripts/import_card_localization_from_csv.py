#!/usr/bin/env python3
"""
Script pour importer les card_localization depuis un fichier CSV d'export
vers la base de données GenericDeckBuilder.

Usage:
    python import_card_localization_from_csv.py <fichier_csv>
    
Exemple:
    python import_card_localization_from_csv.py card_localization_202508062027_export_card_localization.csv
"""

import csv
import sys
import os
from datetime import datetime

def escape_sql_string(value):
    """Échappe les chaînes pour SQL en remplaçant les apostrophes."""
    if value is None:
        return 'NULL'
    return "'" + str(value).replace("'", "''") + "'"

def generate_insert_sql_from_csv(csv_file_path, output_file_path=None):
    """
    Génère un script SQL INSERT à partir d'un fichier CSV d'export card_localization.
    
    Args:
        csv_file_path (str): Chemin vers le fichier CSV
        output_file_path (str): Chemin de sortie pour le fichier SQL (optionnel)
    
    Returns:
        str: Script SQL généré
    """
    
    if not os.path.exists(csv_file_path):
        raise FileNotFoundError(f"Le fichier CSV '{csv_file_path}' n'existe pas.")
    
    # Nom du fichier de sortie par défaut
    if output_file_path is None:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        output_file_path = f"insert_card_localization_{timestamp}.sql"
    
    sql_statements = []
    processed_count = 0
    
    # Header SQL
    sql_statements.append("-- Script d'insertion des card_localization généré automatiquement")
    sql_statements.append(f"-- Généré le: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    sql_statements.append(f"-- Source: {os.path.basename(csv_file_path)}")
    sql_statements.append("")
    sql_statements.append("-- Désactiver les contraintes de clés étrangères temporairement")
    sql_statements.append("SET session_replication_role = replica;")
    sql_statements.append("")
    sql_statements.append("BEGIN;")
    sql_statements.append("")
    
    try:
        with open(csv_file_path, 'r', encoding='utf-8') as csvfile:
            # Détecter le délimiteur
            sample = csvfile.read(1024)
            csvfile.seek(0)
            
            # Essayer de détecter automatiquement le délimiteur
            sniffer = csv.Sniffer()
            delimiter = sniffer.sniff(sample).delimiter
            
            reader = csv.DictReader(csvfile, delimiter=delimiter)
            
            # Vérifier les colonnes attendues
            expected_columns = {'card_id', 'description', 'image_url', 'locale', 'name', 'card_url'}
            actual_columns = set(reader.fieldnames)
            
            if not expected_columns.issubset(actual_columns):
                missing_columns = expected_columns - actual_columns
                raise ValueError(f"Colonnes manquantes dans le CSV: {missing_columns}")
            
            print(f"📋 Colonnes détectées: {list(reader.fieldnames)}")
            print(f"🔍 Délimiteur détecté: '{delimiter}'")
            print("🚀 Génération des instructions SQL INSERT...")
            
            for row in reader:
                # Extraire et nettoyer les valeurs
                card_id = row['card_id'].strip()
                description = row['description'].strip()
                image_url = row['image_url'].strip()
                locale = row['locale'].strip()
                name = row['name'].strip()
                card_url = row['card_url'].strip() if row['card_url'] else None
                
                # Valider les données essentielles
                if not card_id or not locale or not name:
                    print(f"⚠️  Ligne ignorée (données manquantes): card_id='{card_id}', locale='{locale}', name='{name}'")
                    continue
                
                # Générer l'instruction INSERT
                sql = f"""INSERT INTO card_localization (card_id, description, image_url, locale, name, card_url) 
VALUES ({escape_sql_string(card_id)}, {escape_sql_string(description)}, {escape_sql_string(image_url)}, {escape_sql_string(locale)}, {escape_sql_string(name)}, {escape_sql_string(card_url)})
ON CONFLICT (card_id, locale) 
DO UPDATE SET 
    description = EXCLUDED.description,
    image_url = EXCLUDED.image_url,
    name = EXCLUDED.name,
    card_url = EXCLUDED.card_url;"""
                
                sql_statements.append(sql)
                processed_count += 1
                
                if processed_count % 50 == 0:
                    print(f"📝 {processed_count} entrées traitées...")
    
    except Exception as e:
        print(f"❌ Erreur lors de la lecture du fichier CSV: {e}")
        return None
    
    # Footer SQL
    sql_statements.append("")
    sql_statements.append("COMMIT;")
    sql_statements.append("")
    sql_statements.append("-- Réactiver les contraintes de clés étrangères")
    sql_statements.append("SET session_replication_role = DEFAULT;")
    sql_statements.append("")
    sql_statements.append(f"-- Script terminé. {processed_count} entrées traitées.")
    
    # Joindre toutes les instructions
    full_sql_script = "\n".join(sql_statements)
    
    # Écrire le fichier SQL
    try:
        with open(output_file_path, 'w', encoding='utf-8') as sqlfile:
            sqlfile.write(full_sql_script)
        
        print(f"✅ Script SQL généré avec succès: {output_file_path}")
        print(f"📊 Total des entrées traitées: {processed_count}")
        print(f"📁 Taille du fichier SQL: {os.path.getsize(output_file_path)} bytes")
        
    except Exception as e:
        print(f"❌ Erreur lors de l'écriture du fichier SQL: {e}")
        return None
    
    return full_sql_script

def print_statistics(csv_file_path):
    """Affiche des statistiques sur le fichier CSV."""
    
    try:
        with open(csv_file_path, 'r', encoding='utf-8') as csvfile:
            sample = csvfile.read(1024)
            csvfile.seek(0)
            
            sniffer = csv.Sniffer()
            delimiter = sniffer.sniff(sample).delimiter
            
            reader = csv.DictReader(csvfile, delimiter=delimiter)
            
            # Compter les entrées par locale
            locales = {}
            card_ids = set()
            total_rows = 0
            rows_with_card_url = 0
            
            for row in reader:
                total_rows += 1
                locale = row['locale'].strip()
                card_id = row['card_id'].strip()
                card_url = row['card_url'].strip() if row['card_url'] else None
                
                locales[locale] = locales.get(locale, 0) + 1
                card_ids.add(card_id)
                
                if card_url:
                    rows_with_card_url += 1
            
            print("\n📊 STATISTIQUES DU FICHIER CSV:")
            print(f"   📝 Total des lignes: {total_rows}")
            print(f"   🃏 Cartes uniques: {len(card_ids)}")
            print(f"   🔗 Entrées avec cardUrl: {rows_with_card_url}")
            print(f"   🌐 Locales trouvées:")
            for locale, count in sorted(locales.items()):
                print(f"      • {locale}: {count} entrées")
                
    except Exception as e:
        print(f"❌ Erreur lors de l'analyse des statistiques: {e}")

def main():
    """Fonction principale."""
    
    if len(sys.argv) < 2:
        print("❌ Usage: python import_card_localization_from_csv.py <fichier_csv> [fichier_sql_sortie]")
        print("📝 Exemple: python import_card_localization_from_csv.py card_localization_export.csv")
        sys.exit(1)
    
    csv_file_path = sys.argv[1]
    output_file_path = sys.argv[2] if len(sys.argv) > 2 else None
    
    print("🎯 Import Card Localization depuis CSV")
    print("=" * 50)
    
    # Afficher les statistiques du fichier
    print_statistics(csv_file_path)
    print()
    
    # Générer le script SQL
    sql_script = generate_insert_sql_from_csv(csv_file_path, output_file_path)
    
    if sql_script:
        print("\n🎉 Import terminé avec succès !")
        print("\n📋 Prochaines étapes:")
        print("   1. Vérifiez le fichier SQL généré")
        print("   2. Exécutez-le sur votre base de données:")
        if output_file_path:
            print(f"      psql -d your_database -f {output_file_path}")
        print("   3. Vérifiez que les données ont été correctement importées")
    else:
        print("\n❌ Échec de la génération du script SQL")
        sys.exit(1)

if __name__ == "__main__":
    main()
