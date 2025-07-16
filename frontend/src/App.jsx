import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { LanguageProvider } from "./contexts/LanguageContext";
import { AuthProvider } from "./contexts/AuthContext";
import NavBar from "./components/NavBar";
import HomePage from "./pages/HomePage";
import CardsPage from "./pages/CardsPage";
import "./App.css";

function App() {
  return (
    <LanguageProvider>
      <AuthProvider>
        <Router>
          <div className="app-container min-h-screen bg-mage-bg-900 w-full">
            <NavBar />

            {/* Contenu principal avec padding-top pour compenser la navbar fixe */}
            <main className="pt-16 w-full">
              <Routes>
                <Route path="/" element={<HomePage />} />
                <Route path="/cards" element={<CardsPage />} />
                <Route
                  path="/decks"
                  element={
                    <div className="min-h-screen bg-mage-bg-900 flex items-center justify-center w-full">
                      <div className="text-white text-2xl">
                        Page des decks - À venir
                      </div>
                    </div>
                  }
                />
                <Route
                  path="/profile"
                  element={
                    <div className="min-h-screen bg-mage-bg-900 flex items-center justify-center w-full">
                      <div className="text-white text-2xl">
                        Page profil - À venir
                      </div>
                    </div>
                  }
                />
                <Route
                  path="/login"
                  element={
                    <div className="min-h-screen bg-mage-bg-900 flex items-center justify-center w-full">
                      <div className="text-white text-2xl">
                        Page de connexion - À venir
                      </div>
                    </div>
                  }
                />
                <Route
                  path="/register"
                  element={
                    <div className="min-h-screen bg-mage-bg-900 flex items-center justify-center w-full">
                      <div className="text-white text-2xl">
                        Page d'inscription - À venir
                      </div>
                    </div>
                  }
                />
              </Routes>
            </main>
          </div>
        </Router>
      </AuthProvider>
    </LanguageProvider>
  );
}

export default App;
