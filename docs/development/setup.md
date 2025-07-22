# 💻 Setup Environnement de Développement

## 🎯 Prérequis

### Outils Requis

- **Java 17** ou supérieur (OpenJDK recommendé)
- **Node.js 18+** avec npm
- **PostgreSQL 14+** (local ou Docker)
- **Git** pour versioning
- **IDE recommandé :** VS Code ou IntelliJ IDEA

### Vérification Version

```bash
java --version    # Java 17+
node --version    # v18+
npm --version     # 9+
psql --version    # PostgreSQL 14+
```

## 🚀 Installation Locale

### 1. Cloner le Repository

```bash
git clone https://github.com/ccathala/GenericDeckBuilder.git
cd GenericDeckBuilder
```

### 2. Setup Backend (Spring Boot)

#### Base de Données

```bash
# Option 1: PostgreSQL local
createdb deckbuilder_dev

# Option 2: Docker PostgreSQL
docker run --name postgres-dev \
  -e POSTGRES_DB=deckbuilder_dev \
  -e POSTGRES_USER=dev \
  -e POSTGRES_PASSWORD=dev \
  -p 5432:5432 -d postgres:16
```

#### Configuration Backend

```bash
cd backend

# Copier la configuration
cp src/main/resources/application.properties.example src/main/resources/application-dev.properties

# Éditer la configuration
# spring.datasource.url=jdbc:postgresql://localhost:5432/deckbuilder_dev
# spring.datasource.username=dev
# spring.datasource.password=dev
```

#### Démarrer Backend

```bash
# Installation dépendances + démarrage
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# Ou avec Maven wrapper
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev
```

Le backend sera accessible sur `http://localhost:8080`

### 3. Setup Frontend (React + Vite)

```bash
cd frontend

# Installation des dépendances
npm install

# Démarrage serveur de développement
npm run dev
```

Le frontend sera accessible sur `http://localhost:5173`

## ⚙️ Configuration IDE

### VS Code (Recommandé)

#### Extensions Essentielles

```json
{
  "recommendations": [
    "vscjava.vscode-java-pack",
    "vmware.vscode-spring-boot",
    "bradlc.vscode-tailwindcss",
    "ms-vscode.vscode-typescript-next",
    "esbenp.prettier-vscode",
    "ms-python.python"
  ]
}
```

#### Settings Workspace

```json
{
  "java.configuration.updateBuildConfiguration": "automatic",
  "spring-boot.ls.java.heap-size": 2048,
  "typescript.preferences.import-module-specifier": "relative",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.organizeImports": true
  }
}
```

### IntelliJ IDEA

#### Plugins Recommandés

- Spring Boot
- Database Tools and SQL
- TypeScript
- Vue.js (si migration future)

#### Configuration Projet

1. Importer comme projet Maven
2. Activer annotation processing
3. Configurer run configurations pour Spring Boot

## 🗄️ Structure de Projet

```
GenericDeckBuilder/
├── backend/                 # Spring Boot Application
│   ├── src/main/java/      # Code source Java
│   │   └── com/suri/...    # Packages principaux
│   ├── src/main/resources/ # Configurations, SQL
│   ├── src/test/          # Tests unitaires/intégration
│   └── pom.xml            # Dépendances Maven
├── frontend/               # React Application
│   ├── src/               # Code source React
│   │   ├── components/    # Composants réutilisables
│   │   ├── pages/         # Pages/Routes principales
│   │   ├── services/      # Services API
│   │   └── contexts/      # Contexts React
│   ├── public/            # Assets statiques
│   └── package.json       # Dépendances npm
├── docs/                  # Documentation projet
└── scripts/               # Scripts utilitaires
```

## 🛠️ Commandes de Développement

### Backend

```bash
# Tests
mvn test

# Build
mvn clean package

# Run avec profil dev
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# Format code
mvn spotless:apply
```

### Frontend

```bash
# Développement
npm run dev

# Build production
npm run build

# Preview build
npm run preview

# Lint
npm run lint

# Tests
npm run test
```

## 🔧 Configuration Environment

### Variables d'Environnement Développement

#### Backend (.env ou application-dev.properties)

```properties
# Base de données
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/deckbuilder_dev
SPRING_DATASOURCE_USERNAME=dev
SPRING_DATASOURCE_PASSWORD=dev

# JWT
JWT_SECRET=dev-secret-key-change-in-production
JWT_EXPIRATION=86400000

# Images
APP_CDN_BASE_URL=https://magenoir.com/cards
APP_CDN_ENABLE_FALLBACK=false

# Logs
LOGGING_LEVEL_COM_SURI=DEBUG
```

#### Frontend (.env.local)

```bash
# API Backend
VITE_API_BASE_URL=http://localhost:8080/api

# Debug
VITE_DEBUG_MODE=true
```

## 🧪 Tests & Validation

### Tests Backend

```bash
# Tests unitaires
mvn test

# Tests d'intégration
mvn integration-test

# Couverture de code
mvn jacoco:report
```

### Tests Frontend

```bash
# Tests unitaires
npm run test

# Tests e2e (si configurés)
npm run test:e2e
```

### Validation Manuelle

1. **Backend Health Check :** `http://localhost:8080/actuator/health`
2. **API Documentation :** `http://localhost:8080/swagger-ui.html`
3. **Frontend Dev Server :** `http://localhost:5173`
4. **Database Connection :** Logs backend au démarrage

## 🐛 Debugging

### Backend Debug

```bash
# Mode debug Maven
mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"

# Attach debugger IDE sur port 5005
```

### Frontend Debug

- **Browser DevTools :** F12 pour React DevTools
- **Vite HMR :** Hot reload automatique
- **Console Logs :** console.log pour debugging

### Database Debug

```bash
# Connection directe PostgreSQL
psql -h localhost -U dev -d deckbuilder_dev

# Voir les tables
\dt

# Debug requêtes
SELECT * FROM card WHERE element = 'vegetal';
```

## 🚨 Dépannage Courant

### Port déjà utilisé

```bash
# Tuer process sur port 8080
kill -9 $(lsof -t -i:8080)

# Changer port backend
mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8081
```

### Base de données inaccessible

1. Vérifier PostgreSQL running : `brew services list` (macOS) ou `systemctl status postgresql` (Linux)
2. Vérifier credentials dans application-dev.properties
3. Tester connection : `psql -h localhost -U dev -d deckbuilder_dev`

### Dépendances manquantes

```bash
# Backend
mvn clean install

# Frontend
rm -rf node_modules
npm install
```

---

_Guide mis à jour pour la version de développement actuelle_
