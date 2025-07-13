// src/pages/CardGallery.jsx
import { useEffect, useState } from "react";
import axios from "../services/axiosInstance";
import "./CardGallery.css";
import CardFilter from "./CardFilter";

export default function CardGallery() {
  const [cards, setCards] = useState([]);
  const [filters, setFilters] = useState({ input: "", element: [] }); // element devient un tableau

  useEffect(() => {
    axios
      .get("/api/public/games/mage_noir/cards?locale=fr")
      .then((res) => setCards(res.data).then)
      .catch((err) => console.error("Erreur de chargement des cartes :", err));
  }, []);

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
    </div>
  );
}
