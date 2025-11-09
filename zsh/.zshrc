# ~/.zshrc - Configuration Zsh

# ============================================
# Historique
# ============================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# ============================================
# Auto-completion
# ============================================
autoload -Uz compinit
compinit

# ============================================
# Plugins
# ============================================

# zsh-autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    # Couleur des suggestions (gris clair)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
fi

# ============================================
# Prompt personnalisé
# ============================================
# Prompt simple et coloré
NEWLINE=$'\n'
PROMPT='%F{cyan}%~%f %F{green}❯%f '

# ============================================
# Aliases utiles
# ============================================
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# Arch/Pacman
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias clean='sudo pacman -Scc && sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null || echo "Aucun paquet orphelin"'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Dotfiles
alias dotfiles='cd ~/dotfiles'

# ============================================
# Touches de navigation
# ============================================
# Accepter la suggestion avec flèche droite
bindkey '^[[C' forward-char
# Accepter toute la suggestion avec Ctrl+Espace (ou End)
bindkey '^ ' autosuggest-accept
bindkey '^[[F' autosuggest-accept

# ============================================
# Messages de bienvenue
# ============================================
# echo "🚀 Zsh chargé avec succès !"
# echo "💡 Tapez une commande - les suggestions apparaissent en gris"
# echo "   → Appuyez sur [→] ou [End] pour accepter"
