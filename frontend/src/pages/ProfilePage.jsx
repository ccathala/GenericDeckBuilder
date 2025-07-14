import { useLanguage } from "../contexts/LanguageContext";

export default function ProfilePage() {
  const { t } = useLanguage();

  return (
    <div className="page-container">
      <h1>{t("myProfile")}</h1>
      <p>{t("manageProfile")}</p>
      <div className="coming-soon">
        <span>{t("featureInDevelopment")}</span>
      </div>
    </div>
  );
}
