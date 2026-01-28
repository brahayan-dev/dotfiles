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
export PATH="$HOME/Projects/dotfiles/:$PATH"

# NOTE: Configurations
alias _kiln='cd "$HOME/Projects/kiln/"'
alias _dotfiles='cd "$HOME/Projects/dotfiles/"'
alias _max-neef='cd "$HOME/Projects/max-neef/"'
alias _workbook='cd "$HOME/Projects/workbook/"'
alias _fengari-hub='cd "$HOME/Projects/fengari-hub/"'
alias _fengari-api='cd "$HOME/Projects/fengari-api/"'
alias _fengari-web='cd "$HOME/Projects/fengari-web/"'

alias __kiln='cd "$HOME/Projects/kiln/" && emacs .'
alias __dotfiles='cd "$HOME/Projects/dotfiles/" && emacs .'
alias __max-neef='cd "$HOME/Projects/max-neef/" && emacs .'
alias __workbook='cd "$HOME/Projects/workbook/" && emacs .'
alias __fengari-hub='cd "$HOME/Projects/fengari-hub/" && emacs .'
alias __fengari-api='cd "$HOME/Projects/fengari-api/" && emacs .'
alias __fengari-web='cd "$HOME/Projects/fengari-web/" && emacs .'

# NOTE: Direnv setup
eval "$(direnv hook zsh)"
