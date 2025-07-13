// src/layouts/AppLayout.jsx
export default function AppLayout({ children }) {
  return (
    <div className="app-layout">
      <header className="app-header">
        <h1>Mage Noir</h1>
      </header>
      <main className="app-content">{children}</main>
    </div>
  );
}
