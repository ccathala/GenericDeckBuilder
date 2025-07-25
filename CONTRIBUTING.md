# 🤝 Guide de Contribution - GenericDeckBuilder

Merci de votre intérêt pour contribuer au projet GenericDeckBuilder ! Ce guide vous explique comment participer efficacement au développement.

## 🎯 Comment Contribuer

### Types de Contributions

- 🐛 **Bug Reports** : Signaler des problèmes
- 💡 **Feature Requests** : Proposer de nouvelles fonctionnalités
- 🔧 **Code Contributions** : Corrections et améliorations
- 📚 **Documentation** : Améliorer la documentation
- 🎨 **UI/UX** : Améliorations interface utilisateur

## 🚀 Processus de Contribution

### 1. Setup Initial

```bash
# Fork le repository
git clone https://github.com/VOTRE-USERNAME/GenericDeckBuilder.git
cd GenericDeckBuilder

# Ajouter upstream remote
git remote add upstream https://github.com/ccathala/GenericDeckBuilder.git

# Setup environnement local
# Voir docs/development/setup.md
```

### 2. Workflow de Développement

#### Créer une Branche Feature

```bash
# Synchroniser avec upstream
git checkout dev
git pull upstream dev

# Créer branche feature
git checkout -b feature/nouvelle-fonctionnalite

# Ou pour bug fix
git checkout -b fix/correction-bug-xyz
```

#### Standards de Nommage des Branches

- **feature/\*** : Nouvelles fonctionnalités
- **fix/\*** : Corrections de bugs
- **docs/\*** : Documentation uniquement
- **refactor/\*** : Refactoring code
- **test/\*** : Ajout/amélioration tests

### 3. Développement

#### Avant de Commencer

- [ ] Issue créée et assignée
- [ ] Design/architecture discutée (si nécessaire)
- [ ] Tests compris et planifiés

#### Pendant le Développement

```bash
# Commits fréquents avec messages clairs
git add .
git commit -m "feat(cards): add element filter to search API"

# Push régulier de la branche
git push origin feature/nouvelle-fonctionnalite
```

#### Standards de Code

- Suivre les [conventions de développement](docs/development/conventions.md)
- Tests unitaires requis pour nouveau code
- Documentation mise à jour si nécessaire

### 4. Pull Request

#### Préparer la PR

```bash
# Synchroniser avec dev avant PR
git checkout dev
git pull upstream dev
git checkout feature/nouvelle-fonctionnalite
git rebase dev

# Résoudre conflits si nécessaire
# Push final
git push origin feature/nouvelle-fonctionnalite
```

#### Template PR

```markdown
## Description

Brève description des changements apportés.

## Type de Changement

- [ ] Bug fix (correction non-breaking)
- [ ] Nouvelle fonctionnalité (ajout non-breaking)
- [ ] Breaking change (fix/feature cassant compatibilité)
- [ ] Documentation uniquement

## Comment Tester

Étapes pour tester les changements :

1. Cloner la branche
2. Lancer `mvn spring-boot:run` (backend)
3. Lancer `npm run dev` (frontend)
4. Tester scenario X, Y, Z

## Checklist

- [ ] Code respecte les conventions du projet
- [ ] Tests ajoutés/mis à jour
- [ ] Documentation mise à jour
- [ ] Pas de warnings/erreurs de build
- [ ] Tests passent en local
```

## 🧪 Standards de Qualité

### Tests Requis

```bash
# Backend - Tests unitaires obligatoires
mvn test

# Frontend - Tests composants principaux
npm run test

# Tests d'intégration pour APIs
mvn integration-test
```

### Code Review Checklist

#### Backend (Java)

- [ ] Services avec @Transactional approprié
- [ ] Validation input avec Bean Validation
- [ ] Exceptions métier correctement gérées
- [ ] Sécurité : pas de data leak
- [ ] Performance : queries optimisées

#### Frontend (React)

- [ ] Composants fonctionnels avec hooks
- [ ] PropTypes définis pour tous les props
- [ ] Error boundaries pour gestion erreurs
- [ ] Accessibilité : attributs ARIA si nécessaire
- [ ] Performance : éviter re-renders inutiles

### Documentation

- Code documenté (JavaDoc/JSDoc)
- README mis à jour si changement d'usage
- API documentation mise à jour si nouveaux endpoints

## 🎯 Priorités de Contribution

### High Priority

1. **Performance** : Optimisation queries database
2. **Tests** : Couverture test manquante
3. **Security** : Audit sécurité et corrections
4. **Accessibility** : Amélioration WCAG compliance

### Medium Priority

1. **Features** : Nouvelles fonctionnalités demandées
2. **UI/UX** : Améliorations interface utilisateur
3. **Mobile** : Responsive design improvements
4. **I18n** : Support langues supplémentaires

### Low Priority

1. **Refactoring** : Code cleanup non-critique
2. **Documentation** : Améliorations docs existantes
3. **DevOps** : Optimisations build/deploy

## 🐛 Signaler des Bugs

### Template Bug Report

```markdown
## Résumé Bug

Description claire et concise du problème.

## Étapes de Reproduction

1. Aller à '...'
2. Cliquer sur '...'
3. Voir erreur

## Comportement Attendu

Ce qui devrait se passer normalement.

## Comportement Actuel

Ce qui se passe réellement.

## Environnement

- OS : [ex: Windows 11]
- Navigateur : [ex: Chrome 91]
- Version app : [ex: v1.2.0]

## Logs/Screenshots

Ajouter logs d'erreur ou screenshots si applicable.
```

### Labels Issues

- **bug** : Problème confirmé
- **enhancement** : Nouvelle fonctionnalité
- **documentation** : Amélioration docs
- **good first issue** : Facile pour débutants
- **help wanted** : Aide externe bienvenue
- **priority: high/medium/low** : Niveau priorité

## 💡 Proposer des Features

### Template Feature Request

```markdown
## Feature Demandée

Description claire de la fonctionnalité souhaitée.

## Problème Résolu

Quel problème cette feature résout-elle ?

## Solution Proposée

Comment imaginez-vous l'implémentation ?

## Alternatives Considérées

Autres approches envisagées.

## Contexte Additionnel

Screenshots, mockups, références...
```

### Process d'Approbation

1. **Discussion** : Issue créée et débat communauté
2. **Design** : Architecture/UI définie si complexe
3. **Approval** : Maintainers approuvent développement
4. **Implementation** : Développement selon standards
5. **Review** : Code review avant merge

## 👥 Code of Conduct

### Nos Engagements

- **Respect** : Environnement accueillant pour tous
- **Collaboration** : Communication constructive
- **Qualité** : Standards élevés maintenus
- **Apprentissage** : Partage de connaissances

### Comportements Inacceptables

- Langage offensant ou discriminatoire
- Harcèlement sous toute forme
- Publication d'informations privées
- Conduite non-professionnelle

## 🏆 Reconnaissance

### Contributors

Tous les contributeurs sont reconnus dans :

- **README.md** : Section contributors
- **CHANGELOG.md** : Mentions des contributions
- **Release notes** : Crédits pour features majeures

### Becoming a Maintainer

Critères pour devenir maintainer :

- Contributions régulières et de qualité
- Connaissance approfondie codebase
- Reviews constructives d'autres PRs
- Respect community guidelines

## 📞 Obtenir de l'Aide

### Channels de Communication

- **GitHub Issues** : Questions techniques, bugs
- **GitHub Discussions** : Questions générales, idées
- **Pull Request Reviews** : Feedback code spécifique

### Documentation

- [Setup Development](docs/development/setup.md)
- [Architecture Overview](docs/architecture/overview.md)
- [API Documentation](docs/api/README.md)
- [Conventions](docs/development/conventions.md)

---

**Merci de contribuer à GenericDeckBuilder ! 🚀**

_Votre participation aide à améliorer l'expérience pour toute la communauté._
