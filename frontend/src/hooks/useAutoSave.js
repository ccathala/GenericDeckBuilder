import { useState, useEffect, useCallback, useRef } from "react";

/**
 * Hook pour la sauvegarde automatique avec debounce
 * @param {Object} data - Données à surveiller pour les changements
 * @param {Function} saveFunction - Fonction de sauvegarde à appeler
 * @param {number} delay - Délai de debounce en millisecondes (défaut: 2000)
 * @returns {Object} { isSaving, lastSaved, hasChanges }
 */
export const useAutoSave = (data, saveFunction, delay = 2000) => {
  const [isSaving, setIsSaving] = useState(false);
  const [lastSaved, setLastSaved] = useState(null);
  const [hasChanges, setHasChanges] = useState(false);
  const timeoutRef = useRef(null);
  const previousDataRef = useRef(null);
  const isFirstRender = useRef(true);

  // Détection des changements dans les données
  useEffect(() => {
    // Ignorer le premier rendu pour éviter une sauvegarde immédiate
    if (isFirstRender.current) {
      previousDataRef.current = data;
      isFirstRender.current = false;
      return;
    }

    // Comparer les données actuelles avec les précédentes
    const currentDataString = JSON.stringify(data);
    const previousDataString = JSON.stringify(previousDataRef.current);

    if (previousDataRef.current && currentDataString !== previousDataString) {
      setHasChanges(true);
      console.log("🔄 Changements détectés, préparation auto-save...");
    }

    previousDataRef.current = data;
  }, [data]);

  // Fonction de sauvegarde avec debounce
  const debouncedSave = useCallback(async () => {
    // Annuler le timeout précédent s'il existe
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
    }

    // Programmer une nouvelle sauvegarde après le délai
    timeoutRef.current = setTimeout(async () => {
      if (!hasChanges) return;

      try {
        setIsSaving(true);
        console.log("💾 Début auto-save...");

        await saveFunction(data);

        setLastSaved(new Date());
        setHasChanges(false);
        console.log("✅ Auto-save réussi à", new Date().toLocaleTimeString());
      } catch (error) {
        console.error("❌ Erreur auto-save:", error);
        // Ne pas changer hasChanges en cas d'erreur pour retry
        throw error;
      } finally {
        setIsSaving(false);
      }
    }, delay);
  }, [data, saveFunction, delay, hasChanges]);

  // Déclencher auto-save quand des changements sont détectés
  useEffect(() => {
    if (hasChanges && data && Object.keys(data).length > 0) {
      debouncedSave();
    }

    // Cleanup function
    return () => {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current);
      }
    };
  }, [hasChanges, debouncedSave]);

  // Cleanup au démontage du composant
  useEffect(() => {
    return () => {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current);
      }
    };
  }, []);

  return {
    isSaving,
    lastSaved,
    hasChanges,
  };
};
