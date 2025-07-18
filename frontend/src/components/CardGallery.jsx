import React from "react";

const CardGallery = ({ 
  cards, 
  loading, 
  error, 
  onCardClick = null,
  showSelection = false,
  selectedCards = []
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

  return (
    <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6 3xl:grid-cols-7 gap-10">
      {cards.map((card) => {
        const isSelected = showSelection && selectedCards.some(selectedCard => selectedCard.id === card.id);
        
        return (
          <div
            key={card.id}
            className={`overflow-hidden rounded-lg shadow-lg transition-all duration-200 relative ${
              onCardClick ? 'cursor-pointer hover:scale-105' : ''
            } ${
              isSelected ? 'ring-4 ring-blue-500' : ''
            }`}
            onClick={() => onCardClick && onCardClick(card)}
          >
            <img
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
