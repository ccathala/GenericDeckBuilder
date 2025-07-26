import React from "react";
import { useLanguage } from "../contexts/LanguageContext";
import styles from "./CardFilter.module.css";

const CardFilter = ({
  searchTerm,
  onSearchChange,
  selectedElements,
  onElementToggle,
}) => {
  const { t } = useLanguage();

  const elements = [
    { key: "Végétal", cssClass: "vegetal" },
    { key: "Feu", cssClass: "feu" },
    { key: "Air", cssClass: "air" },
    { key: "Eau", cssClass: "eau" },
    { key: "Minéral", cssClass: "mineral" },
    { key: "Arcane", cssClass: "arcane" },
  ];

  return (
    <div className="w-full mb-6">
      <div className="flex justify-center items-center gap-4">
        <input
          type="text"
          value={searchTerm}
          onChange={(e) => onSearchChange(e.target.value)}
          placeholder={t("cards.filters.searchPlaceholder")}
          className="w-1/5 px-4 py-2 bg-mage-dark-700 border border-mage-dark-600 
                   rounded-md text-white placeholder-gray-400 
                   focus:outline-none focus:ring-2 focus:ring-mage-dark-500"
        />
        <div className="flex gap-2">
          {elements.map((element) => (
            <button
              key={element.key}
              onClick={() => onElementToggle(element.key)}
              className={`${styles.elementButton} ${
                selectedElements.includes(element.key)
                  ? styles[element.cssClass]
                  : styles.inactive
              }`}
            >
              {t(`cards.elements.${element.key}`)}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
};

export default CardFilter;
