// src/layouts/AppLayout.jsx
import NavBar from "../components/NavBar";

export default function AppLayout({ children }) {
  return (
    <div className="app-layout">
      <NavBar />
      <main className="app-content">{children}</main>
    </div>
  );
}
