#!/usr/bin/env zsh

# ----
# Zsh
# ----
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="aussiegeek"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

alias zshconfig="source ~/.zshrc"

# -----
# Doom
# -----
export PATH="$HOME/.config/emacs/bin:$PATH"

# ----
# Nvm
# ----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# -------
# Sdkman
# -------
# NOTE: This must be at the end of the file for sdkman to work
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
