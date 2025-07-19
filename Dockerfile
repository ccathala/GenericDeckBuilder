# Dockerfile multi-stage pour GenericDeckBuilder
# Build frontend
FROM node:18-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm ci --only=production
COPY frontend/ .
RUN npm run build

# Build backend
FROM maven:3.9-openjdk-17-alpine AS backend-build
WORKDIR /app
COPY backend/pom.xml ./backend/
COPY backend/src ./backend/src/
# Copier les assets frontend buildés dans les ressources statiques
COPY --from=frontend-build /app/frontend/dist ./backend/src/main/resources/static/
RUN mvn -f backend/pom.xml clean package -DskipTests -Dmaven.javadoc.skip=true

# Production image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Installation des outils de monitoring
RUN apk add --no-cache curl

# Création d'un utilisateur non-root pour la sécurité
RUN addgroup -g 1001 -S appuser && \
    adduser -S -u 1001 -G appuser appuser

# Copie de l'application
COPY --from=backend-build --chown=appuser:appuser /app/backend/target/*.jar app.jar

# Configuration des variables d'environnement
ENV SPRING_PROFILES_ACTIVE=prod
ENV JAVA_OPTS="-Xms512m -Xmx1024m -XX:+UseG1GC -XX:+UseContainerSupport"

# Exposition du port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8080/api/actuator/health || exit 1

# Changement vers l'utilisateur non-root
USER appuser

# Commande de démarrage
CMD ["sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=prod -jar app.jar"]
