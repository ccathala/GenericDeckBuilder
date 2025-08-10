import { useState, useEffect, useCallback } from "react";
import deckVisualizationService from "../services/deckVisualizationService";

export const useDeckVisualization = (deckId) => {
  const [visualization, setVisualization] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  // Charger la visualisation du deck
  const loadVisualization = useCallback(async () => {
    if (!deckId) return;

    try {
      setLoading(true);
      setError(null);

      const result = await deckVisualizationService.getDeckVisualization(
        deckId
      );

      if (result.success) {
        setVisualization(result.data);
      } else {
        setError(result.error);
      }
    } catch (err) {
      setError(err.message || "Erreur lors du chargement de la visualisation");
    } finally {
      setLoading(false);
    }
  }, [deckId]);

  // Créer une nouvelle colonne
  const createColumn = useCallback(
    async (name = "Nouvelle colonne") => {
      if (!deckId) throw new Error("Deck ID requis");

      try {
        setError(null);

        const result = await deckVisualizationService.createColumn(deckId, {
          name,
        });

        if (result.success) {
          // Mise à jour optimiste de l'état local
          setVisualization((prev) => ({
            ...prev,
            column_groups: [...(prev?.column_groups || []), result.data],
          }));

          return result.data;
        } else {
          setError(result.error);
          throw new Error(result.error);
        }
      } catch (err) {
        setError(err.message || "Erreur lors de la création de la colonne");
        throw err;
      }
    },
    [deckId]
  );

  // Modifier une colonne existante
  const updateColumn = useCallback(
    async (columnId, updates) => {
      if (!deckId || !columnId) throw new Error("Deck ID et Column ID requis");

      try {
        setError(null);

        const result = await deckVisualizationService.updateColumn(
          deckId,
          columnId,
          updates
        );

        if (result.success) {
          // Mise à jour optimiste de l'état local
          setVisualization((prev) => ({
            ...prev,
            column_groups:
              prev?.column_groups?.map((col) =>
                col.id === columnId ? { ...col, ...updates } : col
              ) || [],
          }));

          return result.data;
        } else {
          setError(result.error);
          throw new Error(result.error);
        }
      } catch (err) {
        setError(err.message || "Erreur lors de la modification de la colonne");
        throw err;
      }
    },
    [deckId]
  );

  // Supprimer une colonne
  const deleteColumn = useCallback(
    async (columnId) => {
      if (!deckId || !columnId) throw new Error("Deck ID et Column ID requis");

      // Vérifier qu'il reste au moins une colonne
      if (visualization?.column_groups?.length <= 1) {
        const error = "Impossible de supprimer la dernière colonne";
        setError(error);
        throw new Error(error);
      }

      try {
        setError(null);

        const result = await deckVisualizationService.deleteColumn(
          deckId,
          columnId
        );

        if (result.success) {
          // Mise à jour optimiste : supprimer la colonne et recharger pour voir la redistribution des cartes
          setVisualization((prev) => ({
            ...prev,
            column_groups:
              prev?.column_groups?.filter((col) => col.id !== columnId) || [],
          }));

          // Recharger les données pour avoir la redistribution correcte des cartes
          await loadVisualization();

          return true;
        } else {
          setError(result.error);
          throw new Error(result.error);
        }
      } catch (err) {
        setError(err.message || "Erreur lors de la suppression de la colonne");
        throw err;
      }
    },
    [deckId, visualization?.column_groups?.length, loadVisualization]
  );

  // Déplacer une carte entre colonnes
  const moveCard = useCallback(
    async (cardId, sourceColumnId, targetColumnId, newPositionInPile = 0) => {
      if (!deckId || !cardId || !sourceColumnId || !targetColumnId) {
        throw new Error("Tous les paramètres sont requis pour le déplacement");
      }

      // Pas de déplacement si source = target
      if (sourceColumnId === targetColumnId) {
        return;
      }

      try {
        setError(null);

        console.log("=== DEBUG HOOK MOVE CARD ===");
        console.log("cardId reçu:", cardId);
        console.log("sourceColumnId reçu:", sourceColumnId);
        console.log("targetColumnId reçu:", targetColumnId);
        console.log("newPositionInPile reçu:", newPositionInPile);

        const result = await deckVisualizationService.moveCard(deckId, {
          cardId,
          sourceColumnId,
          targetColumnId,
          newPositionInPile,
        });

        if (result.success) {
          // Recharger les données pour avoir l'état correct après déplacement
          await loadVisualization();

          return result.data;
        } else {
          setError(result.error);
          throw new Error(result.error);
        }
      } catch (err) {
        setError(err.message || "Erreur lors du déplacement de la carte");
        throw err;
      }
    },
    [deckId, loadVisualization]
  );

  // Réorganiser l'ordre des colonnes
  const reorderColumns = useCallback(
    async (newColumnOrder) => {
      if (!deckId || !Array.isArray(newColumnOrder)) {
        throw new Error("Deck ID et ordre des colonnes requis");
      }

      try {
        setError(null);

        const result = await deckVisualizationService.reorderColumns(deckId, {
          columnOrder: newColumnOrder,
        });

        if (result.success) {
          // Recharger les données pour avoir l'ordre correct
          await loadVisualization();

          return result.data;
        } else {
          setError(result.error);
          throw new Error(result.error);
        }
      } catch (err) {
        setError(
          err.message || "Erreur lors de la réorganisation des colonnes"
        );
        throw err;
      }
    },
    [deckId, loadVisualization]
  );

  // Charger automatiquement les données au montage et changement de deckId
  useEffect(() => {
    loadVisualization();
  }, [loadVisualization]);

  return {
    // État
    visualization,
    loading,
    error,

    // Actions
    loadVisualization,
    createColumn,
    updateColumn,
    deleteColumn,
    moveCard,
    reorderColumns,
  };
};

export default useDeckVisualization;
