#!/bin/bash

# Script pour générer une clé JWT sécurisée pour Railway
echo "🔐 Génération d'une clé JWT sécurisée pour la production..."

# Génération d'une clé de 64 bytes (512 bits) en base64
JWT_SECRET=$(openssl rand -base64 64 | tr -d '\n')

echo ""
echo "✅ Clé JWT générée avec succès !"
echo ""
echo "🔑 JWT_SECRET à utiliser dans Railway :"
echo "----------------------------------------"
echo "$JWT_SECRET"
echo "----------------------------------------"
echo ""
echo "📋 Instructions :"
echo "1. Copiez la clé ci-dessus"
echo "2. Dans Railway Dashboard > Variables"
echo "3. Ajoutez : JWT_SECRET = [coller la clé]"
echo "4. Sauvegardez et redéployez"
echo ""
echo "⚠️  IMPORTANT : Gardez cette clé secrète et sécurisée !"
