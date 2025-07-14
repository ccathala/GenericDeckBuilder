import { Link, useLocation } from "react-router-dom";
import { useLanguage } from "../contexts/LanguageContext";
import LanguageSelector from "./LanguageSelector";
import "./NavBar.css";

export default function NavBar() {
  const location = useLocation();
  const { t } = useLanguage();

  const navItems = [
    { path: "/", label: t("cards"), icon: "🃏" },
    { path: "/decks", label: t("decks"), icon: "📚" },
    { path: "/profile", label: t("profile"), icon: "👤" },
  ];

  return (
    <nav className="navbar">
      <div className="navbar-container">
        <Link to="/" className="navbar-logo">
          <span className="logo-icon">🔮</span>
          <span className="logo-text">Mage Noir</span>
        </Link>

        <ul className="navbar-menu">
          {navItems.map((item) => (
            <li key={item.path} className="navbar-item">
              <Link
                to={item.path}
                className={`navbar-link ${
                  location.pathname === item.path ? "active" : ""
                }`}
              >
                <span className="nav-icon">{item.icon}</span>
                <span className="nav-text">{item.label}</span>
              </Link>
            </li>
          ))}
        </ul>

        <div className="navbar-actions">
          <LanguageSelector />
          <button className="navbar-button" title={t("settings")}>
            <span>⚙️</span>
          </button>
          <button className="navbar-button" title={t("search")}>
            <span>🔍</span>
          </button>
        </div>
      </div>
    </nav>
  );
}
