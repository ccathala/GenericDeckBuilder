import React, { useState, useEffect } from "react";
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
}) => {
  const { t, currentLanguage } = useLanguage();
  const [localCards, setLocalCards] = useState([]);
  const [localLoading, setLocalLoading] = useState(false);
  const [localError, setLocalError] = useState(null);
  const [filteredCards, setFilteredCards] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedElements, setSelectedElements] = useState([]);

  // Utiliser les cartes passées en props ou charger les cartes localement
  const cardsToUse = cards !== null ? cards : localCards;
  const loadingState = cards !== null ? loading : localLoading;
  const errorState = cards !== null ? error : localError;

  // Charger les cartes si pas fournies en props
  useEffect(() => {
    if (cards === null) {
      fetchCards();
    }
  }, [cards, gameId, currentLanguage]);

  const fetchCards = async () => {
    try {
      setLocalLoading(true);
      setLocalError(null);

      // Utiliser gameId ou par défaut "mage_noir"
      const currentGameId = gameId || "mage_noir";

      const data = await cardService.getCardsByGame(currentGameId, currentLanguage);
      setLocalCards(data);
    } catch (err) {
      console.error("Erreur lors du chargement des cartes:", err);
      setLocalError(err.message || "Erreur lors du chargement des cartes");
    } finally {
      setLocalLoading(false);
    }
  };

  // Fonction pour normaliser les chaînes (supprime les accents)
  const normalizeString = (str) => {
    if (!str) return "";
    return str
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "")
      .toLowerCase();
  };

  useEffect(() => {
    if (searchTerm || selectedElements.length > 0) {
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

        return matchesSearch && matchesElement;
      });
      setFilteredCards(filtered);
    } else {
      setFilteredCards(cardsToUse);
    }
  }, [searchTerm, selectedElements, cardsToUse]);

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
