import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useLanguage } from "../contexts/LanguageContext";
import { useDeckVisualization } from "../hooks/useDeckVisualization";
import { Plus, Pencil, Trash2, ArrowLeft } from "lucide-react";
import NotesPanel from "./NotesPanel";

// Styles CSS pour l'affichage des images de cartes
const cardImageStyles = `
  .deck-card-image {
    position: relative;
    width: 100%;
    margin-bottom: -95%;
    cursor: grab;
    transition: transform 0.2s ease;
    z-index: 1;
  }

  .deck-card-image:first-child {
    margin-bottom: -95%;
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
    height: auto;
    object-fit: contain;
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

  .drop-indicator {
    height: 4px;
    background: linear-gradient(90deg, #8B5CF6, #A855F7);
    border-radius: 2px;
    margin: 2px 0;
    box-shadow: 0 0 8px rgba(139, 92, 246, 0.6);
    animation: pulse 1s infinite;
    position: relative;
    z-index: 1000;
    width: 100%;
  }

  .drop-indicator-container {
    position: relative;
    width: 100%;
    z-index: 1000;
    margin: 0;
    height: 4px;
    pointer-events: none;
  }

  @keyframes pulse {
    0%, 100% { opacity: 0.8; }
    50% { opacity: 1; }
  }
`;

const DeckVisualizationView = ({ deckId, deckCards, onCardUpdate }) => {
  const { t } = useLanguage();
  const navigate = useNavigate();
  // États pour gestion image au survol
  const [hoveredCard, setHoveredCard] = useState(null);
  const [imageErrors, setImageErrors] = useState(new Set());
  const [hoveredCardPosition, setHoveredCardPosition] = useState({
    top: 0,
    left: 0,
  });
  const {
    visualization,
    loading,
    error,
    createColumn,
    updateColumn,
    deleteColumn,
    moveCard,
    reorderColumns,
    clearError,
  } = useDeckVisualization(deckId);

  // État local pour le drag & drop
  const [draggedCard, setDraggedCard] = useState(null);
  const [dropIndicator, setDropIndicator] = useState(null); // { columnId, position }
  const [showCreateColumnModal, setShowCreateColumnModal] = useState(false);
  const [newColumnName, setNewColumnName] = useState("");
  const [createColumnError, setCreateColumnError] = useState(null); // Erreur spécifique au modal

  // Gestion de la création de colonne
  const handleCreateColumn = async () => {
    setCreateColumnError(null); // Clear l'erreur avant de tenter

    const columnName =
      newColumnName.trim() || t("decks.visualization.newColumnName");
    const result = await createColumn(columnName);

    if (result.success) {
      // Succès : Reset du formulaire et fermeture du modal
      setNewColumnName("");
      setShowCreateColumnModal(false);
      setCreateColumnError(null);
    } else {
      // Erreur : Afficher l'erreur dans le modal sans le fermer
      setCreateColumnError(result.error);
    }
  };

  // Gestion du drag & drop (version simplifiée pour l'instant)
  const handleDragStart = (e, card, sourceColumnId) => {
    console.log("🎯 Drag start - Card ID:", card.id);

    setDraggedCard({
      card,
      sourceColumnId,
    });

    e.dataTransfer.effectAllowed = "move";
  };

  // Gestion des erreurs d'image
  // Gestion d'erreur de chargement d'image
  const handleImageError = (cardId) => {
    setImageErrors((prev) => new Set([...prev, cardId]));
  };

  // Calcul position dynamique pour éviter débordement
  const calculateImagePosition = (cardElement) => {
    if (!cardElement) return { top: 0, left: 0 };

    const rect = cardElement.getBoundingClientRect();
    const imageHeight = 420; // Hauteur approximative de l'image agrandie
    const imageWidth = 288; // Largeur de l'image (w-72 = 18rem = 288px)
    const viewportTop = 0;
    const margin = 16; // Marge entre l'image et la carte

    // Position de base : à gauche de la carte
    let left = rect.left - imageWidth - margin;
    let top = rect.top;

    // Si l'image déborde à gauche, la positionner à droite
    if (left < 0) {
      left = rect.right + margin;
    }

    // Si l'image déborde en haut, l'ajuster vers le bas
    if (top < viewportTop) {
      top = Math.max(viewportTop + margin, rect.bottom - imageHeight);
    }

    // Si l'image déborde en bas, l'ajuster vers le haut
    const viewportBottom = window.innerHeight;
    if (top + imageHeight > viewportBottom) {
      top = Math.max(
        viewportTop + margin,
        viewportBottom - imageHeight - margin
      );
    }

    return { top, left };
  };

  // Obtenir URL d'image avec fallback
  const getCardImageUrl = (card) => {
    if (imageErrors.has(card.id) || !card.imageUrl) {
      return "/images/card-placeholder.png";
    }
    return card.imageUrl;
  };

  // Gestion du drag pour les images
  const handleDrag = (e) => {
    e.target.style.opacity = "0.5";
  };

  const handleDragEnd = (e) => {
    e.target.style.opacity = "1";
    setDraggedCard(null);
    setDropIndicator(null); // Ajouter ici pour nettoyer l'indicateur
  };

  const handleDragOver = (e) => {
    e.preventDefault();
    e.dataTransfer.dropEffect = "move";

    // Calculer et afficher l'indicateur en temps réel pendant le drag
    if (draggedCard) {
      const targetColumnId =
        e.currentTarget.getAttribute("data-column-id") ||
        e.currentTarget
          .closest("[data-column-id]")
          ?.getAttribute("data-column-id");
      if (targetColumnId) {
        calculateDropPosition(e, targetColumnId);
      }
    }
  };

  const handleDragLeave = (e) => {
    // Masquer l'indicateur seulement si on sort vraiment de la colonne
    // et qu'on ne va pas vers un élément enfant
    const currentTarget = e.currentTarget;
    const relatedTarget = e.relatedTarget;

    // Si relatedTarget est null (on sort de la fenêtre) ou
    // si relatedTarget n'est pas un enfant de currentTarget
    if (!relatedTarget || !currentTarget.contains(relatedTarget)) {
      setDropIndicator(null);
    }
  };

  const handleDrop = async (e, targetColumnId) => {
    e.preventDefault();
    setDropIndicator(null); // Masquer l'indicateur après le drop

    console.log("=== DEBUG HANDLE DROP ===");
    console.log("draggedCard:", draggedCard);
    console.log("targetColumnId:", targetColumnId);

    if (!draggedCard) {
      console.log("Pas de carte déplacée, abandon");
      setDraggedCard(null);
      setDropIndicator(null);
      return;
    }

    try {
      console.log("=== DEBUG AVANT APPEL MOVE CARD ===");
      console.log("cardId:", draggedCard.card.id);
      console.log("sourceColumnId:", draggedCard.sourceColumnId);
      console.log("targetColumnId:", targetColumnId);

      // Calculer la position d'insertion basée sur la position du drop
      const dropPosition = calculateDropPosition(e, targetColumnId);
      console.log("Position calculée pour le drop:", dropPosition);

      // Vérifier si c'est un déplacement dans la même colonne
      if (draggedCard.sourceColumnId === targetColumnId) {
        const sourceColumn = visualization?.column_groups?.find(
          (col) => col.id === draggedCard.sourceColumnId
        );

        // CORRECTION : utiliser l'ID du DeckCard (pas card.card.id)
        const draggedCardDeckId = draggedCard.card.id; // ID du DeckCard
        const currentPosition = sourceColumn?.cards?.findIndex(
          (deckCard) => deckCard.id === draggedCardDeckId
        );

        console.log("DEBUG - draggedCard structure:", draggedCard.card);
        console.log("DEBUG - draggedCardDeckId:", draggedCardDeckId);
        console.log(
          "DEBUG - sourceColumn.cards[0] structure:",
          sourceColumn?.cards?.[0]
        );
        console.log("DEBUG - currentPosition:", currentPosition);
        console.log("DEBUG - dropPosition:", dropPosition);

        if (currentPosition === -1) {
          console.error("❌ Carte non trouvée dans la colonne source");
          setDraggedCard(null);
          setDropIndicator(null);
          return;
        }

        if (currentPosition === dropPosition) {
          console.log(
            "Même position dans la même colonne, pas de déplacement nécessaire"
          );
          setDraggedCard(null);
          setDropIndicator(null);
          return;
        }
        console.log(
          `Réorganisation dans la même colonne: ${currentPosition} → ${dropPosition}`
        );

        // ✅ CORRECTION : Appeler moveCard() aussi pour les déplacements intra-colonne
        console.log("🔄 Appel API moveCard pour intra-colonne...");
        await moveCard(
          draggedCard.card.id,
          draggedCard.sourceColumnId,
          targetColumnId,
          dropPosition
        );
        console.log("✅ Réorganisation intra-colonne réussie");
      } else {
        // Déplacement inter-colonne
        console.log("🔄 Déplacement inter-colonne, appel API moveCard...");
        await moveCard(
          draggedCard.card.id,
          draggedCard.sourceColumnId,
          targetColumnId,
          dropPosition
        );
        console.log("✅ Déplacement inter-colonne réussi");
      }
    } catch (err) {
      console.error("❌ Erreur lors du déplacement:", err);
    } finally {
      setDraggedCard(null);
      setDropIndicator(null); // S'assurer que l'indicateur disparaît toujours
    }
  };

  // Calculer la position d'insertion dans la pile (version simplifiée)
  const calculateDropPosition = (dropEvent, targetColumnId) => {
    const dropY = dropEvent.clientY;

    console.log("=== DEBUG CALCULATE DROP POSITION (SIMPLIFIÉ) ===");
    console.log("dropY:", dropY);
    console.log("targetColumnId:", targetColumnId);

    // Trouver la colonne cible
    const targetColumn = visualization?.column_groups?.find(
      (col) => col.id === targetColumnId
    );

    if (
      !targetColumn ||
      !targetColumn.cards ||
      targetColumn.cards.length === 0
    ) {
      console.log("Colonne vide, position = 0");
      return 0;
    }

    console.log(
      "Nombre de cartes dans la colonne cible:",
      targetColumn.cards.length
    );

    // Obtenir l'élément de la colonne
    const columnElement = dropEvent.currentTarget;
    const cardsContainer = columnElement.querySelector(".cards-container");

    if (!cardsContainer) {
      console.log("Container non trouvé, position = 0");
      return 0;
    }

    // Obtenir les dimensions du conteneur
    const containerRect = cardsContainer.getBoundingClientRect();
    const relativeY = dropY - containerRect.top;
    const containerHeight = containerRect.height;

    console.log("containerRect.top:", containerRect.top);
    console.log("containerHeight:", containerHeight);
    console.log("relativeY:", relativeY);

    // Diviser la zone en segments égaux selon le nombre de cartes + 1
    // +1 car on peut insérer avant la première carte, entre les cartes, ou après la dernière
    const numberOfSegments = targetColumn.cards.length + 1;
    const segmentHeight = containerHeight / numberOfSegments;

    console.log("numberOfSegments:", numberOfSegments);
    console.log("segmentHeight:", segmentHeight);

    // Calculer dans quel segment le drop a eu lieu
    const segmentIndex = Math.floor(relativeY / segmentHeight);
    const insertPosition = Math.max(
      0,
      Math.min(segmentIndex, targetColumn.cards.length)
    );

    console.log("segmentIndex calculé:", segmentIndex);
    console.log(
      "Position finale (simplifiée):",
      insertPosition,
      "/",
      targetColumn.cards.length
    );

    // Mettre à jour l'indicateur visuel
    setDropIndicator({
      columnId: targetColumnId,
      position: insertPosition,
    });

    return insertPosition;
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
        <div className="flex items-center gap-3">
          <button
            onClick={() => navigate("/decks")}
            className="p-2 bg-gray-600 hover:bg-gray-700 text-white rounded-lg transition-colors"
            title={t("common.back")}
          >
            <ArrowLeft size={20} />
          </button>
          <h1 className="text-2xl font-bold text-white">
            {visualization?.deck_name || t("decks.visualization.title")}
          </h1>
        </div>
        <div className="flex gap-3">
          <button
            onClick={() => {
              setShowCreateColumnModal(true);
              setCreateColumnError(null); // Clear l'erreur du modal quand on l'ouvre
              clearError(); // Clear l'erreur globale aussi
            }}
            className="bg-green-600 hover:bg-green-700 text-white px-3 py-2 rounded-lg flex items-center gap-2 transition-colors"
          >
            <Plus size={16} />
            {t("decks.visualization.addColumn")}
          </button>
          <button
            onClick={() => navigate(`/decks/${deckId}/edit`)}
            className="bg-blue-600 hover:bg-blue-700 text-white px-3 py-2 rounded-lg flex items-center gap-2 transition-colors"
            title={t("decks.visualization.viewConstruction")}
          >
            <Pencil size={16} />
            {t("decks.visualization.viewConstruction")}
          </button>
        </div>
      </div>

      {/* Zone principale avec colonnes + panneau notes */}
      <div className="flex-1 flex min-h-0">
        {/* Zone des colonnes (flex-1 pour prendre l'espace restant) */}
        <div className="flex-1 flex gap-0 min-h-0 overflow-x-auto">
          <div className="flex gap-0 min-h-full">
            {visualization?.column_groups?.map((column, index) => (
              <DeckColumn
                key={column.id}
                column={column}
                onUpdateColumn={updateColumn}
                onDeleteColumn={deleteColumn}
                canDelete={visualization.column_groups.length > 1}
                onDragStart={handleDragStart}
                onDragOver={handleDragOver}
                onDragLeave={handleDragLeave}
                onDrop={handleDrop}
                draggedCard={draggedCard}
                handleDrag={handleDrag}
                handleDragEnd={handleDragEnd}
                handleImageError={handleImageError}
                dropIndicator={dropIndicator}
                isLastColumn={index === visualization.column_groups.length - 1}
                hoveredCard={hoveredCard}
                setHoveredCard={setHoveredCard}
                calculateImagePosition={calculateImagePosition}
                setHoveredCardPosition={setHoveredCardPosition}
              />
            ))}
          </div>

          {/* Message si aucune colonne */}
          {(!visualization?.column_groups ||
            visualization.column_groups.length === 0) && (
            <div className="flex-1 flex items-center justify-center text-gray-400">
              <p>Aucune colonne trouvée</p>
            </div>
          )}
        </div>

        {/* Panneau notes fixe à droite */}
        <NotesPanel deckId={deckId} />
      </div>

      {/* Modal de création de colonne */}
      {showCreateColumnModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-mage-dark-800 rounded-lg p-6 w-96 max-w-full mx-4">
            <h3 className="text-lg font-semibold text-white mb-4">
              {t("decks.visualization.addColumn")}
            </h3>

            {/* Affichage de l'erreur du modal */}
            {createColumnError && (
              <div className="bg-red-600 text-white p-3 rounded mb-4 text-sm">
                {createColumnError}
              </div>
            )}

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  {t("decks.visualization.columnName")}
                </label>
                <input
                  type="text"
                  value={newColumnName}
                  onChange={(e) => {
                    setNewColumnName(e.target.value);
                    if (createColumnError) setCreateColumnError(null); // Clear l'erreur du modal quand l'utilisateur tape
                  }}
                  placeholder={t("decks.visualization.newColumnName")}
                  className="w-full px-3 py-2 bg-mage-dark-700 border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:border-blue-500 focus:outline-none"
                />
              </div>
            </div>

            <div className="flex justify-end space-x-3 mt-6">
              <button
                onClick={() => {
                  setShowCreateColumnModal(false);
                  setNewColumnName("");
                  setCreateColumnError(null); // Clear l'erreur du modal
                  clearError(); // Clear l'erreur globale aussi
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
    {/* Aperçu d'image au survol */}
    {hoveredCard && (
      <div
        className="fixed z-[9999] pointer-events-none transition-opacity duration-200"
        style={{
          left: `${hoveredCardPosition.left}px`,
          top: `${hoveredCardPosition.top}px`,
        }}
      >
        <img
          src={getCardImageUrl(hoveredCard)}
          alt={hoveredCard.name}
          className="w-72 h-auto rounded-lg shadow-2xl bg-gray-800"
        />
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
  onDragLeave,
  draggedCard,
  handleDrag,
  handleDragEnd,
  handleImageError,
  dropIndicator,
  isLastColumn = false,
  hoveredCard,
  setHoveredCard,
  calculateImagePosition,
  setHoveredCardPosition,
}) => {
  const { t } = useLanguage();
  const [isEditing, setIsEditing] = useState(false);
  const [editName, setEditName] = useState(column.name);

  const handleSave = async () => {
    try {
      await onUpdateColumn(column.id, {
        name: editName,
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
      className="deck-column w-[260px] min-w-[260px] max-w-[260px] bg-transparent flex flex-col border-r border-gray-600"
      data-column-id={column.id}
      onDragOver={onDragOver}
      onDragLeave={onDragLeave}
      onDrop={(e) => onDrop(e, column.id)}
    >
      {/* Header de colonne */}
      <div className="p-3">
        {/* Header transparent */}
        {isEditing ? (
          <div className="space-y-3">
            <input
              type="text"
              value={editName}
              onChange={(e) => setEditName(e.target.value)}
              className="w-full px-2 py-1 bg-mage-dark-700 border border-gray-600 rounded text-white text-sm"
            />
            <div className="flex justify-end space-x-2">
              <button
                onClick={() => {
                  setIsEditing(false);
                  setEditName(column.name);
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
                className="p-1.5 bg-blue-600 hover:bg-blue-700 text-white rounded transition-colors"
                title={t("columns.edit")}
              >
                <Pencil size={14} />
              </button>
              {canDelete && (
                <button
                  onClick={handleDelete}
                  className="p-1.5 bg-red-600 hover:bg-red-700 text-white rounded transition-colors"
                  title={t("columns.delete")}
                >
                  <Trash2 size={14} />
                </button>
              )}
            </div>
          </div>
        )}
      </div>

      {/* Corps de colonne avec cartes */}
      <div
        className="cards-container flex-1 p-3 overflow-y-auto min-h-40"
        style={{ paddingTop: "12px", position: "relative" }}
      >
        {column.cards?.length === 0 ? (
          <>
            {/* Indicateur pour colonne vide */}
            {dropIndicator && dropIndicator.columnId === column.id && (
              <div className="drop-indicator-container">
                <div className="drop-indicator"></div>
              </div>
            )}
            <div className="text-center text-gray-400 text-sm py-8">
              {t("decks.visualization.dropCardsHere")}
            </div>
          </>
        ) : (
          <>
            {column.cards?.map((card, index) => (
              <React.Fragment key={`${card.card.id}-${index}`}>
                {/* Indicateur de drop AVANT cette carte */}
                {dropIndicator &&
                  dropIndicator.columnId === column.id &&
                  dropIndicator.position === index && (
                    <div className="drop-indicator-container">
                      <div className="drop-indicator"></div>
                    </div>
                  )}

                <div
                  className="deck-card-image"
                  style={{ zIndex: index + 1 }}
                  draggable
                  onDragStart={(e) => onDragStart(e, card, column.id)}
                  onDrag={handleDrag}
                  onDragEnd={handleDragEnd}
                  onMouseEnter={(e) => {
                    setHoveredCard(card.card);
                    const position = calculateImagePosition(e.currentTarget);
                    setHoveredCardPosition(position);
                  }}
                  onMouseLeave={() => setHoveredCard(null)}
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
              </React.Fragment>
            ))}

            {/* Indicateur de drop APRÈS la dernière carte */}
            {dropIndicator &&
              dropIndicator.columnId === column.id &&
              dropIndicator.position === column.cards.length && (
                <div className="drop-indicator-container">
                  <div className="drop-indicator"></div>
                </div>
              )}
          </>
        )}
      </div>
    </div>
  );
};

export default DeckVisualizationView;
