import React from "react";

const CardGallery = ({ cards, loading, error }) => {
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
      {cards.map((card) => (
        <div key={card.id} className="overflow-hidden rounded-lg shadow-lg">
          <img
            src={card.imageUrl}
            alt={card.name}
            className="w-full h-auto object-cover"
          />
        </div>
      ))}
    </div>
  );
};

export default CardGallery;
