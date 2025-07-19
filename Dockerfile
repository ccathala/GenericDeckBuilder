# DOCKERFILE SIMPLIFIÉ pour Railway - Installation rapide
# Build frontend avec Node.js via snap (ultra-rapide)
FROM ubuntu:22.04 AS frontend-build
WORKDIR /app/frontend

# Installation simple et rapide de Node.js
RUN apt-get update
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN apt-get clean

# Build frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ .
RUN npm run build

# Build backend avec OpenJDK Ubuntu (pas de téléchargement externe)
FROM ubuntu:22.04 AS backend-build
WORKDIR /app

# Installation Java et Maven depuis les repos Ubuntu (ultra-rapide)
RUN apt-get update
RUN apt-get install -y openjdk-17-jdk maven
RUN apt-get clean

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Build backend
COPY backend/pom.xml ./backend/
COPY backend/src ./backend/src/
COPY --from=frontend-build /app/frontend/dist ./backend/src/main/resources/static/
RUN mvn -f backend/pom.xml clean package -DskipTests -Dmaven.javadoc.skip=true

# Production runtime simplifié
FROM ubuntu:22.04
WORKDIR /app

# Installation JRE depuis Ubuntu repos (ultra-rapide)
RUN apt-get update
RUN apt-get install -y openjdk-17-jre-headless curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Utilisateur non-root
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Application
COPY --from=backend-build --chown=appuser:appuser /app/backend/target/*.jar app.jar

# Configuration
ENV SPRING_PROFILES_ACTIVE=prod
ENV JAVA_OPTS="-Xms512m -Xmx1024m -XX:+UseG1GC -XX:+UseContainerSupport"

EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8080/api/actuator/health || exit 1

USER appuser

CMD ["sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=prod -jar app.jar"]
