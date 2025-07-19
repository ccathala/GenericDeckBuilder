#!/bin/bash

# Script de vérification post-déploiement Railway
# Usage: ./verify-deployment.sh https://your-app.railway.app

if [ $# -eq 0 ]; then
    echo "❌ Usage: ./verify-deployment.sh https://your-app.railway.app"
    exit 1
fi

URL=$1
API_URL="$URL/api"

echo "🔍 Vérification du déploiement Railway..."
echo "📍 URL: $URL"
echo "🔌 API: $API_URL"
echo ""

# Fonction de test avec gestion d'erreur
test_endpoint() {
    local endpoint=$1
    local description=$2
    local expected_status=${3:-200}
    
    echo -n "🧪 Test $description... "
    
    response=$(curl -s -w "\n%{http_code}" "$endpoint" 2>/dev/null)
    status_code=$(echo "$response" | tail -n1)
    body=$(echo "$response" | sed '$d')
    
    if [ "$status_code" -eq "$expected_status" ]; then
        echo "✅ OK ($status_code)"
        if [ ! -z "$body" ] && [ "$body" != "null" ]; then
            echo "   📄 Response: $body" | head -c 100
            echo ""
        fi
    else
        echo "❌ FAILED ($status_code)"
        echo "   📄 Response: $body"
    fi
    echo ""
}

# Tests des endpoints
echo "🚀 Tests des endpoints..."
echo "=========================="

# Test 1: Health Check (plus critique)
test_endpoint "$API_URL/actuator/health" "Health Check" 200

# Test 2: Info endpoint  
test_endpoint "$API_URL/actuator/info" "Application Info" 200

# Test 3: Frontend (page d'accueil)
test_endpoint "$URL/" "Frontend React" 200

# Test 4: API Metrics (monitoring)
test_endpoint "$API_URL/actuator/metrics" "Metrics Endpoint" 200

# Test 5: API Cards endpoint (fonctionnel)
test_endpoint "$API_URL/cards" "Cards API" 200

echo "🎯 Tests spécifiques GenericDeckBuilder..."
echo "========================================="

# Test 6: Game endpoint
test_endpoint "$API_URL/games" "Games API" 200

# Test 7: Public cards
test_endpoint "$API_URL/public/cards/mage_noir" "Public Cards" 200

echo "📊 Résumé des tests..."
echo "====================="

# Test de performance basique
echo -n "⚡ Test de performance... "
start_time=$(date +%s%N)
curl -s "$API_URL/actuator/health" > /dev/null
end_time=$(date +%s%N)
duration=$(( (end_time - start_time) / 1000000 ))
echo "✅ Temps de réponse: ${duration}ms"

echo ""
echo "🎉 Vérification terminée !"
echo ""
echo "📋 Actions recommandées :"
echo "- 📊 Surveiller les logs Railway"
echo "- 💰 Vérifier l'usage du crédit ($5/mois)"
echo "- 🔄 Tester toutes les fonctionnalités manuellement"
echo "- 📱 Tester sur différents appareils/navigateurs"
echo ""
echo "🌐 URLs utiles :"
echo "- Frontend: $URL/"
echo "- API Health: $API_URL/actuator/health"
echo "- API Docs: $API_URL/swagger-ui.html (si configuré)"
