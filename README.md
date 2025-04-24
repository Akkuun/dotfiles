# Dotfiles Setup Guide

Ce dépôt contient mes configurations personnelles pour plusieurs outils et applications. Ce guide vous expliquera comment installer et configurer rapidement votre système avec ces dotfiles.

## List of Tools

Ce dépôt inclut la configuration pour les outils suivants :

- **Kitty** (Terminal)
- **Wofi** (Outil de barre de recherche d'application)
- **HyprShot** (Captures d'écran)
- **Yay** (Outil d'installation de paquet AUR)
- **Hyprpaper** (Outil de gestion de fond d'écran)
- **Vesktop** (Discord pour Arch)
- **hellwal** (Modification de la palette de couleur)

### Prérequis

Avant de commencer, assurez-vous que vous avez une installation fonctionnelle d'**Arch Linux** ou d'une autre distribution basée sur **pacman**. Le script d'installation est conçu pour Arch Linux, mais il peut être modifié pour d'autres distributions.

## Installation

### 1. Clonez ce dépôt

Si ce n'est pas déjà fait, clonez ce dépôt dans votre répertoire `~/dotfiles` :

```bash
git clone https://github.com/Akkuun/dotfiles.git ~/dotfiles
```

### 2. Lancer le script d'installation

Le script d'installation applique la configuration de Kitty en utilisant stow. Ouvrez un terminal et exécutez les commandes suivantes :

```bash
cd ~/dotfiles
./install.sh
```

### Ce que fait le script :

- Installe les paquets nécessaires : git, stow, kitty, wget, curl,ect..

- Crée les dossiers nécessaires dans votre répertoire ~/.config s'ils n'existent pas.

- Applique les configurations via stow.

- Rend exécutable les scripts utilisés par le fichier configuration d'hyperland.


### Palette automatique bug

Voici la pipeline concernant la palette automatique si jamais ça marche pas :

- 1) supprimer les dossiers hellwal dans ~/.config/hellwal et ~/.cache/hellwal

- 2) recréer un dossier dans ~/.config/hellwal

- 3) dans le dossier hellwal dans ~/dotfiles/hellwal ( cp -r templates ~/.config/hellwal puis make)

- 4) une fois que l'executable est mis en place, voici comment ça marche à l'exécution. Hyprpaper met le bon fond d'écran basé sur le path fourni dans hyprpaper.conf ensuite un script applyPalette va executabler hellwal pour correspondre au bon fond et va creer les fichiers de cache. Enfin genereteKittyColorConf va crer le bon fichier de conf pour les couleurs de kitty et le mettre dans les fichiers de conf de kitty