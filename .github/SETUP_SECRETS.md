# 🔐 Configuration des secrets GitHub Actions

## Secrets requis pour CI/CD

Pour configurer complètement le pipeline CI/CD, ajoutez ces secrets dans GitHub :

### 1. Settings > Secrets and variables > Actions

```bash
# Codecov Token (optionnel, mais recommandé pour projets privés)
CODECOV_TOKEN=<votre_token_codecov>

# SonarCloud Token (pour Phase 2)
SONAR_TOKEN=<votre_token_sonarcloud>
```

### 2. Comment obtenir les tokens

#### Codecov:
1. Connectez-vous sur https://codecov.io/
2. Ajoutez votre repository GitHub
3. Copiez le token dans Settings > Repository

#### SonarCloud (Phase 2):
1. Connectez-vous sur https://sonarcloud.io/
2. Créez un projet pour votre repository
3. Générez un token dans Security

### 3. Commandes pour tester localement

```bash
# Test du pipeline complet
mvn clean test jacoco:report jacoco:check -P ci

# Génération des badges (nécessite le script PowerShell)
powershell -ExecutionPolicy Bypass -File ".\generate-coverage-report.ps1"

# Vérification du build frontend
cd frontend && npm ci && npm run lint && npm run build
```

### 4. Structure des branches

Le pipeline se déclenche automatiquement sur :
- **Push** vers `main`, `dev`, `develop`
- **Pull Requests** vers `main`, `dev`, `develop`

### 5. Artifacts générés

- **Rapports de tests** : `target/surefire-reports/`
- **Couverture JaCoCo** : `target/site/jacoco/`
- **Build frontend** : `frontend/dist/`

Conservez ces artifacts pendant 30 jours pour debugging.
