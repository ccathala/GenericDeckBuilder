import React from "react";
import { useLanguage } from "../contexts/LanguageContext";

const CardFilter = ({ searchTerm, onSearchChange, selectedElements, onElementToggle }) => {
  const { t } = useLanguage();

  const elements = [
    { key: "Végétal", color: "bg-green-600 hover:bg-green-700" },
    { key: "Feu", color: "bg-red-600 hover:bg-red-700" },
    { key: "Eau", color: "bg-blue-600 hover:bg-blue-700" },
    { key: "Air", color: "bg-cyan-600 hover:bg-cyan-700" },
    { key: "Mineral", color: "bg-gray-600 hover:bg-gray-700" },
    { key: "Arcane", color: "bg-purple-600 hover:bg-purple-700" }
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
              className={`px-3 py-2 rounded-md text-white text-sm font-medium transition-colors
                ${selectedElements.includes(element.key) 
                  ? element.color 
                  : 'bg-mage-dark-700 hover:bg-mage-dark-600'
                }`}
            >
              {element.key}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
};

export default CardFilter;
