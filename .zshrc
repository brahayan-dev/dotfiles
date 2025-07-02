#!/usr/bin/env zsh

# -----
# Zsh
# -----
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git direnv)
[ -s $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

zsource() {
    source ~/.zshrc
    source ~/.zprofile
}

# ------
# Alias
# ------
alias lg='lazygit'

# ---------
# Settings
# ---------
# NOTE: Workstation CLI
export PATH="$HOME/.dotfiles/:$PATH"

# NOTE: Doom setup
export PATH="$HOME/.config/emacs/bin:$PATH"

# NOTE: Aider setup
export OPENAI_API_BASE=https://api.githubcopilot.com

# NOTE: Python setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/shims:$PATH"
[[ -d $PYENV_ROOT/bin ]] && eval "$(pyenv init --path)"
[[ -d $PYENV_ROOT/bin ]] && eval "$(pyenv init -)"

# NOTE: Configurations
[ -s ~/.workrc ] && source ~/.workrc
[ -s ~/.akeptousrc ] && source ~/.akeptousrc
