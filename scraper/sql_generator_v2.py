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
        
        # NOUVEAU : Tracker des images déjà utilisées pour éviter les doublons
        self.used_images = set()
        
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
            
            # Extraire les composants requis (FR/EN) avec parsing HTML amélioré
            card_data['component_costs'] = self.extract_component_costs_improved(text_content, soup)
            
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
    
    def extract_component_costs_improved(self, text_content, soup=None):
        """Version améliorée de l'extraction des coûts de composants avec parsing HTML"""
        
        component_costs = []
        
        # Si on a accès au soup HTML, utiliser le parsing HTML d'abord
        if soup:
            try:
                # Chercher la row des composants requis
                component_rows = soup.find_all('td', class_='row-title')
                for row in component_rows:
                    if 'Composants requis' in row.get_text() or 'Required components' in row.get_text():
                        # Trouver la cellule suivante avec la liste
                        next_td = row.find_next_sibling('td')
                        if next_td:
                            # Extraire tous les <li>
                            li_elements = next_td.find_all('li')
                            for li in li_elements:
                                li_text = li.get_text().strip()
                                # Parser le texte: "1 Glace" -> quantity=1, componentName="Glace"
                                match = re.match(r'(\d+)\s+(.+)', li_text)
                                if match:
                                    quantity = int(match.group(1))
                                    component_name = match.group(2).strip()
                                    component_costs.append({
                                        'componentName': component_name,
                                        'quantity': quantity
                                    })
                                    print(f"    HTML - Composant trouvé: {component_name} (quantité: {quantity})")
                            
                            if component_costs:
                                return component_costs
            except Exception as e:
                print(f"    Erreur parsing HTML composants: {e}")
        
        # Fallback: méthode textuelle existante
        component_match = re.search(r'(Composants requis|Composants nécessaires|Required components)\s*:\s*(\d+)\s+([^\n\r]+)', text_content)
        
        if component_match:
            component_count = int(component_match.group(2))
            component_text = component_match.group(3).strip()
            
            print(f"    DEBUG - Texte composant brut: '{component_text}'")
            
            # Extraire tous les mots qui ressemblent à des composants
            component_words = re.findall(r'([A-Za-zÀ-ÿ]+)', component_text)
            
            # Dictionnaire des composants connus (ajout d'infiltration)
            known_components = {
                'etincelle', 'étincelle', 'cristal', 'essence', 'minerai', 'flamme', 
                'souffle', 'vent', 'vague', 'goutte', 'roche', 'glace', 'soleil', 
                'temps', 'inspiration', 'lumiere', 'lumière', 'foudre', 'sable', 
                'desert', 'désert', 'graine', 'mur', 'lame', 'armure', 'infiltration'
            }
            
            # Chercher le premier composant connu
            for word in component_words:
                word_lower = word.lower()
                if word_lower in known_components:
                    component_name = word.capitalize()
                    print(f"    DEBUG - Composant trouvé: '{component_name}'")
                    component_costs.append({
                        'componentName': component_name,
                        'quantity': component_count
                    })
                    break  # Prendre seulement le premier composant trouvé
            
            # Si aucun composant connu trouvé, prendre le premier mot
            if not component_costs and component_words:
                component_name = component_words[0].capitalize()
                # Nettoyer les chiffres
                component_name = re.sub(r'\d+', '', component_name)
                if component_name:
                    print(f"    DEBUG - Composant par défaut: '{component_name}'")
                    component_costs.append({
                        'componentName': component_name,
                        'quantity': component_count
                    })
        
        return component_costs

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
        """Nettoie le nom de la carte pour l'affichage EN CONSERVANT les accents, apostrophes ET tirets appropriés"""
        # Remplacer les underscores par des espaces
        name = card_name_raw.replace('_', ' ')
        
        # Gérer les tirets de façon intelligente
        # Garder les tirets dans les noms composés (ex: "yuki-onna" → "Yuki-Onna")
        # Mais remplacer les tirets multiples ou isolés par des espaces
        name = re.sub(r'-{2,}', ' ', name)  # Remplacer les tirets multiples par un espace
        name = re.sub(r'\s+-\s+', ' ', name)  # Remplacer les tirets entourés d'espaces par un espace
        
        # Nettoyer les espaces multiples
        name = re.sub(r'\s+', ' ', name).strip()
        
        # Capitaliser proprement SANS supprimer les accents/apostrophes
        # et en gardant les tirets pour les noms composés
        words = []
        for word in name.split():
            if '-' in word:
                # Pour les mots avec tirets, capitaliser chaque partie
                parts = word.split('-')
                capitalized_parts = [part.capitalize() for part in parts if part]
                words.append('-'.join(capitalized_parts))
            else:
                words.append(word.capitalize())
        
        return ' '.join(words)

    def extract_card_name_from_webpage(self, url):
        """Extrait le vrai nom de la carte depuis la page web avec accents et apostrophes"""
        try:
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
            }
            
            response = requests.get(url, headers=headers, timeout=10)
            response.raise_for_status()
            response.encoding = 'utf-8'
            
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Chercher le titre de la carte (plusieurs patterns possibles)
            title_patterns = [
                soup.find('h1'),  # Titre principal
                soup.find('title'),  # Balise title
                soup.find('h2'),  # Titre secondaire
            ]
            
            for title_element in title_patterns:
                if title_element:
                    title_text = title_element.get_text().strip()
                    # Nettoyer le titre en supprimant seulement les suffixes indésirables
                    # mais en gardant les tirets dans les noms de cartes
                    title_text = re.sub(r'\s*[-–—]\s*(Mage Noir|Black Mage|Card|Carte).*$', '', title_text, flags=re.IGNORECASE)
                    title_text = re.sub(r'\s*\|\s*.*$', '', title_text)  # Supprimer après |
                    title_text = title_text.strip()
                    if title_text and len(title_text) > 2:
                        return title_text
            
            # Fallback: utiliser le nom depuis l'URL
            return None
            
        except Exception as e:
            print(f"    Erreur extraction nom: {e}")
            return None

    def extract_card_description_from_webpage(self, url):
        """Extrait la description complète depuis la page web"""
        try:
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
            }
            
            response = requests.get(url, headers=headers, timeout=10)
            response.raise_for_status()
            response.encoding = 'utf-8'
            
            soup = BeautifulSoup(response.text, 'html.parser')
            text_content = soup.get_text()
            
            # Patterns de recherche pour la description/effets
            patterns = [
                r'(Effets|Effects|Effect)\s*:\s*(.*?)(?=Illustration|Artwork|Texte d\'ambiance|Flavor text|Extension|Notes|$)',
                r'(Description)\s*:\s*(.*?)(?=Illustration|Artwork|Texte d\'ambiance|Flavor text|Extension|Notes|$)',
                r'(Texte)\s*:\s*(.*?)(?=Illustration|Artwork|Texte d\'ambiance|Flavor text|Extension|Notes|$)'
            ]
            
            for pattern in patterns:
                match = re.search(pattern, text_content, re.DOTALL | re.IGNORECASE)
                if match:
                    description = match.group(2).strip()
                    # Nettoyer le texte
                    description = re.sub(r'\s+', ' ', description)
                    description = re.sub(r'(Notes|Notes)\s*:.*$', '', description).strip()
                    description = re.sub(r'(Illustration|Artwork)\s*:.*$', '', description).strip()
                    
                    if description and len(description) > 10:
                        return description
            
            # Fallback: chercher dans des balises spécifiques
            description_selectors = [
                'div.card-description',
                'div.description', 
                'p.effect',
                'div#description',
                '.card-text',
                '.effect-text'
            ]
            
            for selector in description_selectors:
                element = soup.select_one(selector)
                if element:
                    description = element.get_text().strip()
                    if description and len(description) > 10:
                        return description
            
            return None
            
        except Exception as e:
            print(f"    Erreur extraction description: {e}")
            return None

    def normalize_image_url(self, image_url):
        """Remplace le préfixe des URLs d'images par le CDN GitHub"""
        if image_url and image_url.startswith('https://magenoir.com'):
            # Remplacer le domaine par le CDN GitHub
            return image_url.replace('https://magenoir.com', 'https://cdn.jsdelivr.net/gh/ccathala/mndb-images@main')
        return image_url

    def validate_card_data(self, card_data):
        """Valide la cohérence des données extraites"""
        issues = []
        
        # Vérifier descriptions non vides
        for locale in ['fr', 'en']:
            if locale in card_data['localizations']:
                desc = card_data['localizations'][locale].get('description', '')
                if not desc or len(desc) < 10:
                    issues.append(f"Description {locale} trop courte ou vide")
                elif "Déphase 0" in desc:
                    issues.append(f"Description {locale} contient 'Déphase 0' suspect")
                elif desc.count('.') == 0 and len(desc) > 20:
                    issues.append(f"Description {locale} sans ponctuation")
        
        # Vérifier correspondance des noms
        if 'fr' in card_data['localizations'] and 'en' in card_data['localizations']:
            fr_name = card_data['localizations']['fr'].get('name', '')
            en_name = card_data['localizations']['en'].get('name', '')
            if not fr_name or not en_name:
                issues.append("Nom manquant dans une localisation")
            elif fr_name == en_name and len(fr_name) > 5:
                issues.append("Noms FR/EN identiques (suspect)")
        
        return issues
    

    def levenshtein_distance(self, s1, s2):
        """Calcule la distance de Levenshtein entre deux chaînes"""
        if len(s1) < len(s2):
            return self.levenshtein_distance(s2, s1)
        
        if len(s2) == 0:
            return len(s1)
        
        previous_row = list(range(len(s2) + 1))
        for i, c1 in enumerate(s1):
            current_row = [i + 1]
            for j, c2 in enumerate(s2):
                insertions = previous_row[j + 1] + 1
                deletions = current_row[j] + 1
                substitutions = previous_row[j] + (c1 != c2)
                current_row.append(min(insertions, deletions, substitutions))
            previous_row = current_row
        
        return previous_row[-1]

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
        """Trouve l'URL de l'image correspondante avec vérification d'unicité et matching strict"""
        element_raw = card_info['element_raw']
        card_name_raw = card_info['card_name_raw']
        lang_code = card_info['language_code']
        
        # NOUVEAU : Conversion des éléments pour le matching d'images
        element_for_image_matching = element_raw.lower()
        if lang_code == 'FR':
            # Convertir les éléments anglais vers français pour les images françaises
            element_mapping = {
                'fire': 'feu',
                'water': 'eau', 
                'air': 'air',
                'mineral': 'mineral',
                'vegetal': 'vegetal',
                'arcane': 'arcane'
            }
            element_for_image_matching = element_mapping.get(element_raw.lower(), element_raw.lower())
        elif lang_code == 'EN':
            # Pour les images anglaises, garder les noms anglais
            element_for_image_matching = element_raw.lower()
        
        def normalize_for_matching_only(name):
            """Normalise un nom UNIQUEMENT pour le matching d'images - pas pour l'affichage"""
            name = name.lower()
            
            # Supprimer les apostrophes et caractères spéciaux
            name = re.sub(r"['\"`]", '', name)
            
            # Normaliser TOUS les caractères accentués
            accents_map = {
                'é': 'e', 'è': 'e', 'ê': 'e', 'ë': 'e',
                'à': 'a', 'â': 'a', 'ä': 'a', 'á': 'a',
                'ù': 'u', 'û': 'u', 'ü': 'u', 'ú': 'u',
                'ï': 'i', 'î': 'i', 'í': 'i',
                'ô': 'o', 'ö': 'o', 'ó': 'o',
                'ç': 'c', 'ÿ': 'y',
                'æ': 'ae', 'œ': 'oe'
            }
            
            for accented, plain in accents_map.items():
                name = name.replace(accented, plain)
            
            # Remplacer les espaces et caractères spéciaux par tirets
            name = re.sub(r'[\s_]+', '-', name)
            
            # Supprimer les caractères non alphanumériques sauf tirets
            name = re.sub(r'[^a-z0-9\-]', '', name)
            
            # Nettoyer les tirets multiples
            name = re.sub(r'-+', '-', name).strip('-')
            
            return name

        def is_high_quality_match(variant, url_name_normalized):
            """Vérifie si le match est de haute qualité (exact ou très proche)"""
            
            # 1. Match exact (priorité absolue)
            if variant == url_name_normalized:
                return True, "EXACT"
            
            # 2. Match avec différence mineure (1-2 caractères max)
            if len(variant) >= 5 and len(url_name_normalized) >= 5:
                distance = self.levenshtein_distance(variant, url_name_normalized)
                if distance <= 2:  # BEAUCOUP PLUS STRICT
                    return True, "MINOR_DIFF"
            
            # 3. Match par inclusion TRÈS strict (longueur minimale et ratio strict)
            if variant and url_name_normalized:
                if len(variant) >= 8 and len(url_name_normalized) >= 8:  # LONGUEUR MINIMALE
                    if variant in url_name_normalized or url_name_normalized in variant:
                        ratio = max(len(variant), len(url_name_normalized)) / min(len(variant), len(url_name_normalized))
                        if ratio <= 1.2:  # BEAUCOUP PLUS STRICT (était 1.8)
                            return True, "INCLUSION_STRICT"
            
            # 4. Cas spéciaux pour les 4 cartes restantes
            special_mappings = {
                'epee-materialisee': ['epee', 'materiel', 'sword', 'materialized'],
                'rock': ['rock', 'roche', 'stone'],
                'flash-of-inspiration': ['flash', 'inspiration', 'eclat', 'brilliant'],
                'eruption-de-magma': ['eruption', 'magma', 'volcanic']
            }
            
            # Vérifier si la carte fait partie des cas spéciaux
            for special_card, keywords in special_mappings.items():
                if any(keyword in variant for keyword in keywords) and any(keyword in url_name_normalized for keyword in keywords):
                    matching_keywords = [k for k in keywords if k in variant or k in url_name_normalized]
                    if len(matching_keywords) >= 1:
                        return True, "SPECIAL_CASE"
            
            return False, "NO_MATCH"
        
        # Normaliser le nom de la carte
        normalized_card_name = normalize_for_matching_only(card_name_raw)
        
        # Créer des variants RESTREINTS (moins de variants pour éviter les faux positifs)
        card_name_variants = [
            normalized_card_name,
            normalized_card_name.replace('-', '_'),
            normalized_card_name.replace('_', '-'),
            card_name_raw.lower(),
            card_name_raw.lower().replace('_', '-'),
            card_name_raw.lower().replace('-', '_'),
        ]
        
        # Cas spéciaux SEULEMENT pour les vraies correspondances connues
        special_cases = {
            'connaissance': 'connaisance',
            'guerisseuse': 'gueriseuse', 
            'brinicle': 'brinicle',
            'maelstrom': 'maelstrom',
            'goutte-d-eau': 'goutte-d-eau',
            'anneau-d-azur': 'anneau-d-azur',
            
            # NOUVEAUX cas spéciaux pour les 4 cartes restantes
            'epee-materialisee': 'epee-materiel',
            'materialisee': 'materiel',
            'eruption-de-magma': 'eruption-magma',
            'flash-of-inspiration': 'flash-inspiration',
            'inspiration': 'brilliant-inspiration',
        }
        
        # Appliquer les cas spéciaux
        for original, replacement in special_cases.items():
            if original in normalized_card_name:
                variant_special = normalized_card_name.replace(original, replacement)
                card_name_variants.append(variant_special)
        
        # Debug pour cartes problématiques
        problematic_cards = [
            'flamme', 'haute', 'fleche', 'catalyseur', 'brulure', 'boule', 'aube', 
            'anneau', 'fouet', 'vague', 'ignition', 'tsunami', 'source', 'lame', 
            'souffle', 'lumiere', 'robe', 'rituel', 'masque', 'ocean', 'minerai', 
            'mur', 'meteore', 'pluie', 'maree', 'maelstrom', 'projectile', 'lances', 
            'guerisseuse', 'rayon', 'infiltration', 'hiver', 'grandes', 'gouttelette', 
            'goutte', 'flocon', 'soleil', 'ere', 'engloutissement', 'echarde', 
            'vents', 'condensation', 'epee', 'brinicle', 'arbre', 'explosion', 
            'eruption', 'eblouissement', 'fission', 'rock', 'flash', 'inspiration'
        ]
        
        debug_mode = any(card in card_name_raw.lower() for card in problematic_cards)
        
        if debug_mode:
            print(f"    DEBUG - Carte: {card_name_raw}")
            print(f"    DEBUG - Élément: {element_raw} -> {element_for_image_matching}")
            print(f"    DEBUG - Normalized: {normalized_card_name}")
            print(f"    DEBUG - Variants: {card_name_variants}")
        
        # Chercher une correspondance avec vérification d'unicité
        best_match = None
        best_match_type = None
        
        for image_url in image_urls:
            # NOUVEAU : Vérifier si l'image n'est pas déjà utilisée
            if image_url in self.used_images:
                continue
                
            if (lang_code in image_url and 
                element_for_image_matching in image_url.lower()):
                
                url_name = image_url.split('/')[-1].replace('.png', '').replace('.jpg', '')
                url_name_normalized = normalize_for_matching_only(url_name)
                
                if debug_mode:
                    print(f"    DEBUG - Test image: {url_name} -> {url_name_normalized}")
                
                # Tester uniquement les matches de haute qualité
                for variant in card_name_variants:
                    if not variant:
                        continue
                        
                    is_match, match_type = is_high_quality_match(variant, url_name_normalized)
                    
                    if is_match:
                        if debug_mode:
                            print(f"    DEBUG - {match_type}: {variant} <-> {url_name_normalized}")
                        
                        # Prioriser les matches exacts
                        if match_type == "EXACT":
                            best_match = image_url
                            best_match_type = match_type
                            break
                        elif match_type == "MINOR_DIFF" and best_match_type != "EXACT":
                            best_match = image_url
                            best_match_type = match_type
                        elif match_type == "INCLUSION_STRICT" and best_match_type not in ["EXACT", "MINOR_DIFF"]:
                            best_match = image_url
                            best_match_type = match_type
                
                if best_match_type == "EXACT":
                    break  # Arrêter si match exact trouvé
        
        # NOUVEAU : Mode de fallback pour les 4 cartes restantes problématiques
        if not best_match and debug_mode:
            print(f"    DEBUG - Recherche élargie pour carte problématique: {card_name_raw}")
            
            # Recherche élargie avec critères assouplis
            for image_url in image_urls:
                if image_url in self.used_images:
                    continue
                    
                if (lang_code in image_url and element_for_image_matching in image_url.lower()):
                    url_name = image_url.split('/')[-1].replace('.png', '').replace('.jpg', '')
                    url_name_normalized = normalize_for_matching_only(url_name)
                    
                    if debug_mode:
                        print(f"    DEBUG - Test fallback: {url_name} -> {url_name_normalized}")
                    
                    # Critères assouplis pour les cartes problématiques
                    for variant in card_name_variants:
                        if not variant:
                            continue
                        
                        # Match par mots-clés pour les cas difficiles
                        variant_words = set(variant.split('-'))
                        url_words = set(url_name_normalized.split('-'))
                        
                        # Supprimer les mots trop courts pour éviter les faux positifs
                        variant_words = {w for w in variant_words if len(w) >= 3}
                        url_words = {w for w in url_words if len(w) >= 3}
                        
                        common_words = variant_words & url_words
                        
                        # Au moins 1 mot commun ET longueur similaire
                        if (len(common_words) >= 1 and 
                            len(variant_words) <= 3 and
                            abs(len(variant) - len(url_name_normalized)) <= 5):
                            
                            best_match = image_url
                            best_match_type = "FALLBACK_KEYWORD"
                            if debug_mode:
                                print(f"    DEBUG - FALLBACK_KEYWORD: {variant} <-> {url_name_normalized} (mots communs: {common_words})")
                            break
                    
                    if best_match:
                        break
        
        # NOUVEAU : Marquer l'image comme utilisée
        if best_match:
            self.used_images.add(best_match)
            if debug_mode:
                print(f"    DEBUG - Image assignée: {best_match}")
        else:
            if debug_mode:
                print(f"    DEBUG - Aucune image trouvée pour: {card_name_raw}")
        
        return best_match
    
    def process_urls_data(self, urls_data):
        """Traite toutes les URLs et génère les données des cartes avec correspondance FR/EN"""
        
        # NOUVEAU : Réinitialiser le tracker d'images
        self.used_images.clear()
        
        french_cards = []
        english_cards = []
        
        # Extraire les informations des cartes françaises
        for fr_url in urls_data['french_card_urls']:
            card_info = self.extract_card_info_from_url(fr_url)
            if card_info:
                # NOUVEAU : Extraire le vrai nom depuis la page web
                real_name = self.extract_card_name_from_webpage(fr_url)
                if real_name:
                    card_info['card_name_display'] = real_name
                    print(f"  Nom réel extrait (FR): {real_name}")
                
                # NOUVEAU : Extraire la description complète
                real_description = self.extract_card_description_from_webpage(fr_url)
                if real_description:
                    card_info['real_description'] = real_description
                    print(f"  Description extraite (FR): {real_description[:50]}...")
                
                french_cards.append(card_info)
        
        # Extraire les informations des cartes anglaises
        for en_url in urls_data['english_card_urls']:
            card_info = self.extract_card_info_from_url(en_url)
            if card_info:
                # NOUVEAU : Extraire le vrai nom depuis la page web
                real_name = self.extract_card_name_from_webpage(en_url)
                if real_name:
                    card_info['card_name_display'] = real_name
                    print(f"  Nom réel extrait (EN): {real_name}")
                
                # NOUVEAU : Extraire la description complète
                real_description = self.extract_card_description_from_webpage(en_url)
                if real_description:
                    card_info['real_description'] = real_description
                    print(f"  Description extraite (EN): {real_description[:50]}...")
                
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
                    'name': fr_card.get('card_name_display', fr_card['card_name_display']),
                    'image_url': self.normalize_image_url(fr_image) if fr_image else '',
                    'card_url': fr_card['url'],
                    'description': fr_card.get('real_description', '')  # Utiliser la vraie description
                }
                
                # Extraire toutes les données depuis la page française
                print(f"  Extraction donnees: {fr_card.get('card_name_display', fr_card['card_name_display'])}")
                card_info = self.extract_mana_cost_from_webpage(fr_card['url'])
                card_data['total_cost'] = card_info['total_cost']
                card_data['mana_costs'] = card_info['mana_costs']
                card_data['component_costs'] = card_info['component_costs']
                card_data['type'] = card_info['type']
                card_data['extension'] = card_info['extension']
                card_data['artwork'] = card_info['artwork']
                
                # Utiliser la description extraite plutôt que celle de extract_mana_cost_from_webpage
                if not card_data['localizations']['fr']['description']:
                    card_data['localizations']['fr']['description'] = card_info.get('description', 'Description à compléter')
                
                # Petite pause pour éviter de surcharger le serveur
                time.sleep(0.5)
                
                # Traiter SEULEMENT les cartes avec correspondance manuelle
                if en_match:
                    en_image = self.find_matching_image_url(en_match, urls_data['english_image_urls'])
                    card_data['localizations']['en'] = {
                        'name': en_match.get('card_name_display', en_match['card_name_display']),
                        'image_url': self.normalize_image_url(en_image) if en_image else '',
                        'card_url': en_match['url'],
                        'description': en_match.get('real_description', '')  # Utiliser la vraie description
                    }
                    
                    # Toujours extraire les données depuis la page anglaise pour la localisation
                    print(f"  Extraction donnees (EN): {en_match.get('card_name_display', en_match['card_name_display'])}")
                    en_card_info = self.extract_mana_cost_from_webpage(en_match['url'])
                    
                    # Utiliser la description extraite plutôt que celle de extract_mana_cost_from_webpage
                    if not card_data['localizations']['en']['description']:
                        card_data['localizations']['en']['description'] = en_card_info.get('description', 'Description to complete')
                    
                    # Retirer la carte anglaise de la liste des cartes disponibles
                    remaining_en_cards.remove(en_match)
                    
                    # Petite pause pour éviter de surcharger le serveur
                    time.sleep(0.5)
                    
                    # Ajouter la carte SEULEMENT si correspondance manuelle trouvée
                    matched_cards.append(card_data)
                    card_counter += 1
                    
                    # NOUVEAU : Validation des données de la carte
                    issues = self.validate_card_data(card_data)
                    if issues:
                        print(f"    ⚠️  Problèmes détectés: {', '.join(issues)}")
                else:
                    print(f"    IGNORE - Aucune correspondance manuelle trouvee pour: {fr_card.get('card_name_display', fr_card['card_name_display'])}")
                    # Ne pas ajouter la carte sans correspondance manuelle
        
        return matched_cards
    
    def validate_image_uniqueness(self, cards_data):
        """Valide que chaque image n'est utilisée qu'une seule fois"""
        image_usage = {}
        duplicates = []
        
        for card in cards_data:
            for locale in ['fr', 'en']:
                if locale in card['localizations']:
                    image_url = card['localizations'][locale].get('image_url', '')
                    if image_url:
                        if image_url in image_usage:
                            duplicates.append({
                                'image': image_url,
                                'cards': [image_usage[image_url], card['card_id']]
                            })
                        else:
                            image_usage[image_url] = card['card_id']
        
        if duplicates:
            print(f"⚠️  ATTENTION: {len(duplicates)} images dupliquées détectées:")
            for dup in duplicates:
                print(f"   {dup['image']} utilisée par: {', '.join(dup['cards'])}")
        else:
            print("✅ Validation réussie - Toutes les images sont uniques")
        
        return len(duplicates) == 0
    
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
            sql_lines.append("--" + ("=" * 120))
            sql_lines.append(f"-- {element}")
            sql_lines.append("--" + ("=" * 120))
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
        sql_lines.append("--" + ("=" * 120))
        sql_lines.append(f"-- {display_name}")
        sql_lines.append("--" + ("=" * 120))
        
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
            
            # Validation et nettoyage de la description française
            if not fr_description or fr_description.strip() == '':
                fr_description = 'Description à compléter'
            elif len(fr_description) < 10:
                fr_description = 'Description à compléter'
            elif "Déphase 0" in fr_description:
                print(f"    ⚠️  Description FR suspecte pour {card_id}: contient 'Déphase 0'")
            
            # Échapper les apostrophes pour PostgreSQL
            fr_description_escaped = fr_description.replace("'", "''")
            fr_name_escaped = fr_name.replace("'", "''")
            localizations.append(f"('{card_id}', E'{fr_description_escaped}', '{fr_image}', 'fr', '{fr_name_escaped}')")
        else:
            # Si pas de français, utiliser un placeholder
            localizations.append(f"('{card_id}', E'Description à compléter', '', 'fr', '{display_name}')")
        
        # Localisation anglaise (obligatoire)
        if 'en' in card['localizations']:
            en_loc = card['localizations']['en']
            en_name = en_loc.get('name', card_id)
            en_image = en_loc.get('image_url', '')
            en_description = en_loc.get('description', 'Description to complete')
            
            # Validation et nettoyage de la description anglaise
            if not en_description or en_description.strip() == '':
                en_description = 'Description to complete'
            elif len(en_description) < 10:
                en_description = 'Description to complete'
            elif "Déphase 0" in en_description:
                print(f"    ⚠️  Description EN suspecte pour {card_id}: contient 'Déphase 0'")
            
            # Vérifier si le nom anglais n'est pas identique au nom français
            if 'fr' in card['localizations']:
                fr_name = card['localizations']['fr'].get('name', '')
                if en_name == fr_name and len(en_name) > 5:
                    print(f"    ⚠️  Noms FR/EN identiques pour {card_id}: {en_name}")
            
            # Échapper les apostrophes pour PostgreSQL
            en_description_escaped = en_description.replace("'", "''")
            en_name_escaped = en_name.replace("'", "''")
            localizations.append(f"('{card_id}', E'{en_description_escaped}', '{en_image}', 'en', '{en_name_escaped}')")
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
    
    # NOUVEAU : Valider l'unicité des images
    print("\nValidation de l'unicite des images...")
    is_valid = generator.validate_image_uniqueness(cards_data)
    if not is_valid:
        print("❌ Validation échouée - Images dupliquées détectées")
        print("ℹ️  Le script continuera malgré les doublons")
    else:
        print("✅ Validation réussie - Toutes les images sont uniques")
    
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
