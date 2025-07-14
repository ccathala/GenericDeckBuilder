import { createContext, useContext, useState, useEffect } from "react";
import axios from "../services/axiosInstance";

const AuthContext = createContext();

export function AuthProvider({ children }) {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState(null);
  const [isLoading, setIsLoading] = useState(true);

  // Vérifier l'état d'authentification au démarrage
  useEffect(() => {
    checkAuthStatus();
  }, []);

  const checkAuthStatus = async () => {
    try {
      // Vérifier s'il y a un token stocké
      const token = localStorage.getItem("authToken");

      if (token) {
        // Ajouter le token aux headers par défaut d'axios
        axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;

        // Ici, vous pourriez faire un appel API pour vérifier la validité du token
        // et récupérer les données utilisateur
        // Pour l'instant, on fait confiance au token stocké
        const userData = localStorage.getItem("userData");
        if (userData) {
          setIsAuthenticated(true);
          setUser(JSON.parse(userData));
        }
      }
    } catch (error) {
      console.error(
        "Erreur lors de la vérification de l'authentification:",
        error
      );
      // En cas d'erreur, on déconnecte l'utilisateur
      logout();
    } finally {
      setIsLoading(false);
    }
  };

  const login = async (credentials) => {
    try {
      // Appel à l'API backend pour l'authentification
      const response = await axios.post("/auth/login", {
        email: credentials.email,
        password: credentials.password,
      });

      const { token } = response.data;

      // Sauvegarder le token
      localStorage.setItem("authToken", token);

      // Ajouter le token aux headers par défaut d'axios
      axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;

      // Créer un objet utilisateur simple (vous pourriez faire un appel API séparé pour récupérer plus d'infos)
      const userData = {
        email: credentials.email,
        token: token,
      };

      localStorage.setItem("userData", JSON.stringify(userData));

      setIsAuthenticated(true);
      setUser(userData);

      return { success: true };
    } catch (error) {
      console.error("Erreur de connexion:", error);

      // Gestion des erreurs spécifiques
      if (error.response) {
        const errorMessage =
          error.response.data?.error || "Erreur de connexion";
        return { success: false, error: errorMessage };
      }

      return {
        success: false,
        error: "Erreur de connexion. Vérifiez votre connexion internet.",
      };
    }
  };

  const logout = () => {
    localStorage.removeItem("authToken");
    localStorage.removeItem("userData");

    // Supprimer le token des headers par défaut d'axios
    delete axios.defaults.headers.common["Authorization"];

    setIsAuthenticated(false);
    setUser(null);
  };

  const value = {
    isAuthenticated,
    user,
    isLoading,
    login,
    logout,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
}
