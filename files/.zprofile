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
export EDITOR=nvim

# NOTE: Profiles
[ -f ~/.life_profile ] && source ~/.life_profile
[ -f ~/.work_profile ] && source ~/.work_profile
[ -f ~/.linux_profile ] && source ~/.linux_profile
[ -f ~/.private_profile ] && source ~/.private_profile
