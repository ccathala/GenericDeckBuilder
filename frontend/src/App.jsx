// src/App.jsx
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import CardGallery from "./components/CardGallery";
import AppLayout from "./layouts/AppLayout";

export default function App() {
  return (
    <Router>
      <AppLayout>
        <Routes>
          <Route path="/" element={<CardGallery />} />
          {/* D'autres routes plus tard */}
        </Routes>
      </AppLayout>
    </Router>
  );
}
