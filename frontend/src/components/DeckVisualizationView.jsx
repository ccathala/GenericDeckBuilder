import React, { useState } from "react";
import { useLanguage } from "../contexts/LanguageContext";
import { useDeckVisualization } from "../hooks/useDeckVisualization";
import { Plus } from "lucide-react";

// Styles CSS pour l'affichage des images de cartes
const cardImageStyles = `
  .deck-card-image {
    position: relative;
    width: 100%;
    aspect-ratio: 5/7;
    margin-bottom: -90%;
    cursor: grab;
    transition: transform 0.2s ease;
    z-index: 1;
  }

  .deck-card-image:first-child {
    margin-bottom: -90%;
  }

  .deck-card-image:last-child {
    margin-bottom: 8px;
  }

  .deck-card-image:hover {
    transform: scale(1.02) translateY(-10px);
    z-index: 10;
  }

  .deck-card-image:active {
    cursor: grabbing;
  }

  .card-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4), 0 2px 4px rgba(0, 0, 0, 0.2);
    border: 2px solid transparent;
    transition: border-color 0.2s ease, box-shadow 0.2s ease;
    display: block;
  }

  .card-image:hover {
    border-color: #8B5CF6;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6), 0 4px 8px rgba(0, 0, 0, 0.4);
  }

  .quantity-badge {
    position: absolute;
    top: 1%;
    right: 1%;
    background: rgba(0, 0, 0, 0.8);
    color: white;
    border-radius: 50%;
    width: 12%;
    aspect-ratio: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: clamp(10px, 2.5vw, 16px);
    font-weight: bold;
    border: 2px solid white;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
  }

  .deck-column {
    flex: 1;
    min-width: 120px;
    max-width: none;
  }
`;

const DeckVisualizationView = ({ deckId, deckCards, onCardUpdate, onToggleConstruction }) => {
  const { t } = useLanguage();
  const {
    visualization,
    loading,
    error,
    createColumn,
    updateColumn,
    deleteColumn,
    moveCard,
    reorderColumns,
  } = useDeckVisualization(deckId);

  // État local pour le drag & drop
  const [draggedCard, setDraggedCard] = useState(null);
  const [showCreateColumnModal, setShowCreateColumnModal] = useState(false);
  const [newColumnName, setNewColumnName] = useState("");
  const [newColumnColor, setNewColumnColor] = useState("#6B7280");

  // Gestion de la création de colonne
  const handleCreateColumn = async () => {
    try {
      const columnName =
        newColumnName.trim() || t("decks.visualization.newColumnName");
      await createColumn(columnName, newColumnColor);

      // Reset du formulaire
      setNewColumnName("");
      setNewColumnColor("#6B7280");
      setShowCreateColumnModal(false);
    } catch (err) {
      console.error("Erreur lors de la création de la colonne:", err);
    }
  };

  // Gestion du drag & drop (version simplifiée pour l'instant)
  const handleDragStart = (e, card, sourceColumnId) => {
    setDraggedCard({
      card,
      sourceColumnId,
    });
    e.dataTransfer.effectAllowed = "move";
  };

  // Gestion des erreurs d'image
  const handleImageError = (e) => {
    e.target.src = '/images/card-placeholder.png';
    e.target.alt = `Image non disponible pour ${e.target.alt}`;
  };

  // Gestion du drag pour les images
  const handleDrag = (e) => {
    e.target.style.opacity = '0.5';
  };

  const handleDragEnd = (e) => {
    e.target.style.opacity = '1';
    setDraggedCard(null);
  };

  const handleDragOver = (e) => {
    e.preventDefault();
    e.dataTransfer.dropEffect = "move";
  };

  const handleDrop = async (e, targetColumnId) => {
    e.preventDefault();

    if (!draggedCard || draggedCard.sourceColumnId === targetColumnId) {
      setDraggedCard(null);
      return;
    }

    try {
      await moveCard(
        draggedCard.card.cardId,
        draggedCard.sourceColumnId,
        targetColumnId,
        0 // Position en bas de pile par défaut
      );
    } catch (err) {
      console.error("Erreur lors du déplacement:", err);
    } finally {
      setDraggedCard(null);
    }
  };

  // Rendu du loading
  if (loading) {
    return (
      <div className="h-full flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-white mx-auto mb-4"></div>
          <p className="text-gray-300">{t("common.loading")}</p>
        </div>
      </div>
    );
  }

  // Rendu des erreurs
  if (error) {
    return (
      <div className="h-full flex items-center justify-center">
        <div className="text-center text-red-400">
          <p className="text-lg font-semibold mb-2">{t("common.error")}</p>
          <p className="text-sm">{error}</p>
        </div>
      </div>
    );
  }

  return (
    <div className="h-full flex flex-col">
      <style>{cardImageStyles}</style>
      
      {/* Header avec titre et boutons */}
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-2xl font-bold text-white">
          {visualization?.deck_name || t("decks.visualization.title")}
        </h1>
        <div className="flex gap-3">
          <button
            onClick={() => setShowCreateColumnModal(true)}
            className="bg-green-600 hover:bg-green-700 text-white px-3 py-2 rounded-lg flex items-center gap-2 transition-colors"
          >
            <Plus size={16} />
            {t("decks.visualization.addColumn")}
          </button>
          {onToggleConstruction && (
            <button
              onClick={onToggleConstruction}
              className="bg-purple-600 hover:bg-purple-700 text-white px-3 py-2 rounded-lg flex items-center gap-2 transition-colors"
            >
              {t("decks.visualization.toggleConstruction")}
            </button>
          )}
        </div>
      </div>

      {/* Zone des colonnes */}
      <div className="flex-1 flex gap-3 min-h-0">
        {visualization?.column_groups?.map((column) => (
          <DeckColumn
            key={column.id}
            column={column}
            onUpdateColumn={updateColumn}
            onDeleteColumn={deleteColumn}
            canDelete={visualization.column_groups.length > 1}
            onDragStart={handleDragStart}
            onDragOver={handleDragOver}
            onDrop={handleDrop}
            draggedCard={draggedCard}
            handleDrag={handleDrag}
            handleDragEnd={handleDragEnd}
            handleImageError={handleImageError}
          />
        ))}

        {/* Message si aucune colonne */}
        {(!visualization?.column_groups ||
          visualization.column_groups.length === 0) && (
          <div className="flex-1 flex items-center justify-center text-gray-400">
            <p>Aucune colonne trouvée</p>
          </div>
        )}
      </div>

      {/* Modal de création de colonne */}
      {showCreateColumnModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-mage-dark-800 rounded-lg p-6 w-96 max-w-full mx-4">
            <h3 className="text-lg font-semibold text-white mb-4">
              {t("decks.visualization.addColumn")}
            </h3>

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  {t("decks.visualization.columnName")}
                </label>
                <input
                  type="text"
                  value={newColumnName}
                  onChange={(e) => setNewColumnName(e.target.value)}
                  placeholder={t("decks.visualization.newColumnName")}
                  className="w-full px-3 py-2 bg-mage-dark-700 border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:border-blue-500 focus:outline-none"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  {t("decks.visualization.columnColor")}
                </label>
                <input
                  type="color"
                  value={newColumnColor}
                  onChange={(e) => setNewColumnColor(e.target.value)}
                  className="w-full h-10 bg-mage-dark-700 border border-gray-600 rounded-lg"
                />
              </div>
            </div>

            <div className="flex justify-end space-x-3 mt-6">
              <button
                onClick={() => {
                  setShowCreateColumnModal(false);
                  setNewColumnName("");
                  setNewColumnColor("#6B7280");
                }}
                className="px-4 py-2 text-gray-300 hover:text-white transition-colors"
              >
                {t("common.cancel")}
              </button>
              <button
                onClick={handleCreateColumn}
                className="px-4 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg transition-colors"
              >
                {t("decks.visualization.createColumn")}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

// Composant de colonne temporaire (sera créé dans un fichier séparé plus tard)
const DeckColumn = ({
  column,
  onUpdateColumn,
  onDeleteColumn,
  canDelete,
  onDragStart,
  onDragOver,
  onDrop,
  draggedCard,
  handleDrag,
  handleDragEnd,
  handleImageError,
}) => {
  const { t } = useLanguage();
  const [isEditing, setIsEditing] = useState(false);
  const [editName, setEditName] = useState(column.name);
  // Correction du mapping : color_hex de l'API -> colorHex pour le composant
  const [editColor, setEditColor] = useState(
    column.color_hex || column.colorHex || "#6B7280"
  );

  const handleSave = async () => {
    try {
      await onUpdateColumn(column.id, {
        name: editName,
        color: editColor,
      });
      setIsEditing(false);
    } catch (err) {
      console.error("Erreur lors de la modification:", err);
    }
  };

  const handleDelete = async () => {
    if (!canDelete) {
      alert(t("decks.visualization.cannotDeleteLastColumn"));
      return;
    }

    if (
      confirm(
        t("decks.visualization.confirmDeleteColumn", { name: column.name })
      )
    ) {
      try {
        await onDeleteColumn(column.id);
      } catch (err) {
        console.error("Erreur lors de la suppression:", err);
      }
    }
  };

  return (
    <div
      className="deck-column flex-1 min-w-[120px] bg-mage-dark-800 rounded-lg flex flex-col"
      onDragOver={onDragOver}
      onDrop={(e) => onDrop(e, column.id)}
      style={{
        borderTop: `4px solid ${
          column.color_hex || column.colorHex || "#6B7280"
        }`,
      }}
    >
      {/* Header de colonne */}
      <div className="p-3 border-b border-mage-dark-600">
        {isEditing ? (
          <div className="space-y-3">
            <input
              type="text"
              value={editName}
              onChange={(e) => setEditName(e.target.value)}
              className="w-full px-2 py-1 bg-mage-dark-700 border border-gray-600 rounded text-white text-sm"
            />
            <input
              type="color"
              value={editColor}
              onChange={(e) => setEditColor(e.target.value)}
              className="w-full h-8 bg-mage-dark-700 border border-gray-600 rounded"
            />
            <div className="flex justify-end space-x-2">
              <button
                onClick={() => {
                  setIsEditing(false);
                  setEditName(column.name);
                  setEditColor(
                    column.color_hex || column.colorHex || "#6B7280"
                  );
                }}
                className="px-2 py-1 text-xs text-gray-300 hover:text-white"
              >
                {t("common.cancel")}
              </button>
              <button
                onClick={handleSave}
                className="px-2 py-1 text-xs bg-blue-600 hover:bg-blue-700 text-white rounded"
              >
                {t("common.save")}
              </button>
            </div>
          </div>
        ) : (
          <div className="flex items-center justify-between">
            <div>
              <h3 className="font-medium text-white">{column.name}</h3>
              <p className="text-xs text-gray-400">
                {t("decks.visualization.totalCards", {
                  count: column.cards?.length || 0,
                })}
              </p>
            </div>
            <div className="flex space-x-1">
              <button
                onClick={() => setIsEditing(true)}
                className="p-1 text-gray-400 hover:text-white"
              >
                ✏️
              </button>
              {canDelete && (
                <button
                  onClick={handleDelete}
                  className="p-1 text-gray-400 hover:text-red-400"
                >
                  🗑️
                </button>
              )}
            </div>
          </div>
        )}
      </div>

      {/* Corps de colonne avec cartes */}
      <div className="flex-1 p-3 overflow-y-auto min-h-40" style={{ paddingTop: '12px' }}>
        {column.cards?.length === 0 ? (
          <div className="text-center text-gray-400 text-sm py-8">
            {t("decks.visualization.dropCardsHere")}
          </div>
        ) : (
          column.cards?.map((card, index) => (
            <div
              key={`${card.card.id}-${index}`}
              className="deck-card-image"
              style={{ zIndex: index + 1 }}
              draggable
              onDragStart={(e) => onDragStart(e, card, column.id)}
              onDrag={handleDrag}
              onDragEnd={handleDragEnd}
            >
              <img 
                src={card.card.imageUrl} 
                alt={card.card.name}
                className="card-image"
                onError={handleImageError}
              />
              {card.quantity > 1 && (
                <span className="quantity-badge">{card.quantity}</span>
              )}
            </div>
          ))
        )}
      </div>
    </div>
  );
};

export default DeckVisualizationView;
