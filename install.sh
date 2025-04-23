#!/bin/bash

set -e  # Arrête le script en cas d’erreur

echo "📦 Installation des paquets de base..."
sudo pacman -Syu --needed git stow kitty wget curl wofi vesktop-bin --noconfirm

# Vérifier si yay est installé, sinon l'installer
if ! command -v yay &> /dev/null; then
  echo "🔧 yay n'est pas installé. Installation de yay..."
  sudo pacman -S yay --noconfirm
else
  echo "✅ yay est déjà installé."
fi

# Installer Hyprshot via yay (si pas déjà installé)
if ! command -v hyprshot &> /dev/null; then
  echo "🔧 Installation de Hyprshot..."
  yay -S hyprshot --noconfirm
else
  echo "✅ Hyprshot est déjà installé."
fi

# Installer Hyprpaper via yay (si pas déjà installé)
if ! command -v hyprpaper &> /dev/null; then
  echo "🖼️ Installation de Hyprpaper..."
  yay -S hyprpaper --noconfirm
else
  echo "✅ Hyprpaper est déjà installé."
fi

echo "📁 Création du dossier ~/.config si nécessaire..."
mkdir -p ~/.config

cd ~/dotfiles || { echo "❌ Impossible d’accéder à ~/dotfiles"; exit 1; }

# Fonction pour appliquer un dossier via stow
apply_config() {
  local name="$1"
  if [ -d "$name" ]; then
    echo "🔧 Application de la configuration de $name..."
    stow "$name"
    echo "- stow $name ✅"
  else
    echo "⚠️ Dossier $name non trouvé, saut..."
  fi
}

# Appliquer les configurations
apply_config "kitty"
apply_config "wofi"
apply_config "hyprland"
apply_config "hyprpaper"  

# Rendre les scripts exécutables si présents
if [ -d "hyprland/.config/hypr/scripts" ]; then
  echo "⚙️ Mise en exécutable des scripts Hyprland..."
  chmod +x hyprland/.config/hypr/scripts/*.sh
  echo "- Scripts rendus exécutables ✅"
fi

# Créer un lien symbolique pour le dossier wallpapers s'il n'existe pas
if [ ! -d ~/Images ]; then
  mkdir -p ~/Images
fi

if [ ! -e ~/Images/wallpapers ]; then
  ln -s ~/dotfiles/hyprpaper/wallpapers ~/Images/wallpapers
  echo "🔗 Lien wallpapers créé dans ~/Images ✅"
else
  echo "✅ Le lien ~/Images/wallpapers existe déjà."
fi
echo ""
echo "✅ Setup terminé ! Les applications suivantes sont prêtes à l'emploi :"
echo "   - Kitty (terminal)"
echo "   - Wofi (application launcher avec script)"
echo "   - Zsh (shell utilisé pour lancer wofi via script)"
echo "   - Hyprland (si installé)"
echo "   - Hyprshot (outil de capture)"
echo "   - Hyprpaper (gestionnaire de fond d'écran)"
echo ""
echo "🖼️ Vérifiez que votre hyprpaper.conf contient les bons écrans avec :"
echo "   ➤ hyprctl monitors"
echo "   ➤ puis ajoutez dans hyprpaper.conf :"
echo "     wallpaper = NOM-ECRAN,/chemin/vers/fond.jpg"
echo ""
