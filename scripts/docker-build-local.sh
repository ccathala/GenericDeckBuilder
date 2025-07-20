#!/bin/bash

# =============================================================================
# Script de build local avec Docker multi-stage
# =============================================================================

set -e

echo "🚀 Starting GenericDeckBuilder Docker build..."
echo ""

# Configuration
IMAGE_NAME="genericdeckbuilder"
TAG="latest"
FULL_NAME="$IMAGE_NAME:$TAG"

# Build avec cache optimisé
echo "📦 Building Docker image: $FULL_NAME"
docker build \
    --tag $FULL_NAME \
    --build-arg BUILDKIT_INLINE_CACHE=1 \
    --progress=plain \
    .

echo ""
echo "✅ Build completed successfully!"
echo ""
echo "🔍 Image details:"
docker images $IMAGE_NAME:$TAG

echo ""
echo "🚀 To run locally:"
echo "   docker run -p 8080:8080 -e SPRING_PROFILES_ACTIVE=dev $FULL_NAME"
echo ""
echo "🔗 To test:"
echo "   curl http://localhost:8080/api/actuator/health"
