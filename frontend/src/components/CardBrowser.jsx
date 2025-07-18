import React, { useState, useEffect } from "react";
import { useLanguage } from "../contexts/LanguageContext";
import CardFilter from "./CardFilter";
import CardGallery from "./CardGallery";

const CardBrowser = ({
  cards = [],
  loading = false,
  error = null,
  onCardClick = null,
  showSelection = false,
  selectedCards = [],
  title = null,
  showTitle = true,
  className = ""
}) => {
  const { t } = useLanguage();
  const [filteredCards, setFilteredCards] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedElements, setSelectedElements] = useState([]);

  // Fonction pour normaliser les chaînes (supprime les accents)
  const normalizeString = (str) => {
    if (!str) return "";
    return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  };

  useEffect(() => {
    if (searchTerm || selectedElements.length > 0) {
      const filtered = cards.filter(
        (card) => {
          // Filtrage par texte (insensible aux accents)
          const normalizedSearchTerm = normalizeString(searchTerm);
          const matchesSearch = !searchTerm || (
            normalizeString(card.name).includes(normalizedSearchTerm) ||
            (card.description &&
              normalizeString(card.description).includes(normalizedSearchTerm)) ||
            (card.properties &&
              card.properties.type &&
              normalizeString(card.properties.type.toString()).includes(normalizedSearchTerm))
          );

          // Filtrage par éléments
          const matchesElement = selectedElements.length === 0 ||
            (card.properties &&
              card.properties.element &&
              selectedElements.includes(card.properties.element.toString()));

          return matchesSearch && matchesElement;
        }
      );
      setFilteredCards(filtered);
    } else {
      setFilteredCards(cards);
    }
  }, [searchTerm, selectedElements, cards]);

  const handleSearchChange = (term) => {
    setSearchTerm(term);
  };

  const handleElementToggle = (element) => {
    setSelectedElements(prev => 
      prev.includes(element)
        ? prev.filter(e => e !== element)
        : [...prev, element]
    );
  };

  return (
    <div className={`w-full ${className}`}>
      {showTitle && title && (
        <div className="mb-8">
          <h1 className="text-3xl font-bold mb-4 text-center text-white">{title}</h1>
        </div>
      )}
      
      <div className="mb-8">
        <CardFilter
          searchTerm={searchTerm}
          onSearchChange={handleSearchChange}
          selectedElements={selectedElements}
          onElementToggle={handleElementToggle}
        />
      </div>

      <CardGallery 
        cards={filteredCards} 
        loading={loading} 
        error={error}
        onCardClick={onCardClick}
        showSelection={showSelection}
        selectedCards={selectedCards}
      />
    </div>
  );
};

export default CardBrowser;
