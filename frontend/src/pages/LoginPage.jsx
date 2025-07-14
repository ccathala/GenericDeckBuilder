import { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { useAuth } from "../contexts/AuthContext";
import { useLanguage } from "../contexts/LanguageContext";
import "./LoginPage.css";

export default function LoginPage() {
  const [credentials, setCredentials] = useState({
    email: "",
    password: "",
  });
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");

  const { login } = useAuth();
  const { t } = useLanguage();
  const navigate = useNavigate();

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setCredentials((prev) => ({
      ...prev,
      [name]: value,
    }));
    // Réinitialiser l'erreur quand l'utilisateur tape
    if (error) setError("");
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!credentials.email || !credentials.password) {
      setError(t("pleaseEnterCredentials"));
      return;
    }

    setIsLoading(true);
    setError("");

    try {
      const result = await login(credentials);
      if (result.success) {
        navigate("/"); // Rediriger vers la page d'accueil après connexion
      } else {
        setError(result.error || t("loginError"));
      }
    } catch (err) {
      setError(t("loginError"));
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="login-page">
      <div className="login-container">
        <div className="login-header">
          <h1>🔮 Mage Noir</h1>
          <h2>{t("signIn")}</h2>
        </div>

        <form onSubmit={handleSubmit} className="login-form">
          {error && <div className="error-message">{error}</div>}

          <div className="form-group">
            <label htmlFor="email">{t("email")}</label>
            <input
              type="email"
              id="email"
              name="email"
              value={credentials.email}
              onChange={handleInputChange}
              placeholder={t("enterEmail")}
              disabled={isLoading}
            />
          </div>

          <div className="form-group">
            <label htmlFor="password">{t("password")}</label>
            <input
              type="password"
              id="password"
              name="password"
              value={credentials.password}
              onChange={handleInputChange}
              placeholder={t("enterPassword")}
              disabled={isLoading}
            />
          </div>

          <button type="submit" className="login-button" disabled={isLoading}>
            {isLoading ? t("signingIn") : t("signIn")}
          </button>
        </form>

        <div className="login-footer">
          <p>
            {t("needAccount")}{" "}
            <Link to="/register" className="register-link">
              {t("createAccount")}
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
}
