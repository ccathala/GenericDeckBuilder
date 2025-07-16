import React from "react";
import { useLanguage } from "../contexts/LanguageContext";

const CardFilter = ({ searchTerm, onSearchChange }) => {
  const { t } = useLanguage();

  return (
    <div className="w-full mb-6">
      <div className="flex items-center gap-4">
        <div className="flex-1">
          <input
            type="text"
            value={searchTerm}
            onChange={(e) => onSearchChange(e.target.value)}
            placeholder={t("cards.filters.searchPlaceholder")}
            className="w-full px-4 py-2 bg-mage-dark-700 border border-mage-dark-600 
                     rounded-md text-white placeholder-gray-400 
                     focus:outline-none focus:ring-2 focus:ring-mage-dark-500"
          />
        </div>
      </div>
    </div>
  );
};

export default CardFilter;
