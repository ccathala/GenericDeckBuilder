#!/usr/bin/env python3
"""
Script de découverte EXACTE des URLs de cartes ET images Mage Noir (FR + EN)
Récupère les 205 cartes en français ET en anglais + leurs images
"""

import requests
from bs4 import BeautifulSoup
import time
import json
import re
from urllib.parse import urljoin
from collections import defaultdict

class ExactCardURLDiscoverer:
    def __init__(self):
        self.base_url = "https://magenoir.com"
        self.collection_fr_url = f"{self.base_url}/collection_fr.html"
        self.collection_en_url = f"{self.base_url}/collection.html"
        self.target_count_per_language = 301  # Mise à jour: 301 cartes par langue
        self.target_count_total = 602  # 301 FR + 301 EN
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        })
    
    def get_page_content(self, url):
        """Récupère le contenu d'une page avec gestion d'erreurs"""
        try:
            print(f"📡 Récupération de {url}")
            response = self.session.get(url, timeout=10)
            response.raise_for_status()
            return response.text
        except Exception as e:
            print(f"❌ Erreur lors de la récupération de {url}: {e}")
            return None
    
    def extract_image_from_card_page(self, card_url):
        """Extrait l'URL de l'image depuis une page de carte individuelle"""
        content = self.get_page_content(card_url)
        if not content:
            return None
        
        soup = BeautifulSoup(content, 'html.parser')
        
        # Recherche de l'image de la carte dans la page
        # Pattern pour les images: cards/{language}/{element}/{cardname}.png
        image_pattern = re.compile(r'^cards/(FR|EN)/[^/]+/[^/]+\.png$')
        
        for img in soup.find_all('img', src=True):
            src = img['src']
            if image_pattern.match(src):
                full_image_url = urljoin(self.base_url, src)
                print(f"    🖼️ Image trouvée pour {card_url}: {full_image_url}")
                return full_image_url
        
        # Si l'image n'est pas trouvée avec le pattern standard, chercher d'autres patterns
        for img in soup.find_all('img', src=True):
            src = img['src']
            if 'cards' in src and (src.endswith('.png') or src.endswith('.jpg')):
                full_image_url = urljoin(self.base_url, src)
                print(f"    🖼️ Image alternative trouvée pour {card_url}: {full_image_url}")
                return full_image_url
        
        print(f"    ⚠️ Aucune image trouvée pour {card_url}")
        return None
    
    def extract_images_from_card_urls(self, card_urls, language_code):
        """Extrait les URLs d'images pour une liste d'URLs de cartes"""
        image_urls = set()
        total_cards = len(card_urls)
        
        print(f"🔍 Extraction des images pour {total_cards} cartes {language_code}...")
        
        for i, card_url in enumerate(card_urls, 1):
            print(f"  📄 [{i}/{total_cards}] Traitement de: {card_url}")
            image_url = self.extract_image_from_card_page(card_url)
            if image_url:
                image_urls.add(image_url)
            # Pause pour éviter de surcharger le serveur
            time.sleep(0.5)
        
        return image_urls
    
    def extract_exact_card_urls(self):
        """Extrait exactement les URLs de cartes ET images FR et EN"""
        print("🔍 Extraction des URLs de cartes ET images FR et EN...")
        
        all_card_urls = set()
        all_image_urls = set()
        
        # Récupération des cartes françaises
        print("\n📍 Récupération des cartes FRANÇAISES...")
        fr_card_urls = self.extract_cards_from_language("FR", self.collection_fr_url)
        print(f"  ✅ {len(fr_card_urls)} cartes françaises trouvées")
        
        # Extraction des images françaises depuis les pages de cartes
        print("🔍 Extraction des images françaises depuis les pages de cartes...")
        fr_image_urls = self.extract_images_from_card_urls(fr_card_urls, "FR")
        print(f"  🖼️ {len(fr_image_urls)} images françaises trouvées")
        
        # Récupération des cartes anglaises
        print("\n📍 Récupération des cartes ANGLAISES...")
        en_card_urls = self.extract_cards_from_language("EN", self.collection_en_url)
        print(f"  ✅ {len(en_card_urls)} cartes anglaises trouvées")
        
        # Extraction des images anglaises depuis les pages de cartes
        print("🔍 Extraction des images anglaises depuis les pages de cartes...")
        en_image_urls = self.extract_images_from_card_urls(en_card_urls, "EN")
        print(f"  🖼️ {len(en_image_urls)} images anglaises trouvées")
        
        all_card_urls.update(fr_card_urls)
        all_card_urls.update(en_card_urls)
        all_image_urls.update(fr_image_urls)
        all_image_urls.update(en_image_urls)
        
        return all_card_urls, all_image_urls, fr_card_urls, en_card_urls, fr_image_urls, en_image_urls
    
    def extract_cards_from_language(self, language_code, collection_url):
        """Extrait les URLs de cartes pour une langue donnée"""
        content = self.get_page_content(collection_url)
        if not content:
            return set()
        
        soup = BeautifulSoup(content, 'html.parser')
        urls = set()
        
        # Pattern strict pour les cartes: collection/{language_code}/{element}/{cardname}.html
        card_pattern = re.compile(f'^collection/{language_code}/[^/]+/[^/]+\\.html$')
        
        for link in soup.find_all('a', href=True):
            href = link['href']
            
            # Filtrer uniquement les vraies cartes
            if card_pattern.match(href):
                full_url = urljoin(self.base_url, href)
                urls.add(full_url)
                print(f"    ✅ Carte {language_code} trouvée: {full_url}")
        
        return urls
    
    def extract_cards_and_images_from_language(self, language_code, collection_url):
        """Extrait les URLs de cartes ET images pour une langue donnée"""
        content = self.get_page_content(collection_url)
        if not content:
            return set(), set()
        
        soup = BeautifulSoup(content, 'html.parser')
        card_urls = set()
        image_urls = set()
        
        # Pattern strict pour les cartes: collection/{language_code}/{element}/{cardname}.html
        card_pattern = re.compile(f'^collection/{language_code}/[^/]+/[^/]+\\.html$')
        
        # Pattern strict pour les images: cards/{language_code}/{element}/{cardname}.png
        image_pattern = re.compile(f'^cards/{language_code}/[^/]+/[^/]+\\.png$')
        
        # Recherche des liens vers les cartes
        for link in soup.find_all('a', href=True):
            href = link['href']
            
            # Filtrer uniquement les vraies cartes
            if card_pattern.match(href):
                full_url = urljoin(self.base_url, href)
                card_urls.add(full_url)
                print(f"    ✅ Carte {language_code} trouvée: {full_url}")
        
        # Recherche des images
        for img in soup.find_all('img', src=True):
            src = img['src']
            
            # Filtrer uniquement les vraies images de cartes
            if image_pattern.match(src):
                full_url = urljoin(self.base_url, src)
                image_urls.add(full_url)
                print(f"    🖼️ Image {language_code} trouvée: {full_url}")
        
        return card_urls, image_urls
    
    def analyze_urls_by_element(self, all_card_urls, all_image_urls, fr_card_urls, en_card_urls, fr_image_urls, en_image_urls):
        """Analyse la répartition des URLs par élément et par langue"""
        print("\n📊 ANALYSE PAR ÉLÉMENT ET LANGUE:")
        
        # Analyse des cartes françaises
        print("\n🇫🇷 CARTES FRANÇAISES:")
        fr_elements = defaultdict(list)
        for url in fr_card_urls:
            parts = url.split('/')
            if len(parts) >= 6 and parts[4] == 'FR':
                element = parts[5]
                fr_elements[element].append(url)
        
        fr_total = 0
        for element, card_urls in sorted(fr_elements.items()):
            count = len(card_urls)
            fr_total += count
            print(f"  🔸 {element.upper()}: {count} cartes")
        print(f"  📊 TOTAL FR CARTES: {fr_total}")
        
        # Analyse des images françaises
        print("\n🇫🇷 IMAGES FRANÇAISES:")
        fr_image_elements = defaultdict(list)
        for url in fr_image_urls:
            parts = url.split('/')
            if len(parts) >= 6 and parts[4] == 'FR':
                element = parts[5]
                fr_image_elements[element].append(url)
        
        fr_image_total = 0
        for element, image_urls in sorted(fr_image_elements.items()):
            count = len(image_urls)
            fr_image_total += count
            print(f"  🖼️ {element.upper()}: {count} images")
        print(f"  📊 TOTAL FR IMAGES: {fr_image_total}")
        
        # Analyse des cartes anglaises
        print("\n🇺🇸 CARTES ANGLAISES:")
        en_elements = defaultdict(list)
        for url in en_card_urls:
            parts = url.split('/')
            if len(parts) >= 6 and parts[4] == 'EN':
                element = parts[5]
                en_elements[element].append(url)
        
        en_total = 0
        for element, card_urls in sorted(en_elements.items()):
            count = len(card_urls)
            en_total += count
            print(f"  🔸 {element.upper()}: {count} cartes")
        print(f"  📊 TOTAL EN CARTES: {en_total}")
        
        # Analyse des images anglaises
        print("\n🇺🇸 IMAGES ANGLAISES:")
        en_image_elements = defaultdict(list)
        for url in en_image_urls:
            parts = url.split('/')
            if len(parts) >= 6 and parts[4] == 'EN':
                element = parts[5]
                en_image_elements[element].append(url)
        
        en_image_total = 0
        for element, image_urls in sorted(en_image_elements.items()):
            count = len(image_urls)
            en_image_total += count
            print(f"  🖼️ {element.upper()}: {count} images")
        print(f"  📊 TOTAL EN IMAGES: {en_image_total}")
        
        print(f"\n📊 RÉSUMÉ GÉNÉRAL:")
        print(f"  🔗 Cartes totales: {len(all_card_urls)} ({fr_total} FR + {en_total} EN)")
        print(f"  🖼️ Images totales: {len(all_image_urls)} ({fr_image_total} FR + {en_image_total} EN)")
        
        return fr_elements, en_elements, fr_image_elements, en_image_elements
    
    def save_urls_to_files(self, all_card_urls, all_image_urls, fr_card_urls, en_card_urls, fr_image_urls, en_image_urls):
        """Sauvegarde les URLs dans des fichiers de sortie"""
        print(f"\n💾 SAUVEGARDE DES URLs DÉCOUVERTES:")
        
        all_card_urls_list = sorted(list(all_card_urls))
        all_image_urls_list = sorted(list(all_image_urls))
        fr_card_urls_list = sorted(list(fr_card_urls))
        en_card_urls_list = sorted(list(en_card_urls))
        fr_image_urls_list = sorted(list(fr_image_urls))
        en_image_urls_list = sorted(list(en_image_urls))
        
        # Sauvegarder toutes les URLs en format texte
        txt_filepath = 'exact_602_card_urls_and_images_fr_en.txt'
        with open(txt_filepath, 'w', encoding='utf-8') as f:
            f.write(f"# URLs exactes des cartes ET images Mage Noir (FR + EN)\n")
            f.write(f"# Cartes totales: {len(all_card_urls_list)}\n")
            f.write(f"# Images totales: {len(all_image_urls_list)}\n")
            f.write(f"# Cartes françaises: {len(fr_card_urls_list)}\n")
            f.write(f"# Cartes anglaises: {len(en_card_urls_list)}\n")
            f.write(f"# Images françaises: {len(fr_image_urls_list)}\n")
            f.write(f"# Images anglaises: {len(en_image_urls_list)}\n")
            f.write(f"# Objectif cartes: {self.target_count_total} ({self.target_count_per_language} par langue)\n")
            f.write(f"# Généré le: {time.strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            
            f.write("# === CARTES FRANÇAISES ===\n")
            for url in fr_card_urls_list:
                f.write(f"{url}\n")
            
            f.write("\n# === CARTES ANGLAISES ===\n")
            for url in en_card_urls_list:
                f.write(f"{url}\n")
            
            f.write("\n# === IMAGES FRANÇAISES ===\n")
            for url in fr_image_urls_list:
                f.write(f"{url}\n")
                
            f.write("\n# === IMAGES ANGLAISES ===\n")
            for url in en_image_urls_list:
                f.write(f"{url}\n")
        
        print(f"💾 URLs sauvegardées dans: {txt_filepath}")
        
        # Sauvegarder aussi en JSON
        json_filepath = 'exact_602_card_urls_and_images_fr_en.json'
        with open(json_filepath, 'w', encoding='utf-8') as f:
            json.dump({
                'cards_total_count': len(all_card_urls_list),
                'images_total_count': len(all_image_urls_list),
                'french_cards_count': len(fr_card_urls_list),
                'english_cards_count': len(en_card_urls_list),
                'french_images_count': len(fr_image_urls_list),
                'english_images_count': len(en_image_urls_list),
                'target_count_total': self.target_count_total,
                'target_count_per_language': self.target_count_per_language,
                'discovery_date': time.strftime('%Y-%m-%d %H:%M:%S'),
                'method': 'exact_card_and_image_filter_bilingual',
                'french_card_urls': fr_card_urls_list,
                'english_card_urls': en_card_urls_list,
                'french_image_urls': fr_image_urls_list,
                'english_image_urls': en_image_urls_list,
                'all_card_urls': all_card_urls_list,
                'all_image_urls': all_image_urls_list
            }, f, indent=2)
        
        print(f"💾 URLs sauvegardées en JSON: {json_filepath}")
        
        # Afficher quelques exemples
        print(f"\n📋 Exemples d'URLs de cartes françaises:")
        for i, url in enumerate(fr_card_urls_list[:3], 1):
            print(f"  {i}. {url}")
        
        print(f"\n📋 Exemples d'URLs de cartes anglaises:")
        for i, url in enumerate(en_card_urls_list[:3], 1):
            print(f"  {i}. {url}")
            
        print(f"\n🖼️ Exemples d'URLs d'images françaises:")
        for i, url in enumerate(fr_image_urls_list[:3], 1):
            print(f"  {i}. {url}")
        
        print(f"\n🖼️ Exemples d'URLs d'images anglaises:")
        for i, url in enumerate(en_image_urls_list[:3], 1):
            print(f"  {i}. {url}")
        
        total_urls = len(all_card_urls_list) + len(all_image_urls_list)
        if total_urls > 12:
            print(f"\n... et {total_urls - 12} autres URLs au total")
    
    def discover_exact_card_urls(self):
        """Méthode principale de découverte des URLs de cartes ET images FR et EN"""
        print("🚀 DÉCOUVERTE EXACTE DES URLs DE CARTES ET IMAGES MAGE NOIR (FR + EN)")
        print("🎯 Objectif: 301 cartes françaises + 301 cartes anglaises = 602 URLs")
        print("🎯 + Images correspondantes selon pattern cards/{language}/{element}/{cardname}.png")
        print("=" * 80)
        
        # Étape 1: Extraire les URLs de cartes et images pour les deux langues
        all_card_urls, all_image_urls, fr_card_urls, en_card_urls, fr_image_urls, en_image_urls = self.extract_exact_card_urls()
        print(f"\n📊 {len(all_card_urls)} URLs de cartes découvertes au total")
        print(f"  🇫🇷 {len(fr_card_urls)} cartes françaises")
        print(f"  🇺🇸 {len(en_card_urls)} cartes anglaises")
        print(f"\n🖼️ {len(all_image_urls)} URLs d'images découvertes au total")
        print(f"  🇫🇷 {len(fr_image_urls)} images françaises")
        print(f"  🇺🇸 {len(en_image_urls)} images anglaises")
        
        if len(all_card_urls) == 0:
            print("❌ Aucune URL de carte trouvée. Arrêt du script.")
            return set(), set(), set(), set(), set(), set()
        
        # Étape 2: Analyse par élément et langue
        self.analyze_urls_by_element(all_card_urls, all_image_urls, fr_card_urls, en_card_urls, fr_image_urls, en_image_urls)
        
        # Étape 3: Vérification des objectifs
        print(f"\n📊 RÉSUMÉ DE LA DÉCOUVERTE:")
        print(f"  🔗 URLs de cartes trouvées: {len(all_card_urls)}")
        print(f"  🇫🇷 Cartes françaises: {len(fr_card_urls)} (objectif: {self.target_count_per_language})")
        print(f"  🇺🇸 Cartes anglaises: {len(en_card_urls)} (objectif: {self.target_count_per_language})")
        print(f"  🖼️ URLs d'images trouvées: {len(all_image_urls)}")
        print(f"  🇫🇷 Images françaises: {len(fr_image_urls)}")
        print(f"  🇺🇸 Images anglaises: {len(en_image_urls)}")
        print(f"  🎯 Objectif cartes: {self.target_count_total}")
        
        # Vérification des résultats pour les cartes
        fr_success = len(fr_card_urls) == self.target_count_per_language
        en_success = len(en_card_urls) == self.target_count_per_language
        total_success = len(all_card_urls) == self.target_count_total
        
        if fr_success and en_success and total_success:
            print("🎉 OBJECTIF CARTES EXACTEMENT ATTEINT POUR TOUTES LES LANGUES!")
        else:
            if not fr_success:
                diff_fr = len(fr_card_urls) - self.target_count_per_language
                status_fr = "DÉPASSEMENT" if diff_fr > 0 else "MANQUE"
                print(f"⚠️  CARTES FRANÇAISES {status_fr}: {abs(diff_fr)} URLs")
            
            if not en_success:
                diff_en = len(en_card_urls) - self.target_count_per_language
                status_en = "DÉPASSEMENT" if diff_en > 0 else "MANQUE"
                print(f"⚠️  CARTES ANGLAISES {status_en}: {abs(diff_en)} URLs")
        
        # Statut des images
        if len(all_image_urls) > 0:
            print(f"✅ {len(all_image_urls)} images découvertes avec succès!")
        else:
            print("⚠️ Aucune image trouvée (peut-être que les images ne sont pas présentes sur les pages de collection)")
        
        return all_card_urls, all_image_urls, fr_card_urls, en_card_urls, fr_image_urls, en_image_urls

def main():
    discoverer = ExactCardURLDiscoverer()
    
    try:
        all_card_urls, all_image_urls, fr_card_urls, en_card_urls, fr_image_urls, en_image_urls = discoverer.discover_exact_card_urls()
        if all_card_urls:
            discoverer.save_urls_to_files(all_card_urls, all_image_urls, fr_card_urls, en_card_urls, fr_image_urls, en_image_urls)
        
    except KeyboardInterrupt:
        print("\n⏹️  Arrêt demandé par l'utilisateur")
    except Exception as e:
        print(f"\n❌ Erreur inattendue: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()
