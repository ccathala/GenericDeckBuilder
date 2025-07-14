// src/App.jsx
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { LanguageProvider } from "./contexts/LanguageContext";
import CardGallery from "./components/CardGallery";
import DecksPage from "./pages/DecksPage";
import ProfilePage from "./pages/ProfilePage";
import AppLayout from "./layouts/AppLayout";

export default function App() {
  return (
    <LanguageProvider>
      <Router>
        <AppLayout>
          <Routes>
            <Route path="/" element={<CardGallery />} />
            <Route path="/decks" element={<DecksPage />} />
            <Route path="/profile" element={<ProfilePage />} />
          </Routes>
        </AppLayout>
      </Router>
    </LanguageProvider>
  );
}
