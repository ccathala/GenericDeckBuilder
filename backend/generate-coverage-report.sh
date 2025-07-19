#!/bin/bash
# Script pour générer et ouvrir le rapport JaCoCo

echo "🔍 Génération du rapport de couverture JaCoCo..."

# Nettoyage et génération du rapport
mvn clean test jacoco:report

if [ $? -eq 0 ]; then
    echo "✅ Rapport généré avec succès !"
    
    # Chemin vers le rapport
    REPORT_PATH="target/site/jacoco/index.html"
    
    if [ -f "$REPORT_PATH" ]; then
        echo "📊 Ouverture du rapport de couverture..."
        
        # Détection de l'OS et ouverture appropriée
        if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "win32" ]]; then
            # Windows
            start "$REPORT_PATH"
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS
            open "$REPORT_PATH"
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            # Linux
            xdg-open "$REPORT_PATH"
        fi
        
        echo "🎯 Rapport disponible à : $(pwd)/$REPORT_PATH"
    else
        echo "❌ Fichier rapport non trouvé : $REPORT_PATH"
    fi
else
    echo "❌ Erreur lors de la génération du rapport"
    exit 1
fi
