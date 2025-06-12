#!/usr/bin/env zsh

# -----
# Zsh
# -----
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="af-magic"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git direnv)
[ -s $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

alias zrc="source ~/.zshrc"

# ----
# Nvm
# ----
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# ---------
# Settings
# ---------
# NOTE: Workspace CLI
export PATH="$HOME/.dotfiles/workspace/:$PATH"
# NOTE: Configurations
[ -s ~/.workrc ] && source ~/.workrc
[ -s ~/.akeptousrc ] && source ~/.akeptousrc

# -------
# Neovim
# -------
if [[ "$(uname -a)" =~ Linux ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi
