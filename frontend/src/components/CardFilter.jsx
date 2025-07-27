import React from "react";
import { useLanguage } from "../contexts/LanguageContext";
import styles from "./CardFilter.module.css";

const CardFilter = ({
  searchTerm,
  onSearchChange,
  selectedElements,
  onElementToggle,
  onResetFilters,
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
        <button
          onClick={onResetFilters}
          className="ml-2 p-2 text-gray-400 hover:text-white hover:bg-mage-dark-700 
                   rounded-md transition-colors duration-200"
          title={t("cards.filters.resetFilters")}
        >
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
              d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"
            />
          </svg>
        </button>
      </div>
    </div>
  );
};

export default CardFilter;
