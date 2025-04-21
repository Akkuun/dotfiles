#!/bin/bash

# Paquets nécessaires
echo "📦 Installation des paquets de base..."
sudo pacman -Syu --needed git stow kitty wget curl --noconfirm

# Dossiers de configuration
echo "📁 Création des dossiers de config si besoin..."
mkdir -p ~/.config

cd ~/dotfiles || exit

# Application de la configuration de Kitty
echo "🔧 Application de la configuration de Kitty..."
stow kitty
echo "- stow kitty"

# Message final
echo "✅ Setup terminé ! Vous pouvez maintenant utiliser Kitty avec la configuration personnalisée."
echo "🎉 Lancez Kitty pour tester."
