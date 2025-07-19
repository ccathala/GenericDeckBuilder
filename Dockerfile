# DOCKERFILE ULTRA-STABLE pour Railway
# Utilise uniquement Ubuntu LTS (jamais de problème de registre)

# Build frontend
FROM ubuntu:22.04 AS frontend-build
WORKDIR /app/frontend

# Installation Node.js depuis NodeSource (pas de Docker registry)
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Build frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ .
RUN npm run build

# Build backend
FROM ubuntu:22.04 AS backend-build
WORKDIR /app

# Installation Java et Maven depuis les sources officielles
RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    wget -O- https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - && \
    echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-17-jdk && \
    wget https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
    tar -xzf apache-maven-3.9.6-bin.tar.gz && \
    mv apache-maven-3.9.6 /opt/maven && \
    rm apache-maven-3.9.6-bin.tar.gz && \
    apt-get clean

ENV JAVA_HOME=/usr/lib/jvm/temurin-17-jdk-amd64
ENV MAVEN_HOME=/opt/maven
ENV PATH="$MAVEN_HOME/bin:$JAVA_HOME/bin:$PATH"

# Build backend
COPY backend/pom.xml ./backend/
COPY backend/src ./backend/src/
COPY --from=frontend-build /app/frontend/dist ./backend/src/main/resources/static/
RUN mvn -f backend/pom.xml clean package -DskipTests -Dmaven.javadoc.skip=true

# Production runtime
FROM ubuntu:22.04
WORKDIR /app

# Installation JRE uniquement
RUN apt-get update && \
    apt-get install -y wget ca-certificates curl && \
    wget -O- https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - && \
    echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-17-jre && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/temurin-17-jre-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

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
