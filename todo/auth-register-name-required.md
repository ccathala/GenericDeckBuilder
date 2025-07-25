# 🔧 Rendre le champ `name` obligatoire pour l'endpoint `/auth/register`

## 📋 Analyse des modifications requises

### 🎯 Objectif

Modifier l'endpoint `/auth/register` pour rendre le champ `name` obligatoire dans la requête d'inscription.

### 📊 État actuel

- Le champ `name` est optionnel dans l'`AuthController`
- Le modèle `User` a déjà `name` marqué comme `nullable = false` en base de données
- Le frontend valide déjà le champ `name` comme obligatoire
- La documentation API indique actuellement le champ comme optionnel (❌)

## 🔍 Modifications nécessaires

### 1. Backend - Validation dans AuthController

**Fichier :** `backend/src/main/java/com/suri/generic/deck/builder/controller/AuthController.java`

**Modification ligne 35-37 :**

```java
// AVANT
String name = payload.get("name");

// APRÈS - Ajouter validation
String name = payload.get("name");
if (name == null || name.trim().isEmpty()) {
    return ResponseEntity.badRequest().body(Map.of("error", "Le nom est obligatoire"));
}
```

### 2. Alternative avec DTO de validation

**Recommandation :** Créer un DTO pour une meilleure validation

**Nouveau fichier :** `backend/src/main/java/com/suri/generic/deck/builder/dto/request/RegisterRequestDTO.java`

```java
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequestDTO {
    @NotBlank(message = "L'email est obligatoire")
    @Email(message = "Format d'email invalide")
    private String email;

    @NotBlank(message = "Le mot de passe est obligatoire")
    @Size(min = 6, message = "Le mot de passe doit contenir au moins 6 caractères")
    private String password;

    @NotBlank(message = "Le nom est obligatoire")
    @Size(min = 2, max = 50, message = "Le nom doit contenir entre 2 et 50 caractères")
    private String name;
}
```

### 3. Tests à mettre à jour

**Fichier :** `backend/src/test/java/com/suri/generic/deck/builder/controller/AuthControllerTest.java`

**Tests à ajouter/modifier :**

1. Test avec `name` null → doit retourner 400
2. Test avec `name` vide → doit retourner 400
3. Test avec `name` contenant uniquement des espaces → doit retourner 400
4. Modifier le test existant `testRegister_WithNullValues()` pour vérifier l'échec

### 4. Documentation API à corriger

**Fichier :** `docs/api/authentication.md`

**Modification ligne 19 :**

```markdown
| name | string | ❌ | Nom d'affichage |
```

**Vers :**

```markdown
| name | string | ✅ | Nom d'affichage (2-50 car)|
```

**Ajout d'un exemple d'erreur :**

```json
{
  "error": "Le nom est obligatoire"
}
```

## 🧪 Impact sur les tests existants

### Tests qui passeront encore ✅

- `testRegister_Success()` - utilise un nom valide
- `testRegister_WithMockMvc_Success()` - utilise un nom valide
- `testRegister_EmailAlreadyExists()` - validation email avant nom

### Tests à corriger ⚠️

- `testRegister_WithNullValues()` - actuellement passe, devra échouer
- Tests d'intégration qui omettent le champ `name`

## 🔄 Cohérence avec le frontend

### État actuel du frontend ✅

Le frontend valide déjà le champ `name` :

- Validation dans `useFormValidation.js` : `validateName()`
- Champ marqué `required` dans `RegisterPage.jsx`
- Messages d'erreur configurés dans les traductions

### Pas de modification frontend nécessaire

Le frontend est déjà conforme aux nouvelles exigences.

## 📝 Ordre de mise en œuvre recommandé

1. **Étape 1 :** Modifier `AuthController` pour valider le champ `name`
2. **Étape 2 :** Mettre à jour les tests existants
3. **Étape 3 :** Ajouter de nouveaux tests pour les cas d'erreur
4. **Étape 4 :** Corriger la documentation API
5. **Étape 5 :** (Optionnel) Créer un DTO pour une validation plus robuste

## 🎯 Critères d'acceptation

- [ ] L'endpoint `/auth/register` refuse les requêtes sans champ `name`
- [ ] L'endpoint refuse les noms vides ou contenant uniquement des espaces
- [ ] Message d'erreur explicite retourné (400 Bad Request)
- [ ] Tous les tests passent après modification
- [ ] Documentation API mise à jour
- [ ] Cohérence maintenue avec le frontend

## 📋 Notes techniques

### Contrainte base de données

Le modèle `User` a déjà la contrainte `nullable = false` sur le champ `name`, ce qui est cohérent avec l'objectif.

### Messages d'erreur cohérents

Utiliser des messages similaires à ceux du frontend :

- Frontend : "Le nom est obligatoire"
- Backend : "Le nom est obligatoire"

### Validation avancée (optionnelle)

Considérer l'ajout de validations supplémentaires :

- Longueur minimum/maximum
- Caractères autorisés
- Nettoyage des espaces en début/fin (`trim()`)
