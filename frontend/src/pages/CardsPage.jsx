import React, { useState, useEffect } from "react";
import { useLanguage } from "../contexts/LanguageContext";
import CardFilter from "../components/CardFilter";
import CardGallery from "../components/CardGallery";
import { getCardsByGame } from "../services/cardService";

const CardsPage = () => {
  const { t, language } = useLanguage();
  const [cards, setCards] = useState([]);
  const [filteredCards, setFilteredCards] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchCards = async () => {
      try {
        setLoading(true);
        setError(null);

        const data = await getCardsByGame("mage_noir", language);
        setCards(data);
        setFilteredCards(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchCards();
  }, [language]);

  useEffect(() => {
    if (searchTerm) {
      const filtered = cards.filter(
        (card) =>
          card.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
          (card.description &&
            card.description.toLowerCase().includes(searchTerm.toLowerCase()))
      );
      setFilteredCards(filtered);
    } else {
      setFilteredCards(cards);
    }
  }, [searchTerm, cards]);

  const handleSearchChange = (term) => {
    setSearchTerm(term);
  };

  return (
    <div className="min-h-screen bg-mage-bg-900 text-white">
      <div className="w-full max-w-none mx-auto px-4 py-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold mb-4">{t("pages.cards.title")}</h1>
          <CardFilter
            searchTerm={searchTerm}
            onSearchChange={handleSearchChange}
          />
        </div>

        <CardGallery cards={filteredCards} loading={loading} error={error} />
      </div>
    </div>
  );
};

export default CardsPage;
