import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { useLanguage } from "../contexts/LanguageContext";
import { useAuth } from "../contexts/AuthContext";
import deckService from "../services/deckService";
import DeckImportModal from "../components/DeckImportModal";

const DecksPage = () => {
  const { t } = useLanguage();
  const { isAuthenticated } = useAuth();
  const [decks, setDecks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [isImportModalOpen, setIsImportModalOpen] = useState(false);

  useEffect(() => {
    if (isAuthenticated) {
      fetchDecks();
    }
  }, [isAuthenticated]);

  const fetchDecks = async () => {
    try {
      setLoading(true);
      setError(null);

      const result = await deckService.getAllDecks();
      if (result.success) {
        setDecks(result.data);
      } else {
        setError(result.error);
      }
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleImportSuccess = (importedDeck) => {
    setDecks((prevDecks) => [importedDeck, ...prevDecks]);
    // Vous pouvez ajouter un message de succès ici si nécessaire
  };

  const handleDeleteDeck = async (deckId) => {
    if (!window.confirm(t("decks.confirmDelete"))) {
      return;
    }

    try {
      const result = await deckService.deleteDeck(deckId);
      if (result.success) {
        setDecks(decks.filter((deck) => deck.id !== deckId));
      } else {
        setError(result.error);
      }
    } catch (err) {
      setError(err.message);
    }
  };

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-mage-bg-900 flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-white mb-4">
            {t("auth.loginRequired")}
          </h2>
          <p className="text-gray-400 mb-6">{t("decks.loginMessage")}</p>
          <Link
            to="/login"
            className="bg-mage-dark-600 hover:bg-mage-dark-500 text-white font-medium py-2 px-4 rounded-md transition-colors duration-200"
          >
            {t("nav.login")}
          </Link>
        </div>
      </div>
    );
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-mage-bg-900 flex items-center justify-center">
        <div className="text-white">
          <div className="animate-spin w-8 h-8 border-2 border-gray-400 border-t-white rounded-full mx-auto mb-4"></div>
          {t("common.loading")}
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-mage-bg-900 text-white">
      <div className="max-w-7xl mx-auto px-4 py-8">
        {/* Header */}
        <div className="flex justify-between items-center mb-8">
          <div>
            <h1 className="text-3xl font-bold mb-2">{t("decks.title")}</h1>
            <p className="text-gray-400">{t("decks.subtitle")}</p>
          </div>
          <div className="flex space-x-3">
            <button
              onClick={() => setIsImportModalOpen(true)}
              className="bg-green-600 hover:bg-green-700 text-white font-medium py-3 px-6 rounded-md transition-colors duration-200 flex items-center"
            >
              <svg
                className="w-5 h-5 mr-2"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M9 19l3 3m0 0l3-3m-3 3V10"
                />
              </svg>
              {t("decks.importDeck")}
            </button>
            <Link
              to="/decks/new"
              className="bg-mage-dark-600 hover:bg-mage-dark-500 text-white font-medium py-3 px-6 rounded-md transition-colors duration-200 flex items-center"
            >
              <svg
                className="w-5 h-5 mr-2"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M12 4v16m8-8H4"
                />
              </svg>
              {t("decks.createNew")}
            </Link>
          </div>
        </div>

        {/* Error Message */}
        {error && (
          <div className="mb-6 p-4 bg-red-900/50 border border-red-500 rounded-md">
            <div className="flex items-center">
              <svg
                className="w-5 h-5 text-red-400 mr-2"
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
        )}

        {/* Decks Grid */}
        {decks.length === 0 ? (
          <div className="text-center py-12">
            <div className="text-6xl mb-4">🎴</div>
            <h3 className="text-xl font-semibold mb-2">{t("decks.noDecks")}</h3>
            <p className="text-gray-400 mb-6">{t("decks.noDecksMessage")}</p>
            <Link
              to="/decks/new"
              className="bg-mage-dark-600 hover:bg-mage-dark-500 text-white font-medium py-3 px-6 rounded-md transition-colors duration-200"
            >
              {t("decks.createFirst")}
            </Link>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {decks.map((deck) => (
              <DeckCard
                key={deck.id}
                deck={deck}
                onDelete={() => handleDeleteDeck(deck.id)}
              />
            ))}
          </div>
        )}
      </div>

      {/* Modal d'importation */}
      <DeckImportModal
        isOpen={isImportModalOpen}
        onClose={() => setIsImportModalOpen(false)}
        onSuccess={handleImportSuccess}
      />
    </div>
  );
};

const DeckCard = ({ deck, onDelete }) => {
  const { t } = useLanguage();

  return (
    <div className="bg-mage-dark-800 rounded-lg p-6 hover:bg-mage-dark-700 transition-colors duration-200">
      <div className="flex justify-between items-start mb-4">
        <div className="flex-1">
          <h3 className="text-lg font-semibold text-white mb-2">{deck.name}</h3>
          <p className="text-gray-400 text-sm mb-2">
            {deck.description || t("decks.noDescription")}
          </p>
          <div className="flex items-center text-sm text-gray-500">
            <svg
              className="w-4 h-4 mr-1"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
              />
            </svg>
            {deck.cards?.length || 0} {t("decks.cardsCount")}
          </div>
        </div>
        <div className="relative">
          <button className="text-gray-400 hover:text-white">
            <svg
              className="w-5 h-5"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"
              />
            </svg>
          </button>
        </div>
      </div>

      <div className="flex space-x-2">
        <span className="flex-1 bg-mage-dark-600 text-white text-sm font-medium py-2 px-3 rounded-md text-center cursor-not-allowed opacity-40">
          {t("decks.view")}
        </span>
        <Link
          to={`/decks/${deck.id}/edit`}
          className="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium py-2 px-3 rounded-md transition-colors duration-200 text-center"
        >
          {t("decks.edit")}
        </Link>
        <button
          onClick={onDelete}
          className="bg-red-600 hover:bg-red-700 text-white text-sm font-medium py-2 px-3 rounded-md transition-colors duration-200"
        >
          {t("decks.delete")}
        </button>
      </div>
    </div>
  );
};

export default DecksPage;
