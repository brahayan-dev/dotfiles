#!/usr/bin/env zsh

# -----
# Zsh
# -----
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git direnv)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

alias zshconfig="source ~/.zshrc"

# -----
# Doom
# -----
export PATH="$HOME/.config/emacs/bin:$PATH"

# -------
# Neovim
# -------
export PATH="$PATH:/opt/nvim-linux64/bin"

# ----
# Nvm
# ----
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# -------
# Sdkman
# -------
# NOTE: This must be at the end of the file for sdkman to work
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# --------
# Common
# --------
# NOTE: Used to add Lua and Kitty in PATH (assuming ~/.local/bin is in your system-wide PATH)
# export PATH="$HOME/.local/bin:$PATH"
# NOTE: Elixir config
# export PATH="$PATH:$HOME/.elixir-ls/release"
# export PATH="$HOME/.elixir-install/installs/otp/27.2.3/bin:$PATH"
# export PATH="$HOME/.elixir-install/installs/elixir/1.18.3-otp-27/bin:$PATH"
[ -f ~/.workrc ] && source ~/.workrc
[ -f ~/.scriptrc ] && source ~/.scriptrc
[ -f ~/.privaterc ] && source ~/.privaterc
[ -f ~/.akeptousrc ] && source ~/.akeptousrc
