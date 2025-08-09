import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { useLanguage } from "../contexts/LanguageContext";
import DeckForm from "./DeckForm";
import DeckVisualizationView from "./DeckVisualizationView";

const DeckFormWithVisualization = ({ isEdit = false }) => {
  const { t } = useLanguage();
  const { id } = useParams();

  // État pour le mode de vue (Construction vs Visualisation)
  const [viewMode, setViewMode] = useState(() => {
    // Récupérer le mode sauvegardé pour ce deck spécifique
    return localStorage.getItem(`deckViewMode_${id}`) || "construction";
  });

  // Fonction pour basculer entre les vues
  const toggleViewMode = () => {
    setViewMode((prev) =>
      prev === "construction" ? "visualization" : "construction"
    );
  };

  // Sauvegarder le mode de vue dans localStorage
  useEffect(() => {
    if (id) {
      localStorage.setItem(`deckViewMode_${id}`, viewMode);
    }
  }, [viewMode, id]);

  return (
    <>
      {viewMode === "construction" ? (
        // VUE CONSTRUCTION (existante) - DeckForm complet et autonome
        <DeckForm
          isEdit={isEdit}
          onToggleVisualization={isEdit && id ? toggleViewMode : null}
        />
      ) : (
        // VUE VISUALISATION (nouvelle) - Layout personnalisé
        <div className="bg-mage-bg-900 text-white">
          <div className="w-full px-6 py-4 h-[calc(100vh-6rem)] flex flex-col">
            <div className="flex flex-col gap-4 h-full overflow-hidden">
              {/* Header simplifié */}
              <div className="flex-shrink-0">
                <h1 className="text-2xl font-bold text-white">
                  {isEdit
                    ? t("decks.form.editTitle")
                    : t("decks.form.createTitle")}
                </h1>
              </div>

              {/* Contenu visualisation */}
              <div className="flex-1 overflow-hidden">
                {id ? (
                  <DeckVisualizationView
                    deckId={id}
                    deckCards={[]} // Pour l'instant vide, sera géré par l'API
                    onCardUpdate={() => {}} // Callback vide pour l'instant
                    onToggleConstruction={toggleViewMode}
                  />
                ) : (
                  <div className="flex items-center justify-center h-full text-gray-400">
                    <div className="text-center">
                      <p className="text-lg mb-2">
                        {t("decks.visualization.saveFirstMessage")}
                      </p>
                      <p className="text-sm">
                        {t("decks.visualization.createDeckFirst")}
                      </p>
                    </div>
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default DeckFormWithVisualization;
