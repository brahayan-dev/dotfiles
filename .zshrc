#!/usr/bin/env zsh

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

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Doom
# ----
export PATH="$HOME/.config/emacs/bin:$PATH"
