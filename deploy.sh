#!/bin/bash

# Script de déploiement pour GenericDeckBuilder
# Utilisation: ./deploy.sh [environment]

set -e

ENVIRONMENT=${1:-production}
echo "🚀 Déploiement vers l'environnement: $ENVIRONMENT"

# Couleurs pour les logs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Vérifications préalables
log_info "Vérification de l'environnement..."

# Vérifier que nous sommes sur la branche main pour la production
if [ "$ENVIRONMENT" = "production" ]; then
    CURRENT_BRANCH=$(git branch --show-current)
    if [ "$CURRENT_BRANCH" != "main" ]; then
        log_error "Pour déployer en production, vous devez être sur la branche main"
        log_info "Branche actuelle: $CURRENT_BRANCH"
        exit 1
    fi
fi

# Vérifier que le working directory est propre
if [ ! -z "$(git status --porcelain)" ]; then
    log_warning "Des modifications non commitées détectées"
    git status --short
    read -p "Voulez-vous continuer ? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Tests avant déploiement
log_info "Exécution des tests..."

# Tests backend
log_info "Tests backend..."
cd backend
if mvn clean test -q; then
    log_success "Tests backend réussis"
else
    log_error "Échec des tests backend"
    exit 1
fi
cd ..

# Tests frontend (linting + build)
log_info "Tests frontend..."
cd frontend
if npm run lint; then
    log_success "Linting frontend réussi"
else
    log_warning "Problèmes de linting détectés, mais on continue..."
fi

if npm run build; then
    log_success "Build frontend réussi"
else
    log_error "Échec du build frontend"
    exit 1
fi
cd ..

# Test de l'image Docker si en mode production
if [ "$ENVIRONMENT" = "production" ]; then
    log_info "Test de construction de l'image Docker..."
    if docker build -t deckbuilder-test .; then
        log_success "Image Docker construite avec succès"
        docker rmi deckbuilder-test
    else
        log_error "Échec de la construction Docker"
        exit 1
    fi
fi

# Push vers GitHub (déclenchera le CI/CD)
log_info "Push vers GitHub..."
git push origin $(git branch --show-current)

log_success "✨ Déploiement initié avec succès !"

if [ "$ENVIRONMENT" = "production" ]; then
    log_info "🔍 Surveillez le CI/CD sur GitHub Actions"
    log_info "🌐 Une fois déployé, l'application sera disponible sur votre plateforme"
    log_info "📊 Monitoring: /api/actuator/health"
fi
