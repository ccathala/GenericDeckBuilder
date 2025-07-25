# 📜 Conventions de Développement

## 🎯 Standards de Code

### Java (Backend)

#### Naming Conventions

```java
// Classes : PascalCase
public class CardService { }
public class UserController { }

// Méthodes : camelCase avec verbes
public void createCard() { }
public Card findCardById(Long id) { }

// Variables : camelCase descriptives
private String cardName;
private List<Card> filteredCards;

// Constantes : UPPER_SNAKE_CASE
private static final String DEFAULT_LANGUAGE = "FRENCH";
private static final int MAX_CARDS_PER_DECK = 40;

// Packages : lowercase avec points
com.suri.generic.deck.builder.service
```

#### Architecture Patterns

```java
// Controllers : Endpoint REST uniquement
@RestController
@RequestMapping("/api/cards")
public class CardController {
    // Pas de logique métier ici
    // Validation des inputs
    // Mapping DTO ↔ Entity
}

// Services : Logique métier
@Service
@Transactional
public class CardService {
    // Business logic
    // Transactions database
    // Validation business rules
}

// Repositories : Accès données uniquement
public interface CardRepository extends JpaRepository<Card, Long> {
    // Queries JPA
    // Pas de logique métier
}
```

#### Documentation Code

```java
/**
 * Service de gestion des cartes du jeu Mage Noir
 *
 * Gère la création, modification, recherche et validation
 * des cartes avec support multilingue FR/EN.
 */
@Service
public class CardService {

    /**
     * Recherche des cartes avec filtrage par critères
     *
     * @param element Élément de carte (optionnel)
     * @param language Langue des cartes (FR/EN)
     * @param pageable Configuration pagination
     * @return Page de cartes filtrées
     * @throws ValidationException Si les critères sont invalides
     */
    public Page<Card> searchCards(Element element, Language language, Pageable pageable) {
        // Implementation
    }
}
```

### JavaScript/React (Frontend)

#### Naming Conventions

```javascript
// Composants : PascalCase
function CardGallery() {}
const NavBar = () => {};

// Variables/Functions : camelCase
const cardList = [];
const fetchCards = async () => {};

// Constants : UPPER_SNAKE_CASE
const API_BASE_URL = "http://localhost:8080/api";
const MAX_CARDS_DISPLAY = 50;

// Files : kebab-case
card - gallery.jsx;
nav - bar.css;
api - service.js;
```

#### Component Structure

```javascript
// Composant fonctionnel avec hooks
import React, { useState, useEffect } from "react";
import PropTypes from "prop-types";

/**
 * Galerie d'affichage des cartes avec filtrage
 *
 * @param {Object} props - Props du composant
 * @param {Array} props.cards - Liste des cartes à afficher
 * @param {Function} props.onCardSelect - Callback sélection carte
 */
const CardGallery = ({ cards, onCardSelect }) => {
  const [selectedCard, setSelectedCard] = useState(null);

  // Effects en haut
  useEffect(() => {
    // Logique side effect
  }, [cards]);

  // Event handlers
  const handleCardClick = (card) => {
    setSelectedCard(card);
    onCardSelect?.(card);
  };

  // Render
  return (
    <div className="card-gallery">
      {cards.map((card) => (
        <div key={card.id} onClick={() => handleCardClick(card)}>
          {card.name}
        </div>
      ))}
    </div>
  );
};

// PropTypes validation
CardGallery.propTypes = {
  cards: PropTypes.arrayOf(PropTypes.object).isRequired,
  onCardSelect: PropTypes.func,
};

export default CardGallery;
```

## 🏗️ Architecture Patterns

### Backend Structure

```
src/main/java/com/suri/generic/deck/builder/
├── controller/          # REST endpoints
│   ├── AuthController   # Authentication
│   ├── CardController   # Cards CRUD
│   └── DeckController   # Decks management
├── service/             # Business logic
│   ├── AuthService      # Auth logic, JWT
│   ├── CardService      # Cards business rules
│   └── DeckService      # Decks validation
├── repository/          # Data access
│   ├── UserRepository   # JPA repositories
│   ├── CardRepository   # Query methods
│   └── DeckRepository   # Database access
├── model/               # JPA Entities
│   ├── User.java        # Database models
│   ├── Card.java        # Relationships
│   └── Deck.java        # Constraints
├── dto/                 # Data Transfer Objects
│   ├── request/         # Input DTOs
│   └── response/        # Output DTOs
├── config/              # Configuration
│   ├── SecurityConfig   # Spring Security
│   ├── WebConfig        # CORS, static resources
│   └── OpenApiConfig    # Swagger setup
└── security/            # Auth components
    ├── JwtAuthFilter    # JWT validation
    └── UserDetailsImpl  # User principal
```

### Frontend Structure

```
src/
├── components/          # Reusable components
│   ├── ui/             # Basic UI (buttons, inputs)
│   ├── cards/          # Card-related components
│   └── decks/          # Deck-related components
├── pages/              # Route components
│   ├── LoginPage.jsx   # Authentication
│   ├── DecksPage.jsx   # Main app pages
│   └── ProfilePage.jsx # User management
├── services/           # API clients
│   ├── authService.js  # Authentication API
│   ├── cardService.js  # Cards API
│   └── deckService.js  # Decks API
├── contexts/           # React contexts
│   ├── AuthContext     # User authentication state
│   └── LanguageContext # Internationalization
├── hooks/              # Custom hooks
│   ├── useAuth.js      # Authentication logic
│   └── useApi.js       # API call patterns
└── utils/              # Utility functions
    ├── constants.js    # App constants
    └── helpers.js      # Helper functions
```

## 📝 Commit Messages

### Format Standard

```bash
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types Autorisés

- **feat :** Nouvelle fonctionnalité
- **fix :** Correction de bug
- **docs :** Documentation uniquement
- **style :** Formatage code (pas de changement logique)
- **refactor :** Refactoring sans changement fonctionnel
- **test :** Ajout/modification tests
- **chore :** Maintenance (build, config, etc.)

### Exemples

```bash
# Nouvelle fonctionnalité
feat(cards): add search by element filter

# Correction bug
fix(auth): resolve JWT token expiration issue

# Documentation
docs(api): update authentication endpoints documentation

# Refactoring
refactor(service): extract card validation to separate method

# Configuration
chore(build): update Spring Boot to 3.5.3
```

## 🧪 Standards de Test

### Backend Tests (JUnit 5)

```java
@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
class CardServiceTest {

    @Autowired
    private CardService cardService;

    @MockBean
    private CardRepository cardRepository;

    @Test
    @DisplayName("Should find cards by element")
    void shouldFindCardsByElement() {
        // Given
        Element element = Element.VEGETAL;
        List<Card> expectedCards = Arrays.asList(
            createMockCard("Graine", element),
            createMockCard("Arbre", element)
        );

        when(cardRepository.findByElement(element))
            .thenReturn(expectedCards);

        // When
        List<Card> actualCards = cardService.findByElement(element);

        // Then
        assertThat(actualCards)
            .hasSize(2)
            .extracting(Card::getName)
            .containsExactly("Graine", "Arbre");
    }

    private Card createMockCard(String name, Element element) {
        Card card = new Card();
        card.setName(name);
        card.setElement(element);
        return card;
    }
}
```

### Frontend Tests (Jest + React Testing Library)

```javascript
import { render, screen, fireEvent } from "@testing-library/react";
import { describe, it, expect, vi } from "vitest";
import CardGallery from "./CardGallery";

describe("CardGallery", () => {
  const mockCards = [
    { id: 1, name: "Graine", element: "vegetal" },
    { id: 2, name: "Flamme", element: "fire" },
  ];

  it("should render all cards", () => {
    // Arrange
    const onCardSelect = vi.fn();

    // Act
    render(<CardGallery cards={mockCards} onCardSelect={onCardSelect} />);

    // Assert
    expect(screen.getByText("Graine")).toBeInTheDocument();
    expect(screen.getByText("Flamme")).toBeInTheDocument();
  });

  it("should call onCardSelect when card is clicked", () => {
    // Arrange
    const onCardSelect = vi.fn();
    render(<CardGallery cards={mockCards} onCardSelect={onCardSelect} />);

    // Act
    fireEvent.click(screen.getByText("Graine"));

    // Assert
    expect(onCardSelect).toHaveBeenCalledWith(mockCards[0]);
  });
});
```

## 🔧 Configuration IDE

### VS Code Settings

```json
{
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.organizeImports": true,
    "source.fixAll.eslint": true
  },
  "java.format.settings.url": "./.vscode/java-google-style.xml",
  "prettier.configPath": "./.prettierrc",
  "eslint.workingDirectories": ["frontend"]
}
```

### ESLint Configuration (.eslintrc.js)

```javascript
module.exports = {
  extends: [
    "react-app",
    "react-app/jest",
    "eslint:recommended",
    "@typescript-eslint/recommended",
  ],
  rules: {
    "no-unused-vars": "warn",
    "no-console": "warn",
    "prefer-const": "error",
    "react/prop-types": "error",
  },
};
```

### Prettier Configuration (.prettierrc)

```json
{
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false,
  "semi": true,
  "singleQuote": true,
  "quoteProps": "as-needed",
  "trailingComma": "es5"
}
```

## 📊 Performance Guidelines

### Backend Performance

- **Database Queries :** Utiliser pagination par défaut
- **Lazy Loading :** Configurer @OneToMany avec LAZY
- **Caching :** @Cacheable pour données statiques
- **Transactions :** @Transactional au niveau service uniquement

### Frontend Performance

- **Component Memoization :** React.memo pour composants lourds
- **State Management :** Éviter re-renders inutiles
- **Bundle Size :** Code splitting avec React.lazy()
- **Image Optimization :** Lazy loading et formats optimisés

## 🚨 Error Handling

### Backend Exceptions

```java
// Custom exceptions
public class CardNotFoundException extends RuntimeException {
    public CardNotFoundException(Long cardId) {
        super("Card not found with ID: " + cardId);
    }
}

// Global exception handler
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(CardNotFoundException.class)
    public ResponseEntity<ErrorResponse> handleCardNotFound(CardNotFoundException e) {
        ErrorResponse error = new ErrorResponse("CARD_NOT_FOUND", e.getMessage());
        return ResponseEntity.status(404).body(error);
    }
}
```

### Frontend Error Handling

```javascript
// Error boundaries pour React
class ErrorBoundary extends Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.error("Error caught by boundary:", error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return <h1>Something went wrong.</h1>;
    }
    return this.props.children;
  }
}

// Async error handling
const fetchCards = async () => {
  try {
    const response = await cardService.getAllCards();
    setCards(response.data);
  } catch (error) {
    console.error("Failed to fetch cards:", error);
    setError("Unable to load cards. Please try again.");
  }
};
```

---

_Standards mis à jour pour l'équipe de développement GenericDeckBuilder_
