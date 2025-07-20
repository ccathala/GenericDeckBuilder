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
RUN npm ci --only=production --silent

# Build frontend avec validation
COPY frontend/ .
RUN npm run build

# Validation du build frontend
RUN test -f dist/index.html || (echo "❌ Frontend build failed: index.html not found" && exit 1)
RUN test -d dist/assets || (echo "❌ Frontend build failed: assets/ not found" && exit 1)
RUN echo "✅ Frontend build validated successfully"

# =============================================================================
# STAGE 2: Build Backend Spring Boot
# =============================================================================
FROM eclipse-temurin:17-jdk-alpine AS backend-build

LABEL stage=backend-build
LABEL description="Build du backend Spring Boot avec Maven"

WORKDIR /app

# Installation Maven
RUN apk add --no-cache maven

# Cache des dépendances Maven (layer séparé)
COPY backend/pom.xml ./backend/
RUN mvn -f backend/pom.xml dependency:resolve dependency:resolve-sources -B -q

# Copie automatique des assets frontend dans backend
COPY --from=frontend-build /app/frontend/dist ./backend/src/main/resources/static/

# Build backend avec assets intégrés
COPY backend/src ./backend/src/
RUN mvn -f backend/pom.xml clean package -DskipTests -B -q \
    -Dmaven.javadoc.skip=true \
    -Dmaven.source.skip=true

# Validation du build backend
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

# Installation utilitaires système minimaux
RUN apk add --no-cache \
    curl \
    tzdata \
    && rm -rf /var/cache/apk/*

# Configuration timezone
ENV TZ=Europe/Paris

# Utilisateur non-root pour sécurité
RUN addgroup -g 1001 -S appuser && \
    adduser -S -D -H -u 1001 -h /app -s /sbin/nologin -G appuser appuser

# Copie de l'application buildée
COPY --from=backend-build --chown=appuser:appuser /app/backend/target/*.jar app.jar

# Configuration JVM optimisée pour containers
ENV JAVA_OPTS="-Xms512m -Xmx1024m \
    -XX:+UseG1GC \
    -XX:+UseContainerSupport \
    -XX:MaxRAMPercentage=80 \
    -XX:+PrintGCDetails \
    -XX:+ExitOnOutOfMemoryError"

# Configuration Spring Boot
ENV SPRING_PROFILES_ACTIVE=prod
ENV SERVER_PORT=8080

EXPOSE 8080

# Health check avec retry intelligent
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8080/api/actuator/health || exit 1

# Switch to non-root user
USER appuser

# Point d'entrée optimisé
CMD ["sh", "-c", "exec java $JAVA_OPTS -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE -jar app.jar"]
