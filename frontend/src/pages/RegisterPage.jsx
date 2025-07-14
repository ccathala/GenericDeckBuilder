import { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { useAuth } from "../contexts/AuthContext";
import { useLanguage } from "../contexts/LanguageContext";
import "./RegisterPage.css";

export default function RegisterPage() {
  const [credentials, setCredentials] = useState({
    email: "",
    password: "",
    confirmPassword: "",
  });
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const { login } = useAuth();
  const { t } = useLanguage();
  const navigate = useNavigate();

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setCredentials((prev) => ({
      ...prev,
      [name]: value,
    }));
    // Réinitialiser les messages quand l'utilisateur tape
    if (error) setError("");
    if (success) setSuccess("");
  };

  const validateForm = () => {
    if (!credentials.email) {
      setError(t("emailRequired"));
      return false;
    }

    if (!credentials.email.includes("@")) {
      setError(t("emailInvalid"));
      return false;
    }

    if (!credentials.password) {
      setError(t("passwordRequired"));
      return false;
    }

    if (credentials.password.length < 6) {
      setError(t("passwordTooShort"));
      return false;
    }

    if (credentials.password !== credentials.confirmPassword) {
      setError(t("passwordsNotMatch"));
      return false;
    }

    return true;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!validateForm()) {
      return;
    }

    setIsLoading(true);
    setError("");
    setSuccess("");

    try {
      // Appel à l'API backend pour l'inscription
      const response = await fetch("http://localhost:8080/auth/register", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email: credentials.email,
          password: credentials.password,
        }),
      });

      const data = await response.json();

      if (response.ok) {
        // Inscription réussie, connecter automatiquement l'utilisateur
        setSuccess(t("registrationSuccess"));

        // Attendre un peu pour que l'utilisateur voie le message de succès
        setTimeout(async () => {
          const loginResult = await login({
            email: credentials.email,
            password: credentials.password,
          });

          if (loginResult.success) {
            navigate("/"); // Rediriger vers la page d'accueil
          }
        }, 1500);
      } else {
        // Gestion des erreurs du backend
        setError(data.error || t("registrationError"));
      }
    } catch (err) {
      console.error("Erreur d'inscription:", err);
      setError(t("registrationError"));
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="register-page">
      <div className="register-container">
        <div className="register-header">
          <h1>🔮 Mage Noir</h1>
          <h2>{t("createAccount")}</h2>
        </div>

        <form onSubmit={handleSubmit} className="register-form">
          {error && <div className="error-message">{error}</div>}

          {success && <div className="success-message">{success}</div>}

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
              required
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
              required
            />
          </div>

          <div className="form-group">
            <label htmlFor="confirmPassword">{t("confirmPassword")}</label>
            <input
              type="password"
              id="confirmPassword"
              name="confirmPassword"
              value={credentials.confirmPassword}
              onChange={handleInputChange}
              placeholder={t("confirmPasswordPlaceholder")}
              disabled={isLoading}
              required
            />
          </div>

          <button
            type="submit"
            className="register-button"
            disabled={isLoading || success}
          >
            {isLoading
              ? t("creating")
              : success
              ? t("redirecting")
              : t("createAccount")}
          </button>
        </form>

        <div className="register-footer">
          <p>
            {t("alreadyHaveAccount")}{" "}
            <Link to="/login" className="login-link">
              {t("signIn")}
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
}
