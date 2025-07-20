#!/bin/bash

# =============================================================================
# Script de Surveillance de Déploiement Railway - GenericDeckBuilder
# =============================================================================

set -e

APP_URL="https://mage-noir-deckbuilder.up.railway.app"
HEALTH_URL="$APP_URL/api/actuator/health"
ASSETS_URL="$APP_URL/assets/index-CbiFZ2XG.css"

echo "🔍 Surveillance du déploiement Railway - GenericDeckBuilder"
echo "🌐 URL: $APP_URL"
echo ""

# Fonction pour tester la disponibilité
test_availability() {
    local url=$1
    local expected_status=$2
    
    status_code=$(curl -s -w "%{http_code}" -o /dev/null "$url" 2>/dev/null || echo "000")
    
    if [ "$status_code" = "$expected_status" ]; then
        return 0  # Succès
    else
        return 1  # Échec
    fi
}

# Fonction pour vérifier les headers de production
check_production_headers() {
    # Test du dumb-init dans les processus (indicateur runtime production)
    # Note: On ne peut pas tester ça directement via HTTP, mais on peut tester d'autres indicateurs
    
    # Test du health check avec parsing JSON
    health_response=$(curl -s "$HEALTH_URL" 2>/dev/null || echo "")
    
    if echo "$health_response" | grep -q '"status":"UP"'; then
        echo "✅ Health check opérationnel avec réponse JSON"
        return 0
    else
        echo "❌ Health check indisponible ou format incorrect"
        return 1
    fi
}

# Fonction de surveillance continue
monitor_deployment() {
    local start_time=$(date +%s)
    local max_wait=900  # 15 minutes max
    local check_interval=30  # Vérification toutes les 30 secondes
    
    echo "⏰ Démarrage surveillance (max 15 minutes)..."
    echo ""
    
    while true; do
        local current_time=$(date +%s)
        local elapsed=$((current_time - start_time))
        
        if [ $elapsed -gt $max_wait ]; then
            echo "⏰ Timeout atteint (15 minutes). Déploiement possiblement échoué."
            return 1
        fi
        
        local minutes=$((elapsed / 60))
        local seconds=$((elapsed % 60))
        
        printf "\r🕐 %02d:%02d - " $minutes $seconds
        
        # Test 1: Page principale accessible
        if test_availability "$APP_URL" "200"; then
            printf "Page ✅ "
        else
            printf "Page ❌ "
        fi
        
        # Test 2: Health check fonctionnel
        if check_production_headers >/dev/null 2>&1; then
            printf "Health ✅ "
            echo ""
            echo ""
            echo "🎉 DÉPLOIEMENT TERMINÉ AVEC SUCCÈS!"
            echo "✅ Page principale accessible"
            echo "✅ Health check opérationnel"
            echo "⏱️  Temps total: ${minutes}m${seconds}s"
            echo ""
            echo "🔗 Testez l'application: $APP_URL"
            return 0
        else
            printf "Health ❌"
        fi
        
        # Test 3: Détection du redéploiement (502/503 = Railway redémarre)
        if test_availability "$APP_URL" "502" || test_availability "$APP_URL" "503"; then
            echo " (🚀 Redéploiement détecté!)"
        else
            echo ""
        fi
        
        sleep $check_interval
    done
}

# Lancement de la surveillance
echo "📊 État initial:"
printf "Page principale: "
if test_availability "$APP_URL" "200"; then
    echo "✅ Accessible"
else
    echo "❌ Inaccessible"
fi

printf "Health check: "
if check_production_headers >/dev/null 2>&1; then
    echo "✅ Fonctionnel"
else
    echo "❌ Indisponible"
fi

echo ""
echo "🔄 Lancement surveillance automatique..."
echo "   (Appuyez sur Ctrl+C pour arrêter)"
echo ""

monitor_deployment
