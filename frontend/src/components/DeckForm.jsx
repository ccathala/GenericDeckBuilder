import React, { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { useLanguage } from "../contexts/LanguageContext";
import { useAuth } from "../contexts/AuthContext";
import deckService from "../services/deckService";
import CardBrowser from "./CardBrowser";

const DeckForm = ({ isEdit = false }) => {
  const { t } = useLanguage();
  const { isAuthenticated } = useAuth();
  const navigate = useNavigate();
  const { id } = useParams();

  // Deck metadata state
  const [deck, setDeck] = useState({
    name: "",
    description: "",
    gameId: "mage_noir", // Force le jeu à mage_noir
  });

  // Current deck cards state
  const [deckCards, setDeckCards] = useState([]);
  const [browserCards, setBrowserCards] = useState([]); // Array to store fresh card data from CardBrowser
  const [originalCardIds, setOriginalCardIds] = useState([]); // Store original deck card IDs and quantities for cross-referencing only

  // UI state
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState(null);
  const [selectedCards, setSelectedCards] = useState(new Set());

  // Helper components
  const LoadingSpinner = () => (
    <div className="min-h-screen bg-mage-bg-900 flex items-center justify-center">
      <div className="text-white">
        <div className="animate-spin w-8 h-8 border-2 border-gray-400 border-t-white rounded-full mx-auto mb-4"></div>
        {t("common.loading")}
      </div>
    </div>
  );

  const AuthRequired = () => (
    <div className="min-h-screen bg-mage-bg-900 flex items-center justify-center">
      <div className="text-center">
        <h2 className="text-2xl font-bold text-white mb-4">
          {t("auth.loginRequired")}
        </h2>
        <p className="text-gray-400">{t("decks.form.loginMessage")}</p>
      </div>
    </div>
  );

  const ErrorMessage = ({ error }) => (
    <div className="p-3 bg-red-900/50 border border-red-500 rounded-md flex-shrink-0">
      <div className="flex items-center">
        <svg
          className="w-4 h-4 text-red-400 mr-2 flex-shrink-0"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
          />
        </svg>
        <p className="text-red-400 text-sm">{error}</p>
      </div>
    </div>
  );

  // Load deck data for editing
  useEffect(() => {
    if (isEdit && id) {
      fetchDeckData();
    }
  }, [isEdit, id]);

  // Update deck cards with fresh browser card data when available (for language switching)
  useEffect(() => {
    if (browserCards.length > 0 && originalCardIds.length > 0) {
      // Cross-reference original deck card IDs with fresh browser card data
      const updatedDeckCards = originalCardIds.map((deckCard) => {
        const freshCard = browserCards.find(
          (browserCard) => browserCard.id === deckCard.id
        );
        if (freshCard) {
          // Use fresh card data with preserved quantity
          return { ...freshCard, quantity: deckCard.quantity };
        }
        // Fallback to original data if fresh card not found
        return deckCard;
      });
      setDeckCards(updatedDeckCards);
    }
  }, [browserCards, originalCardIds]);

  const fetchDeckData = async () => {
    try {
      setLoading(true);
      setError(null);

      const result = await deckService.getDeck(id);
      if (result.success) {
        const deckData = result.data;
        setDeck({
          name: deckData.name,
          description: deckData.description || "",
          gameId: "mage_noir", // Force le jeu à mage_noir même en édition
        });

        // Transform deck cards for display
        const cards =
          deckData.cards?.map((deckCard) => ({
            ...deckCard.card,
            quantity: deckCard.quantity,
          })) || [];

        setDeckCards(cards);

        // Store original card IDs and quantities for cross-referencing with fresh language data
        setOriginalCardIds(
          deckData.cards?.map((deckCard) => ({
            id: deckCard.card.id,
            quantity: deckCard.quantity,
          })) || []
        );

        // Create selected cards set for CardBrowser
        setSelectedCards(new Set(cards.map((card) => card.id)));
      } else {
        setError(result.error);
      }
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleCardSelectionChange = (
    cardId,
    isSelected,
    quantity = 1,
    cardData
  ) => {
    const newSelectedCards = new Set(selectedCards);

    if (isSelected) {
      newSelectedCards.add(cardId);
      // Add card to deck with quantity using fresh card data from CardBrowser
      setDeckCards((prev) => {
        const existing = prev.find((card) => card.id === cardId);
        if (existing) {
          return prev.map((card) =>
            card.id === cardId
              ? { ...cardData, quantity: Math.max(1, quantity) }
              : card
          );
        } else {
          // Use fresh card data from CardBrowser
          return [...prev, { ...cardData, quantity: Math.max(1, quantity) }];
        }
      });

      // Also update originalCardIds to keep cross-referencing working
      setOriginalCardIds((prev) => {
        const existing = prev.find((card) => card.id === cardId);
        if (existing) {
          return prev.map((card) =>
            card.id === cardId
              ? { ...card, quantity: Math.max(1, quantity) }
              : card
          );
        } else {
          return [...prev, { id: cardId, quantity: Math.max(1, quantity) }];
        }
      });
    } else {
      newSelectedCards.delete(cardId);
      // Remove card from deck
      setDeckCards((prev) => prev.filter((card) => card.id !== cardId));
      // Also remove from originalCardIds
      setOriginalCardIds((prev) => prev.filter((card) => card.id !== cardId));
    }

    setSelectedCards(newSelectedCards);
  };

  const updateCardQuantity = (cardId, quantity) => {
    if (quantity <= 0) {
      handleCardSelectionChange(cardId, false);
      return;
    }

    setDeckCards((prev) =>
      prev.map((card) =>
        card.id === cardId ? { ...card, quantity: Math.max(1, quantity) } : card
      )
    );

    // Also update originalCardIds to keep sync
    setOriginalCardIds((prev) =>
      prev.map((card) =>
        card.id === cardId ? { ...card, quantity: Math.max(1, quantity) } : card
      )
    );
  };

  const removeCardFromDeck = (cardId) => {
    handleCardSelectionChange(cardId, false);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!deck.name.trim()) {
      setError(t("decks.form.nameRequired"));
      return;
    }

    try {
      setSaving(true);
      setError(null);

      const deckData = {
        ...deck,
        cards: deckCards.map((card) => ({
          cardId: card.id,
          quantity: card.quantity,
        })),
      };

      const result = isEdit
        ? await deckService.updateDeck(id, deckData)
        : await deckService.createDeck(deckData);

      if (result.success) {
        navigate("/decks");
      } else {
        setError(result.error);
      }
    } catch (err) {
      setError(err.message);
    } finally {
      setSaving(false);
    }
  };

  if (!isAuthenticated) {
    return <AuthRequired />;
  }

  if (loading) {
    return <LoadingSpinner />;
  }

  const totalCards = deckCards.reduce((sum, card) => sum + card.quantity, 0);

  return (
    <div className="bg-mage-bg-900 text-white">
      <div className="w-full px-6 py-4 h-[calc(105vh-6rem)] flex flex-col">
        <div className="flex flex-col gap-4 h-full overflow-hidden">
          {/* Error Message */}
          {error && <ErrorMessage error={error} />}

          {/* Sélection de cartes (gauche 75%) + Deck actuel (droite 25%) */}
          <div className="grid grid-cols-1 lg:grid-cols-4 gap-6 flex-1 min-h-0">
            {/* Zone 3: Sélection de cartes (gauche - 3/4 = 75%) */}
            <div className="lg:col-span-3 bg-mage-dark-800 rounded-lg p-6 flex flex-col min-h-0">
              <div className="flex-1 overflow-hidden">
                <CardBrowser
                  onCardSelection={handleCardSelectionChange}
                  selectedCards={selectedCards}
                  allowMultiSelect={true}
                  gameId={deck.gameId}
                  showTitle={false}
                  className="h-full"
                  maxColumns={4}
                  onCardsLoaded={setBrowserCards}
                />
              </div>
            </div>

            {/* Zone 2: Deck actuel (droite - 1/4 = 25%) */}
            <div className="lg:col-span-1 bg-mage-dark-800 rounded-lg p-6 flex flex-col min-h-0">
              <div className="mb-4 flex-shrink-0">
                {/* Nom du deck éditable */}
                <div className="mb-3 relative">
                  <input
                    type="text"
                    value={deck.name}
                    onChange={(e) => setDeck({ ...deck, name: e.target.value })}
                    className="w-full text-xl font-semibold bg-transparent border-b-2 border-gray-600 text-white placeholder-gray-400 focus:outline-none focus:border-blue-500 transition-colors pb-1 pr-6"
                    placeholder={t("decks.form.namePlaceholder")}
                    required
                  />
                  <svg
                    className="absolute right-1 top-1 w-4 h-4 text-gray-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"
                    />
                  </svg>
                </div>

                {/* Statistiques */}
                <div className="flex justify-between text-sm text-gray-400">
                  <span>
                    {deckCards.length} {t("decks.form.uniqueCards")}
                  </span>
                  <span>
                    {totalCards} {t("decks.form.totalCards")}
                  </span>
                </div>
              </div>

              {deckCards.length === 0 ? (
                <div className="text-center py-4 flex-1 flex flex-col justify-center">
                  <div className="text-3xl mb-2">🃏</div>
                  <p className="text-gray-400 text-sm">
                    {t("decks.form.noDeckCards")}
                  </p>
                  <p className="text-gray-500 text-xs mt-1">
                    {t("decks.form.selectCardsBelow")}
                  </p>
                </div>
              ) : (
                <div className="space-y-0.5 flex-1 overflow-y-auto pr-2 scrollbar-thin scrollbar-thumb-gray-600 scrollbar-track-gray-800">
                  {deckCards.map((card) => (
                    <div
                      key={card.id}
                      className="flex items-center justify-between p-1.5 bg-mage-dark-700 rounded text-xs"
                    >
                      <div className="flex-1 min-w-0">
                        <h3 className="font-medium text-white truncate leading-tight">
                          {card.name || `${card.id}`}
                        </h3>
                      </div>
                      <div className="flex items-center space-x-0.5 ml-1.5">
                        <button
                          onClick={() =>
                            updateCardQuantity(card.id, card.quantity - 1)
                          }
                          className="w-5 h-5 bg-red-600 hover:bg-red-700 text-white rounded text-xs flex items-center justify-center transition-colors"
                        >
                          -
                        </button>
                        <span className="w-5 text-center font-semibold text-xs">
                          {card.quantity}
                        </span>
                        <button
                          onClick={() =>
                            updateCardQuantity(card.id, card.quantity + 1)
                          }
                          className="w-5 h-5 bg-green-600 hover:bg-green-700 text-white rounded text-xs flex items-center justify-center transition-colors"
                        >
                          +
                        </button>
                        <button
                          onClick={() => removeCardFromDeck(card.id)}
                          className="w-5 h-5 bg-gray-600 hover:bg-gray-700 text-white rounded text-xs flex items-center justify-center transition-colors"
                        >
                          ×
                        </button>
                      </div>
                    </div>
                  ))}
                </div>
              )}

              {/* Boutons d'action */}
              <div className="flex space-x-2 mt-3 pt-3 border-t border-gray-600">
                <button
                  type="button"
                  onClick={() => navigate("/decks")}
                  className="flex-1 bg-gray-600 hover:bg-gray-700 text-white text-xs font-medium py-1.5 px-2 rounded transition-colors duration-200"
                >
                  {t("common.cancel")}
                </button>
                <button
                  type="button"
                  onClick={handleSubmit}
                  disabled={saving || !deck.name.trim()}
                  className="flex-1 bg-blue-600 hover:bg-blue-700 disabled:bg-gray-600 disabled:cursor-not-allowed text-white text-xs font-medium py-1.5 px-2 rounded transition-colors duration-200"
                >
                  {saving
                    ? t("common.saving")
                    : isEdit
                    ? t("common.save")
                    : t("common.create")}
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default DeckForm;
