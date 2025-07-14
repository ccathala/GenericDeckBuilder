import { createContext, useContext, useState, useEffect } from "react";

// Dictionnaire des traductions
const translations = {
  fr: {
    cards: "Cartes",
    decks: "Decks",
    profile: "Profil",
    settings: "Paramètres",
    search: "Rechercher",
    language: "Langue",
    french: "Français",
    english: "English",
    // Pages temporaires
    myDecks: "Mes Decks",
    manageDecks: "Gérez vos decks de cartes ici.",
    myProfile: "Mon Profil",
    manageProfile: "Gérez votre profil et vos préférences.",
    featureInDevelopment: "🚧 Fonctionnalité en cours de développement",
    loadingCards: "Chargement des cartes...",
    // Authentification
    signIn: "Se connecter",
    signOut: "Se déconnecter",
    email: "Email",
    password: "Mot de passe",
    enterEmail: "Entrez votre email",
    enterPassword: "Entrez votre mot de passe",
    signingIn: "Connexion...",
    pleaseEnterCredentials: "Veuillez entrer vos identifiants",
    loginError: "Erreur de connexion. Vérifiez vos identifiants.",
    needAccount: "Besoin d'un compte ?",
    contactAdmin: "Contactez l'administrateur pour créer un compte",
    // Inscription
    createAccount: "Créer un compte",
    confirmPassword: "Confirmer le mot de passe",
    confirmPasswordPlaceholder: "Confirmez votre mot de passe",
    emailRequired: "L'email est requis",
    emailInvalid: "Format d'email invalide",
    passwordRequired: "Le mot de passe est requis",
    passwordTooShort: "Le mot de passe doit contenir au moins 6 caractères",
    passwordsNotMatch: "Les mots de passe ne correspondent pas",
    registrationSuccess: "Inscription réussie ! Connexion en cours...",
    registrationError: "Erreur lors de l'inscription. Veuillez réessayer.",
    creating: "Création...",
    redirecting: "Redirection...",
    alreadyHaveAccount: "Vous avez déjà un compte ?",
  },
  en: {
    cards: "Cards",
    decks: "Decks",
    profile: "Profile",
    settings: "Settings",
    search: "Search",
    language: "Language",
    french: "Français",
    english: "English",
    // Pages temporaires
    myDecks: "My Decks",
    manageDecks: "Manage your card decks here.",
    myProfile: "My Profile",
    manageProfile: "Manage your profile and preferences.",
    featureInDevelopment: "🚧 Feature in development",
    loadingCards: "Loading cards...",
    // Authentification
    signIn: "Sign In",
    signOut: "Sign Out",
    email: "Email",
    password: "Password",
    enterEmail: "Enter your email",
    enterPassword: "Enter your password",
    signingIn: "Signing in...",
    pleaseEnterCredentials: "Please enter your credentials",
    loginError: "Login error. Please check your credentials.",
    needAccount: "Need an account?",
    contactAdmin: "Contact the administrator to create an account",
    // Inscription
    createAccount: "Create Account",
    confirmPassword: "Confirm Password",
    confirmPasswordPlaceholder: "Confirm your password",
    emailRequired: "Email is required",
    emailInvalid: "Invalid email format",
    passwordRequired: "Password is required",
    passwordTooShort: "Password must be at least 6 characters long",
    passwordsNotMatch: "Passwords do not match",
    registrationSuccess: "Registration successful! Logging in...",
    registrationError: "Registration error. Please try again.",
    creating: "Creating...",
    redirecting: "Redirecting...",
    alreadyHaveAccount: "Already have an account?",
  },
};

const LanguageContext = createContext();

export function LanguageProvider({ children }) {
  // Initialiser directement avec la langue sauvegardée
  const [currentLanguage, setCurrentLanguage] = useState(() => {
    const savedLanguage = localStorage.getItem("language");
    return savedLanguage && translations[savedLanguage] ? savedLanguage : "fr";
  });

  // Sauvegarder la langue dans localStorage quand elle change
  useEffect(() => {
    localStorage.setItem("language", currentLanguage);
  }, [currentLanguage]);

  const changeLanguage = (language) => {
    if (translations[language]) {
      setCurrentLanguage(language);
    }
  };

  const t = (key) => {
    return translations[currentLanguage][key] || key;
  };

  const value = {
    currentLanguage,
    changeLanguage,
    t,
    availableLanguages: Object.keys(translations),
  };

  return (
    <LanguageContext.Provider value={value}>
      {children}
    </LanguageContext.Provider>
  );
}

export function useLanguage() {
  const context = useContext(LanguageContext);
  if (!context) {
    throw new Error("useLanguage must be used within a LanguageProvider");
  }
  return context;
}
