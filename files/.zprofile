#!/usr/bin/env zsh

# -----------------
# OS configuration
# -----------------
if [[ "$(uname -a)" =~ Darwin ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="$PATH:$HOME/.local/bin"
fi

# ---------
# Settings
# ---------
# NOTE: Editor
export EDITOR=emacs

# NOTE: Profiles
[ -f ~/.beta_profile ] && source ~/.beta_profile
[ -f ~/.delta_profile ] && source ~/.delta_profile
[ -f ~/.gamma_profile ] && source ~/.gamma_profile
[ -f ~/.private_profile ] && source ~/.private_profile
