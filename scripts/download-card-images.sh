#!/bin/bash
# Script de téléchargement et optimisation des images de cartes
# Usage: ./download-card-images.sh

set -e

# Configuration
STATIC_DIR="images/cards"
BASE_URL="https://magenoir.com/cards"
LOG_FILE="image-download.log"

# Couleurs pour les logs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1" | tee -a "$LOG_FILE"
}

# Créer les répertoires
create_directories() {
    log "Création des répertoires..."
    mkdir -p "$STATIC_DIR/fr/vegetal"
    mkdir -p "$STATIC_DIR/fr/feu"
    mkdir -p "$STATIC_DIR/en/vegetal"
    mkdir -p "$STATIC_DIR/en/fire"
}

# Télécharger une image avec retry
download_image() {
    local source_url=$1
    local dest_path=$2
    local max_retries=3
    
    for i in $(seq 1 $max_retries); do
        if curl -L --fail -o "$dest_path" "$source_url" 2>/dev/null; then
            log "✅ Téléchargé: $(basename "$dest_path")"
            return 0
        else
            warn "Tentative $i/$max_retries échouée pour: $source_url"
            sleep 2
        fi
    done
    
    error "❌ Échec téléchargement: $source_url"
    return 1
}

# Optimiser une image (nécessite ImageMagick)
optimize_image() {
    local image_path=$1
    
    if command -v magick >/dev/null 2>&1; then
        # Utiliser ImageMagick moderne (magick convert)
        magick "$image_path" -resize '400>' -quality 85 "$image_path"
        log "🔧 Optimisé: $(basename "$image_path")"
    elif command -v convert >/dev/null 2>&1 && [[ "$(uname)" != "MINGW"* ]]; then
        # Utiliser convert seulement sur Linux/Mac (pas Windows)
        convert "$image_path" -resize '400>' -quality 85 "$image_path"
        log "🔧 Optimisé: $(basename "$image_path")"
    else
        log "⏭️ Optimisation ignorée (ImageMagick non disponible ou Windows)"
    fi
}

# Liste des images à télécharger (basée sur le script SQL)
download_all_images() {
    log "Début du téléchargement des images..."
    
    # Images Végétal FR
    declare -a vegetal_fr=(
        "Graine.png"
        "Graine-germee.png"
        "Arbre-anime.png"
        "Arbre-mort.png"
        "Roi-des-arbres.png"
        "Arbre-en-flammes.png"
        "Foret-enchantee.png"
        "Foret-hostile.png"
        "Semee-prodigieuse.png"
        "Ronces-ephemeres.png"
        "La-guerisseuse-sylvestre.png"
        "Armure-d-ecorce.png"
        "Robe-de-kerloch.png"
        "Cornes-de-druide.png"
        "Anneau-du-druide.png"
        "Rituel-de-decomposition.png"
        "graine_bourgeonnante.png"
        "fleurs_de_ronces.png"
        "fleur_fractale.png"
        "fleur_hypnotique.png"
        "champ_de_tournesol.png"
        "croissance_de_fleurs.png"
        "fleurs_d_arbre.png"
        "fleur_de_kerloc_h.png"
        "petales_tranchants.png"
        "floraison_letale.png"
        "photosynthese.png"
        "infusion_florale.png"
        "renouveau.png"
        "tourment_d_epines.png"
        "distillation_de_seve.png"
        "baguette_de_druide.png"
        "rituel_des_saisons.png"
    )
    
    # Images Feu FR
    declare -a feu_fr=(
        "Flamme.png"
    )
    
    # Images Végétal EN
    declare -a vegetal_en=(
        "Seed.png"
        "Sprouted-seed.png"
        "Animated-tree.png"
        "Dead-tree.png"
        "King_of_trees.png"
        "Tree-in-flames.png"
        "Enchanted-forest.png"
        "Hostile-forest.png"
        "Prodigious-sowing.png"
        "Ephemeral-brambles.png"
        "The-sylvan-healer.png"
        "Bark-armor.png"
        "kerlochs-robe.png"
        "Druid-horns.png"
        "Druid-ring.png"
        "Ritual-of-decomposition.png"
        "budding_seed.png"
        "bramble_flowers.png"
        "fractal_flower.png"
        "hypnotic_flower.png"
        "sunflower_field.png"
        "flower_growth.png"
        "tree_flowers.png"
        "kerloch_s_flower.png"
        "sharp_petals.png"
        "lethal_flourish.png"
        "photosynthesis.png"
        "floral_infusion.png"
        "renewal.png"
        "thorn_torment.png"
        "sap_distillation.png"
        "druid_wand.png"
        "ritual_of_seasons.png"
    )
    
    # Images Feu EN
    declare -a feu_en=(
        "Flame.png"
    )
    
    # Télécharger images Végétal FR
    for image in "${vegetal_fr[@]}"; do
        download_image "$BASE_URL/FR/Vegetal/$image" "$STATIC_DIR/fr/vegetal/$image"
        optimize_image "$STATIC_DIR/fr/vegetal/$image"
    done
    
    # Télécharger images Feu FR
    for image in "${feu_fr[@]}"; do
        download_image "$BASE_URL/FR/Feu/$image" "$STATIC_DIR/fr/feu/$image"
        optimize_image "$STATIC_DIR/fr/feu/$image"
    done
    
    # Télécharger images Végétal EN
    for image in "${vegetal_en[@]}"; do
        download_image "$BASE_URL/EN/vegetal/$image" "$STATIC_DIR/en/vegetal/$image"
        optimize_image "$STATIC_DIR/en/vegetal/$image"
    done
    
    # Télécharger images Feu EN
    for image in "${feu_en[@]}"; do
        download_image "$BASE_URL/EN/fire/$image" "$STATIC_DIR/en/fire/$image"
        optimize_image "$STATIC_DIR/en/fire/$image"
    done
    
    log "Téléchargement terminé!"
}

# Vérifier les prérequis
check_prerequisites() {
    if ! command -v curl >/dev/null 2>&1; then
        error "curl n'est pas installé"
        exit 1
    fi
    
    log "✅ Prérequis vérifiés"
}

# Script principal
main() {
    log "🚀 Démarrage du téléchargement des images"
    
    check_prerequisites
    create_directories
    download_all_images
    
    log "🎉 Téléchargement terminé avec succès!"
    log "📊 Logs sauvegardés dans: $LOG_FILE"
    
    # Statistiques
    total_images=$(find "$STATIC_DIR" -name "*.png" | wc -l)
    log "📈 Total d'images téléchargées: $total_images"
}

# Exécuter le script principal
main "$@"
