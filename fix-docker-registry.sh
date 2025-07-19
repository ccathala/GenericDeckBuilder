#!/bin/bash

echo "🔧 Fixing Docker Registry Issues for Railway Deployment"
echo "=============================================="

# Option 1: Use the stable Dockerfile (already updated)
echo "✅ Option 1: Using stable base images (completely removed Alpine dependencies)"
echo "   - Frontend: node:18-slim (instead of node:18-alpine)"
echo "   - Backend build: maven:3.9-openjdk-17 (instead of maven:3.9-openjdk-17-alpine)"
echo "   - Production: eclipse-temurin:17-jre-jammy (instead of eclipse-temurin:17-jre-alpine)"
echo ""

# Option 2: Use Ubuntu-based images
echo "✅ Option 2: If issues persist, use Ubuntu-based Dockerfile"
echo "   To use Ubuntu-based images:"
echo "   mv Dockerfile Dockerfile.alpine"
echo "   mv Dockerfile.ubuntu Dockerfile"
echo ""

# Option 3: Railway-specific solutions
echo "🚀 Option 3: Railway-specific troubleshooting"
echo "   1. Force Railway to rebuild from scratch:"
echo "      railway up --detach"
echo ""
echo "   2. Check Railway build logs:"
echo "      railway logs --deployment"
echo ""
echo "   3. If Docker registry issues persist, Railway may retry automatically"
echo "      Docker Hub sometimes has temporary connectivity issues"
echo ""

# Option 4: Local testing
echo "🧪 Option 4: Test Docker build locally"
echo "   docker build -t genericdeckbuilder ."
echo "   docker run -p 8080:8080 -e SPRING_PROFILES_ACTIVE=prod genericdeckbuilder"
echo ""

echo "💡 Most Docker registry issues are temporary. Railway will likely succeed on retry."
echo "   The updated Dockerfile with node:18-slim should be more stable."
