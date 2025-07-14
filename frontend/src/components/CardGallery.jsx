// src/pages/CardGallery.jsx
import { useEffect, useState } from "react";
import axios from "../services/axiosInstance";
import { useLanguage } from "../contexts/LanguageContext";
import "./CardGallery.css";
import CardFilter from "./CardFilter";

export default function CardGallery() {
  const [cards, setCards] = useState([]);
  const [filters, setFilters] = useState({ input: "", element: [] }); // element devient un tableau
  const [isLoading, setIsLoading] = useState(true);
  const { currentLanguage, t } = useLanguage();

  useEffect(() => {
    const locale = currentLanguage === "fr" ? "fr" : "en";

    setIsLoading(true);
    axios
      .get(`/api/public/games/mage_noir/cards?locale=${locale}`)
      .then((res) => {
        setCards(res.data);
        setIsLoading(false);
      })
      .catch((err) => {
        console.error("Erreur de chargement des cartes :", err);
        setIsLoading(false);
      });
  }, [currentLanguage]); // Recharger les cartes quand la langue change

  const normalize = (str) =>
    (str || "")
      .toLowerCase()
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "");

  const filteredCards = cards.filter((card) => {
    const props = card.properties || {};
    const nom = normalize(card.name);
    const description = normalize(card.description);
    const type = normalize(props["type"] || "");
    const element = normalize((props["element"] || "").trim());
    const search = normalize(filters.input);

    const elementFilters = filters.element.map(normalize);

    return (
      (nom.includes(search) ||
        description.includes(search) ||
        type.includes(search)) &&
      (elementFilters.length === 0 || elementFilters.includes(element))
    );
  });

  return (
    <div>
      <CardFilter filters={filters} setFilters={setFilters} />
      {isLoading ? (
        <div className="loading-container">
          <div className="loading-spinner"></div>
          <p>{t("loadingCards")}</p>
        </div>
      ) : (
        <div className="card-grid">
          {filteredCards.map((card) => (
            <img
              key={card.id}
              src={card.imageUrl}
              alt={card.name}
              className="card-image"
            />
          ))}
        </div>
      )}
    </div>
  );
}
