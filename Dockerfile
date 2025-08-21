# =============================================================================
# DOCKERFILE MULTI-STAGE OPTIMISÉ - GenericDeckBuilder
# =============================================================================
# 🎯 Automatise complètement le build frontend + backend
# 🚀 Cache optimal avec layers séparés
# 🔒 Sécurité avec utilisateur non-root
# 📦 Image production minimale

# =============================================================================
# STAGE 1: Build Frontend React + Vite
# =============================================================================
FROM node:18-alpine AS frontend-build

LABEL stage=frontend-build
LABEL description="Build du frontend React avec Vite et Tailwind"

WORKDIR /app/frontend

# Cache des dépendances npm (layer séparé)
COPY frontend/package*.json ./
RUN npm ci --silent

# Build frontend avec validation
COPY frontend/ .
RUN npm run build

# Validation du build frontend
RUN test -f dist/index.html || (echo "❌ Frontend build failed: index.html not found" && exit 1)

# Validation flexible des assets (debug + vérification JS/CSS)
RUN echo "🔍 Debug: Build structure:" && ls -la dist/ && echo ""
RUN test "$(find dist/ -name "*.js" -o -name "*.css" | wc -l)" -gt 0 || (echo "❌ Frontend build failed: no JS/CSS assets found" && exit 1)

RUN echo "✅ Frontend build validated successfully"

# =============================================================================
# STAGE 2: Build Backend Spring Boot
# =============================================================================
FROM maven:3.9-eclipse-temurin-17-alpine AS backend-build

LABEL stage=backend-build
LABEL description="Build du backend Spring Boot avec Maven"

WORKDIR /app

# Cache des dépendances Maven (layer séparé)
COPY backend/pom.xml ./backend/
WORKDIR /app/backend
RUN mvn dependency:resolve dependency:resolve-sources -B -q

WORKDIR /app
# Copie automatique des assets frontend dans backend
COPY --from=frontend-build /app/frontend/dist ./backend/src/main/resources/static/

# Copie des icônes de mana directement dans le dossier static
COPY frontend/src/assets/*.png ./backend/src/main/resources/static/

# Vérification que les assets sont bien copiés
RUN test -f backend/src/main/resources/static/index.html || (echo "❌ Assets copy failed: index.html not found" && exit 1)
RUN ls -l backend/src/main/resources/static/*.png

# Build backend avec assets intégrés (mode production)
COPY backend/src ./backend/src/
WORKDIR /app/backend
RUN mvn clean package -DskipTests -B -q \
    -Dmaven.javadoc.skip=true \
    -Dmaven.source.skip=true \
    -Dspring.profiles.active=prod

# Validation du build backend
WORKDIR /app
RUN test -f backend/target/*.jar || (echo "❌ Backend build failed: JAR not found" && exit 1)
RUN echo "✅ Backend build validated successfully"

# =============================================================================
# STAGE 3: Runtime Production (Image Finale)
# =============================================================================
FROM eclipse-temurin:17-jre-alpine AS production

LABEL maintainer="GenericDeckBuilder Team"
LABEL description="GenericDeckBuilder - Full-Stack Application"
LABEL version="1.0"

WORKDIR /app

# Installation utilitaires production minimaux
RUN apk add --no-cache \
    curl \
    ca-certificates \
    tzdata \
    dumb-init \
    && rm -rf /var/cache/apk/* \
    && addgroup -g 1001 -S appuser \
    && adduser -S -D -H -u 1001 -h /app -s /sbin/nologin -G appuser appuser

# Configuration timezone et locale
ENV TZ=Europe/Paris
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Copie de l'application buildée
COPY --from=backend-build --chown=appuser:appuser /app/backend/target/*.jar app.jar

# Création du répertoire pour le volume d'images (sera monté depuis Railway)
RUN mkdir -p /app/images && chown -R appuser:appuser /app/images

# Configuration JVM optimisée pour production
ENV JAVA_OPTS="-server \
    -Xms512m -Xmx1024m \
    -XX:+UseG1GC \
    -XX:+UseContainerSupport \
    -XX:MaxRAMPercentage=75 \
    -XX:+DisableExplicitGC \
    -XX:+UseStringDeduplication \
    -XX:+OptimizeStringConcat \
    -Djava.security.egd=file:/dev/./urandom \
    -Dspring.backgroundpreinitializer.ignore=true"

# Configuration Spring Boot
ENV SPRING_PROFILES_ACTIVE=prod
ENV SERVER_PORT=8080

EXPOSE 8080

# Health check production-ready avec diagnostic
HEALTHCHECK --interval=30s --timeout=10s --start-period=90s --retries=3 \
    CMD curl -f -s http://localhost:$SERVER_PORT/api/actuator/health | grep -q '"status":"UP"' || exit 1

# Switch to non-root user
USER appuser

# Point d'entrée production avec signal handling
ENTRYPOINT ["dumb-init", "--"]
CMD ["sh", "-c", "exec java $JAVA_OPTS -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE -jar app.jar"]
