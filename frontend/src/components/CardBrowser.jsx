import React, { useState, useEffect, useCallback } from "react";
import { useLanguage } from "../contexts/LanguageContext";
import { useComponentTranslations } from "../hooks/useComponentTranslations";
import CardFilter from "./CardFilter";
import CardGallery from "./CardGallery";
import cardService from "../services/cardService";

const CardBrowser = ({
  cards = null, // Si null, on chargera les cartes nous-mêmes
  loading = false,
  error = null,
  onCardClick = null,
  onCardSelection = null, // Callback pour la sélection avec (cardId, isSelected, quantity)
  selectedCards = new Set(), // Set d'IDs des cartes sélectionnées
  allowMultiSelect = false,
  gameId = null,
  showSelection = false,
  title = null,
  showTitle = true,
  className = "",
  maxColumns = null, // Nouveau prop pour limiter le nombre de colonnes
  onCardsLoaded = null, // Callback when cards are loaded
}) => {
  const { currentLanguage } = useLanguage();
  const [localCards, setLocalCards] = useState([]);
  const [localLoading, setLocalLoading] = useState(false);
  const [localError, setLocalError] = useState(null);
  const [filteredCards, setFilteredCards] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedElements, setSelectedElements] = useState([]);
  const [selectedComponents, setSelectedComponents] = useState([]);
  const [selectedType, setSelectedType] = useState("");
  const [availableComponents, setAvailableComponents] = useState([]);
  const [columnsCount, setColumnsCount] = useState(
    maxColumns ? Math.max(6, Math.min(10, maxColumns)) : 7
  ); // Nombre de colonnes pour le zoom (6-10)
  const [showImagePreview, setShowImagePreview] = useState(true); // État pour l'aperçu d'image
  const [showFanMade, setShowFanMade] = useState(false); // État pour le filtre fan made

  // Extensions fan made définies en dur
  const FAN_MADE_EXTENSIONS = ["Nexus Noir"];

  // Hook pour les traductions des composants
  const {
    translateComponent,
    loading: translationsLoading,
    isReady: translationsReady,
  } = useComponentTranslations(gameId || "mage_noir");

  // Utiliser les cartes passées en props ou charger les cartes localement
  const cardsToUse = cards !== null ? cards : localCards;
  const loadingState = cards !== null ? loading : localLoading;
  const errorState = cards !== null ? error : localError;

  // Fonction pour extraire les composants uniques
  const extractUniqueComponents = useCallback((cards) => {
    console.log(
      "🔍 extractUniqueComponents appelé avec",
      cards?.length || 0,
      "cartes"
    );

    // Vérification de sécurité : s'assurer que cards est un tableau
    if (!Array.isArray(cards)) {
      console.error(
        "❌ extractUniqueComponents: cards n'est pas un tableau",
        cards
      );
      return [];
    }

    const componentSet = new Set();

    cards.forEach((card) => {
      if (
        card.properties &&
        card.properties.componentCost &&
        Array.isArray(card.properties.componentCost)
      ) {
        card.properties.componentCost.forEach((component) => {
          if (component.componentName) {
            componentSet.add(component.componentName);
          }
        });
      }
    });

    const result = Array.from(componentSet).sort();
    console.log("✅ Composants extraits:", result);
    return result;
  }, []);

  // Fonction pour charger les cartes
  const fetchCards = useCallback(async () => {
    try {
      setLocalLoading(true);
      setLocalError(null);

      // Utiliser gameId ou par défaut "mage_noir"
      const currentGameId = gameId || "mage_noir";

      const data = await cardService.getCardsByGame(
        currentGameId,
        currentLanguage
      );

      // Calculer les composants AVANT de mettre à jour les états
      const components = extractUniqueComponents(data);

      // Mise à jour synchronisée des deux états
      setLocalCards(data);
      setAvailableComponents(components);

      // Notify parent component about loaded cards
      if (onCardsLoaded) {
        onCardsLoaded(data);
      }
    } catch (err) {
      console.error("Erreur lors du chargement des cartes:", err);
      setLocalError(err.message || "Erreur lors du chargement des cartes");
    } finally {
      setLocalLoading(false);
    }
  }, [gameId, currentLanguage, onCardsLoaded, extractUniqueComponents]);

  // Charger les cartes si pas fournies en props
  useEffect(() => {
    if (cards === null) {
      fetchCards();
    }
  }, [cards, fetchCards]);

  // useEffect pour extraire les composants quand cards change (fourni en props)
  useEffect(() => {
    if (cards !== null && cards.length > 0) {
      const components = extractUniqueComponents(cards);
      setAvailableComponents(components);
    }
  }, [cards, extractUniqueComponents]);

  // Fonction pour normaliser les chaînes (supprime les accents)
  const normalizeString = (str) => {
    if (!str) return "";
    return str
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "")
      .toLowerCase();
  };

  useEffect(() => {
    if (
      searchTerm ||
      selectedElements.length > 0 ||
      selectedComponents.length > 0 ||
      selectedType ||
      !showFanMade // Si showFanMade est false, on applique le filtre
    ) {
      const filtered = cardsToUse.filter((card) => {
        // Filtrage par texte (insensible aux accents)
        const normalizedSearchTerm = normalizeString(searchTerm);
        const matchesSearch =
          !searchTerm ||
          normalizeString(card.name).includes(normalizedSearchTerm) ||
          (card.description &&
            normalizeString(card.description).includes(normalizedSearchTerm)) ||
          (card.properties &&
            card.properties.type &&
            normalizeString(card.properties.type.toString()).includes(
              normalizedSearchTerm
            ));

        // Filtrage par éléments
        const matchesElement =
          selectedElements.length === 0 ||
          (card.properties &&
            card.properties.element &&
            selectedElements.includes(card.properties.element.toString()));

        // Filtrage par composants (logique OU)
        const matchesComponent =
          selectedComponents.length === 0 ||
          (card.properties &&
            card.properties.componentCost &&
            Array.isArray(card.properties.componentCost) &&
            selectedComponents.some((selectedComp) =>
              card.properties.componentCost.some(
                (cardComp) => cardComp.componentName === selectedComp
              )
            ));

        // Filtrage par type
        const matchesType =
          !selectedType ||
          selectedType === "" ||
          (card.properties &&
            card.properties.type &&
            card.properties.type
              .toLowerCase()
              .includes(selectedType.toLowerCase()));

        // Filtrage par fan made
        const matchesFanMadeFilter = showFanMade || (
          !card.properties?.extension || 
          !FAN_MADE_EXTENSIONS.includes(card.properties.extension)
        );

        return (
          matchesSearch && 
          matchesElement && 
          matchesComponent && 
          matchesType && 
          matchesFanMadeFilter
        );
      });
      setFilteredCards(filtered);
    } else {
      setFilteredCards(cardsToUse);
    }
  }, [
    searchTerm,
    selectedElements,
    selectedComponents,
    selectedType,
    cardsToUse,
    showFanMade,
  ]);

  const handleSearchChange = (term) => {
    setSearchTerm(term);
  };

  const handleElementToggle = (element) => {
    setSelectedElements((prev) =>
      prev.includes(element)
        ? prev.filter((e) => e !== element)
        : [...prev, element]
    );
  };

  const handleComponentToggle = (component) => {
    setSelectedComponents((prev) =>
      prev.includes(component)
        ? prev.filter((c) => c !== component)
        : [...prev, component]
    );
  };

  const handleTypeChange = (type) => {
    setSelectedType(type);
  };

  const handleFanMadeToggle = () => {
    setShowFanMade(!showFanMade);
  };

  const handleResetFilters = () => {
    setSearchTerm("");
    setSelectedElements([]);
    setSelectedComponents([]);
    setSelectedType("");
    setShowFanMade(false);
  };

  const handleColumnsChange = (newCount) => {
    if (newCount >= 6 && newCount <= 10) {
      setColumnsCount(newCount);
    }
  };

  const handleImagePreviewToggle = () => {
    setShowImagePreview(!showImagePreview);
  };

  const handleCardClick = (card) => {
    if (onCardSelection) {
      const isCurrentlySelected = selectedCards.has(card.id);
      const newSelection = !isCurrentlySelected;
      onCardSelection(card.id, newSelection, 1, card);
    } else if (onCardClick) {
      onCardClick(card);
    }
  };

  // Convertir le Set en Array pour CardGallery
  const selectedCardsArray = Array.from(selectedCards).map((id) => ({ id }));

  return (
    <div
      className={`w-full h-full flex flex-col overflow-hidden pt-4 ${className}`}
    >
      {showTitle && title && (
        <div className="mb-8 flex-shrink-0">
          <h1 className="text-3xl font-bold mb-4 text-center text-white">
            {title}
          </h1>
        </div>
      )}

      <div className="mb-4 flex-shrink-0">
        <CardFilter
          searchTerm={searchTerm}
          onSearchChange={handleSearchChange}
          selectedElements={selectedElements}
          onElementToggle={handleElementToggle}
          selectedComponents={selectedComponents}
          onComponentToggle={handleComponentToggle}
          availableComponents={availableComponents}
          translateComponent={translateComponent}
          selectedType={selectedType}
          onTypeChange={handleTypeChange}
          onResetFilters={handleResetFilters}
          columnsCount={columnsCount}
          onColumnsChange={handleColumnsChange}
          showImagePreview={showImagePreview}
          onImagePreviewToggle={handleImagePreviewToggle}
          showFanMade={showFanMade}
          onFanMadeToggle={handleFanMadeToggle}
        />
      </div>

      <div className="flex-1 min-h-0 overflow-y-auto pr-2 scrollbar-thin scrollbar-thumb-gray-600 scrollbar-track-gray-800">
        <CardGallery
          cards={filteredCards}
          loading={loadingState}
          error={errorState}
          onCardClick={handleCardClick}
          showSelection={allowMultiSelect || showSelection}
          selectedCards={selectedCardsArray}
          maxColumns={columnsCount}
          showImagePreview={showImagePreview}
        />
      </div>
    </div>
  );
};

export default CardBrowser;
