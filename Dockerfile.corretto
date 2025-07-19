# Dockerfile optimisé pour Railway avec images cloud-native
# Build frontend
FROM node:18-bullseye AS frontend-build
WORKDIR /app/frontend

# Copie des fichiers package
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ .
RUN npm run build

# Build backend avec Amazon Corretto (optimisé cloud)
FROM amazoncorretto:17 AS backend-build
WORKDIR /app

# Installation de Maven
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
    tar -xzf apache-maven-3.9.6-bin.tar.gz && \
    mv apache-maven-3.9.6 /opt/maven && \
    rm apache-maven-3.9.6-bin.tar.gz && \
    apt-get clean

ENV MAVEN_HOME=/opt/maven
ENV PATH="$MAVEN_HOME/bin:$PATH"

# Build du backend
COPY backend/pom.xml ./backend/
COPY backend/src ./backend/src/
# Copier les assets frontend buildés
COPY --from=frontend-build /app/frontend/dist ./backend/src/main/resources/static/
RUN mvn -f backend/pom.xml clean package -DskipTests -Dmaven.javadoc.skip=true

# Production image - Amazon Corretto JRE (cloud-optimized)
FROM amazoncorretto:17
WORKDIR /app

# Installation des outils de monitoring (Amazon Linux)
RUN yum update -y && yum install -y curl && yum clean all

# Création d'un utilisateur non-root pour la sécurité
RUN groupadd -r appuser && useradd -r -g appuser appuser

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
