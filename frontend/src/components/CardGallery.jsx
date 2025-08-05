import React from "react";
import UniversalImage from "./UniversalImage";

const CardGallery = ({
  cards,
  loading,
  error,
  onCardClick = null,
  showSelection = false,
  selectedCards = [],
  maxColumns = null, // Nouveau prop pour limiter le nombre de colonnes
}) => {
  if (loading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="text-white">Chargement des cartes...</div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="text-red-500">Erreur: {error}</div>
      </div>
    );
  }

  if (!cards || cards.length === 0) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="text-gray-400">Aucune carte trouvée</div>
      </div>
    );
  }

  // Déterminer les classes de grille basées sur maxColumns
  const getGridClasses = () => {
    if (maxColumns === 4) {
      return "grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 pb-4 pt-3 pl-3";
    }
    if (maxColumns === 5) {
      return "grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-6 pb-4 pt-3 pl-3";
    }
    if (maxColumns === 6) {
      return "grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-6 pb-4 pt-3 pl-3";
    }
    if (maxColumns === 7) {
      return "grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 2xl:grid-cols-7 gap-6 pb-4 pt-3 pl-3";
    }
    if (maxColumns === 8) {
      return "grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 2xl:grid-cols-7 3xl:grid-cols-8 gap-6 pb-4 pt-3 pl-3";
    }
    if (maxColumns === 9) {
      return "grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 2xl:grid-cols-7 3xl:grid-cols-8 4xl:grid-cols-9 gap-6 pb-4 pt-3 pl-3";
    }
    if (maxColumns === 10) {
      return "grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 2xl:grid-cols-7 3xl:grid-cols-8 4xl:grid-cols-9 5xl:grid-cols-10 gap-6 pb-4 pt-3 pl-3";
    }
    // Grille par défaut (utilisée pour la galerie principale)
    return "grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6 3xl:grid-cols-7 gap-10 pb-4";
  };

  return (
    <div className={getGridClasses()}>
      {cards.map((card) => {
        const isSelected =
          showSelection &&
          selectedCards.some((selectedCard) => selectedCard.id === card.id);

        return (
          <div
            key={card.id}
            className={`overflow-hidden rounded-lg shadow-lg transition-all duration-200 relative ${
              onCardClick ? "cursor-pointer hover:scale-105" : ""
            } ${isSelected ? "ring-4 ring-blue-500" : ""}`}
            onClick={() => onCardClick && onCardClick(card)}
          >
            <UniversalImage
              src={card.imageUrl}
              alt={card.name}
              className="w-full h-auto object-cover"
            />
            {isSelected && (
              <div className="absolute top-2 right-2 bg-blue-500 text-white rounded-full w-6 h-6 flex items-center justify-center text-sm font-bold">
                ✓
              </div>
            )}
          </div>
        );
      })}
    </div>
  );
};

export default CardGallery;
