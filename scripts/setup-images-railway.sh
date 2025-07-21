#!/bin/bash

# Script pour configurer les images en production Railway
echo "🚀 Configuration des images pour Railway"

# Configuration du volume Railway
echo "📁 Configuration du volume Railway pour les images..."

# Création de la structure de dossiers dans le volume Railway
VOLUME_PATH="/app/images"
mkdir -p "$VOLUME_PATH"

# Création de la structure locale/élément
LOCALES=("fr" "en")
ELEMENTS=("fire" "water" "earth" "air" "dark" "light" "neutral")

for locale in "${LOCALES[@]}"; do
    for element in "${ELEMENTS[@]}"; do
        mkdir -p "$VOLUME_PATH/cards/$locale/$element"
        echo "✅ Créé: $VOLUME_PATH/cards/$locale/$element"
    done
done

echo "🎯 Structure créée avec succès!"

# Note: Ce script doit être exécuté dans l'environnement Railway
# Les images doivent être synchronisées via un processus de déploiement
# ou un script de migration depuis votre source d'images actuelle

# Exemple de synchronisation (à adapter selon votre source)
if [ -n "$IMAGE_SOURCE_URL" ]; then
    echo "⬇️ Synchronisation des images depuis la source..."
    # wget ou curl pour télécharger les images nécessaires
    # Exemple: wget -r -np -nH --cut-dirs=2 "$IMAGE_SOURCE_URL/cards/" -P "$VOLUME_PATH/"
fi

echo "🎉 Configuration Railway terminée!"
echo "💡 Les images sont maintenant disponibles via le volume Railway"
echo "🔧 Spring Boot servira automatiquement ces images via /images/"
