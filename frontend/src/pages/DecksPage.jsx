import { useLanguage } from "../contexts/LanguageContext";

export default function DecksPage() {
  const { t } = useLanguage();

  return (
    <div className="page-container">
      <h1>{t("myDecks")}</h1>
      <p>{t("manageDecks")}</p>
      <div className="coming-soon">
        <span>{t("featureInDevelopment")}</span>
      </div>
    </div>
  );
}
