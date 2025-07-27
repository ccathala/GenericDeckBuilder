import React, { useState, useEffect, useCallback } from "react";
import { useLanguage } from "../contexts/LanguageContext";
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
  const [availableComponents, setAvailableComponents] = useState([]);

  // Utiliser les cartes passées en props ou charger les cartes localement
  const cardsToUse = cards !== null ? cards : localCards;
  const loadingState = cards !== null ? loading : localLoading;
  const errorState = cards !== null ? error : localError;

  // Fonction pour extraire les composants uniques
  const extractUniqueComponents = useCallback((cards) => {
    console.log(
      "🔍 extractUniqueComponents appelé avec",
      cards.length,
      "cartes"
    );

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
      selectedComponents.length > 0
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

        return matchesSearch && matchesElement && matchesComponent;
      });
      setFilteredCards(filtered);
    } else {
      setFilteredCards(cardsToUse);
    }
  }, [searchTerm, selectedElements, selectedComponents, cardsToUse]);

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

  const handleResetFilters = () => {
    setSearchTerm("");
    setSelectedElements([]);
    setSelectedComponents([]);
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
          onResetFilters={handleResetFilters}
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
          maxColumns={maxColumns}
        />
      </div>
    </div>
  );
};

export default CardBrowser;
