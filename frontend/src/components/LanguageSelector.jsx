import { useState, useRef, useEffect } from "react";
import { useLanguage } from "../contexts/LanguageContext";
import "./LanguageSelector.css";

export default function LanguageSelector() {
  const { currentLanguage, changeLanguage, t } = useLanguage();
  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef(null);

  const languages = [
    { code: "fr", name: "Français", flag: "🇫🇷" },
    { code: "en", name: "English", flag: "🇺🇸" },
  ];

  // Fermer le dropdown quand on clique à l'extérieur
  useEffect(() => {
    function handleClickOutside(event) {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setIsOpen(false);
      }
    }

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  const handleLanguageChange = (languageCode) => {
    changeLanguage(languageCode);
    setIsOpen(false);
  };

  const currentLanguageData = languages.find(
    (lang) => lang.code === currentLanguage
  );

  return (
    <div className="language-selector" ref={dropdownRef}>
      <button
        className="language-button"
        onClick={() => setIsOpen(!isOpen)}
        title={t("language")}
      >
        <span className="language-flag">{currentLanguageData?.flag}</span>
        <span className="language-code">{currentLanguage.toUpperCase()}</span>
        <span className="dropdown-arrow">▼</span>
      </button>

      {isOpen && (
        <div className="language-dropdown">
          {languages.map((language) => (
            <button
              key={language.code}
              className={`language-option ${
                currentLanguage === language.code ? "active" : ""
              }`}
              onClick={() => handleLanguageChange(language.code)}
            >
              <span className="language-flag">{language.flag}</span>
              <span className="language-name">{language.name}</span>
            </button>
          ))}
        </div>
      )}
    </div>
  );
}
