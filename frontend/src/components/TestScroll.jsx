import React from "react";

const TestScroll = () => {
  // Générer 50 éléments pour tester le scroll
  const items = Array.from({ length: 50 }, (_, i) => ({
    id: i,
    name: `Test Item ${i + 1}`,
  }));

  return (
    <div className="min-h-screen bg-mage-bg-900 text-white p-6">
      <h1 className="text-2xl font-bold mb-6">Test de Scroll</h1>

      <div className="grid grid-cols-4 gap-6 h-96">
        {/* Zone de test avec scroll */}
        <div className="col-span-3 bg-mage-dark-800 rounded-lg p-6">
          <h2 className="text-xl font-bold mb-4">Zone avec scroll</h2>
          <div className="h-64 overflow-y-auto border border-gray-600 p-4">
            <div className="grid grid-cols-6 gap-4">
              {items.map((item) => (
                <div
                  key={item.id}
                  className="bg-mage-dark-700 p-4 rounded text-center"
                >
                  {item.name}
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Zone de droite */}
        <div className="col-span-1 bg-mage-dark-800 rounded-lg p-6">
          <h2 className="text-xl font-bold mb-4">Zone fixe</h2>
          <p>Contenu fixe</p>
        </div>
      </div>
    </div>
  );
};

export default TestScroll;
