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

alias zshconfig="source ~/.zshrc"

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

# ---------
# Settings
# ---------
# NOTE: Used to add Lua and Kitty in PATH (assuming ~/.local/bin is in your system-wide PATH)
# export PATH="$HOME/.local/bin:$PATH"
# NOTE: Elixir
# export PATH="$PATH:$HOME/.elixir-ls/release"
# export PATH="$HOME/.elixir-install/installs/otp/27.2.3/bin:$PATH"
# export PATH="$HOME/.elixir-install/installs/elixir/1.18.3-otp-27/bin:$PATH"
# NOTE: Workspace CLI
export PATH="$HOME/.dotfiles/workspace/:$PATH"
# NOTE: Configurations
[ -s ~/.workrc ] && source ~/.workrc
[ -s ~/.akeptousrc ] && source ~/.akeptousrc

# -----
# Doom
# -----
export PATH="$HOME/.config/emacs/bin:$PATH"

# -------
# Neovim
# -------
if [[ "$(uname -a)" =~ Linux ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi
