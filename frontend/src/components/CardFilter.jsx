// frontend/src/components/CardFilter.jsx
import { useState } from "react";
import "./CardFilter.css";

export default function CardFilter({ filters, setFilters }) {
  const elements = ["Air", "Arcane", "Eau", "Feu", "Mineral", "Végétal"];

  const toggleElement = (el) => {
    if (filters.element.includes(el)) {
      setFilters({
        ...filters,
        element: filters.element.filter((e) => e !== el),
      });
    } else {
      setFilters({
        ...filters,
        element: [...filters.element, el],
      });
    }
  };

  return (
    <div className="card-filter">
      <input
        type="text"
        placeholder="Rechercher"
        value={filters.input}
        onChange={(e) => setFilters({ ...filters, input: e.target.value })}
      />

      <div className="element-filters">
        {elements.map((el) => (
          <button
            key={el}
            type="button"
            className={filters.element.includes(el) ? "active" : ""}
            onClick={() => toggleElement(el)}
          >
            {el}
          </button>
        ))}
      </div>
    </div>
  );
}
