#!/usr/bin/env python3
"""
Script de téléchargement des images de cartes Mage Noir
Télécharge les images depuis les URLs et les range dans des répertoires selon l'arborescence
"""

import json
import os
import requests
import time
from urllib.parse import urlparse
from pathlib import Path
import sys

class CardImageDownloader:
    def __init__(self, json_file_path, download_dir="mage-noir-images"):
        self.json_file_path = json_file_path
        self.download_dir = Path(download_dir)
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        })
        
        # Statistiques
        self.downloaded_count = 0
        self.skipped_count = 0
        self.error_count = 0
        
    def load_image_urls(self):
        """Charge les URLs d'images depuis le fichier JSON"""
        print(f"📁 Chargement des URLs depuis: {self.json_file_path}")
        
        try:
            with open(self.json_file_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
            
            # Récupérer toutes les URLs d'images
            all_image_urls = set()
            
            # URLs françaises
            if 'french_image_urls' in data:
                all_image_urls.update(data['french_image_urls'])
                print(f"🇫🇷 {len(data['french_image_urls'])} URLs d'images françaises")
            
            # URLs anglaises
            if 'english_image_urls' in data:
                all_image_urls.update(data['english_image_urls'])
                print(f"🇺🇸 {len(data['english_image_urls'])} URLs d'images anglaises")
            
            print(f"📊 Total d'URLs uniques: {len(all_image_urls)}")
            return list(all_image_urls)
            
        except Exception as e:
            print(f"❌ Erreur lors du chargement du fichier JSON: {e}")
            return []
    
    def extract_path_info(self, image_url):
        """Extrait les informations de chemin depuis l'URL"""
        parsed_url = urlparse(image_url)
        path_parts = parsed_url.path.split('/')
        
        # Le chemin devrait être: /cards/{lang}/{element}/{nom_carte}.png
        if len(path_parts) >= 4:
            language = path_parts[2]  # FR ou EN
            element = path_parts[3]   # Air, Feu, Eau, etc.
            filename = path_parts[-1] # nom du fichier
            
            # Normaliser les noms d'éléments en respectant la casse
            # Français: majuscule (Air, Feu, Eau, Mineral, Vegetal, Arcane)
            # Anglais: minuscule (air, fire, water, mineral, vegetal, arcane)
            if language == 'FR':
                # Garder la majuscule pour le français
                element_mapping = {
                    'air': 'Air',
                    'feu': 'Feu',
                    'eau': 'Eau', 
                    'mineral': 'Mineral',
                    'vegetal': 'Vegetal',
                    'arcane': 'Arcane'
                }
                # Si l'élément est en minuscule dans l'URL, le convertir en majuscule
                normalized_element = element_mapping.get(element.lower(), element)
            else:
                # Anglais: tout en minuscule
                element_mapping = {
                    'Air': 'air',
                    'Feu': 'fire',
                    'Eau': 'water',
                    'Mineral': 'mineral', 
                    'Vegetal': 'vegetal',
                    'Arcane': 'arcane'
                }
                # Si l'élément est en majuscule dans l'URL, le convertir en minuscule
                normalized_element = element_mapping.get(element, element.lower())
            
            return {
                'language': language,
                'element': normalized_element,
                'filename': filename,
                'full_path': f"{language}/{normalized_element}/{filename}"
            }
        
        return None
    
    def create_directory_structure(self, path_info):
        """Crée la structure de répertoires nécessaire"""
        if not path_info:
            return None
        
        # Chemin complet: download_dir/cards/{lang}/{element}/
        target_dir = self.download_dir / "cards" / path_info['language'] / path_info['element']
        target_dir.mkdir(parents=True, exist_ok=True)
        
        return target_dir / path_info['filename']
    
    def download_image(self, image_url, target_path):
        """Télécharge une image"""
        # Vérifier si le fichier existe déjà
        if target_path.exists():
            print(f"⏭️  Image déjà existante: {target_path.name}")
            self.skipped_count += 1
            return True
        
        try:
            print(f"⬇️  Téléchargement: {target_path.name}")
            response = self.session.get(image_url, timeout=30)
            response.raise_for_status()
            
            # Sauvegarder l'image
            with open(target_path, 'wb') as f:
                f.write(response.content)
            
            self.downloaded_count += 1
            return True
            
        except Exception as e:
            print(f"❌ Erreur lors du téléchargement de {image_url}: {e}")
            self.error_count += 1
            return False
    
    def download_all_images(self):
        """Télécharge toutes les images"""
        print("🚀 DÉMARRAGE DU TÉLÉCHARGEMENT DES IMAGES")
        print("=" * 80)
        
        # Charger les URLs
        image_urls = self.load_image_urls()
        if not image_urls:
            print("❌ Aucune URL d'image trouvée")
            return False
        
        total_images = len(image_urls)
        print(f"🎯 Objectif: {total_images} images à télécharger")
        print()
        
        # Créer le répertoire principal
        self.download_dir.mkdir(exist_ok=True)
        
        # Télécharger chaque image
        for i, image_url in enumerate(image_urls, 1):
            print(f"📄 [{i}/{total_images}] Traitement de: {image_url}")
            
            # Extraire les informations de chemin
            path_info = self.extract_path_info(image_url)
            if not path_info:
                print(f"⚠️  Impossible d'analyser l'URL: {image_url}")
                self.error_count += 1
                continue
            
            # Créer la structure de répertoires
            target_path = self.create_directory_structure(path_info)
            if not target_path:
                print(f"⚠️  Impossible de créer le répertoire cible pour: {image_url}")
                self.error_count += 1
                continue
            
            # Télécharger l'image
            success = self.download_image(image_url, target_path)
            
            # Pause pour éviter de surcharger le serveur
            if success and i < total_images:
                time.sleep(0.5)
        
        return True
    
    def generate_summary(self):
        """Génère un résumé du téléchargement"""
        print("\n" + "=" * 80)
        print("📊 RÉSUMÉ DU TÉLÉCHARGEMENT")
        print("=" * 80)
        
        total_processed = self.downloaded_count + self.skipped_count + self.error_count
        
        print(f"📁 Répertoire de destination: {self.download_dir}")
        print(f"📄 Images traitées: {total_processed}")
        print(f"✅ Téléchargées: {self.downloaded_count}")
        print(f"⏭️  Déjà existantes: {self.skipped_count}")
        print(f"❌ Erreurs: {self.error_count}")
        
        # Afficher la structure des répertoires créés
        if self.download_dir.exists():
            print(f"\n📂 Structure des répertoires créée:")
            for root, dirs, files in os.walk(self.download_dir):
                level = root.replace(str(self.download_dir), '').count(os.sep)
                indent = ' ' * 2 * level
                print(f"{indent}📁 {os.path.basename(root)}/")
                sub_indent = ' ' * 2 * (level + 1)
                for file in files[:5]:  # Afficher seulement les 5 premiers fichiers
                    print(f"{sub_indent}📄 {file}")
                if len(files) > 5:
                    print(f"{sub_indent}... et {len(files) - 5} autres fichiers")
        
        return self.error_count == 0

def main():
    # Vérifier que le fichier JSON existe
    json_file = "exact_602_card_urls_and_images_fr_en.json"
    if not os.path.exists(json_file):
        print(f"❌ Fichier JSON non trouvé: {json_file}")
        print("💡 Assurez-vous d'exécuter ce script depuis le dossier 'scraper'")
        return
    
    # Créer le téléchargeur
    downloader = CardImageDownloader(json_file)
    
    try:
        # Lancer le téléchargement
        success = downloader.download_all_images()
        
        if success:
            # Générer le résumé
            final_success = downloader.generate_summary()
            
            if final_success:
                print("\n🎉 Téléchargement terminé avec succès!")
            else:
                print("\n⚠️  Téléchargement terminé avec des erreurs")
        else:
            print("\n❌ Échec du téléchargement")
            
    except KeyboardInterrupt:
        print("\n⏹️  Téléchargement interrompu par l'utilisateur")
    except Exception as e:
        print(f"\n❌ Erreur inattendue: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()
