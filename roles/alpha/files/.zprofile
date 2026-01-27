#!/usr/bin/env zsh

# -----------------
# OS configuration
# -----------------
if [[ "$(uname -a)" =~ Darwin ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="$PATH:$HOME/.local/bin"
fi

if [[ "$(uname -a)" =~ Linux ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi

# ---------
# Settings
# ---------
# NOTE: Editor
export EDITOR=nvim

# NOTE: Doom setup
export PATH="$HOME/.config/emacs/bin:$PATH"

# NOTE: Profiles
[ -f ~/.work_profile ] && source ~/.work_profile
[ -f ~/.common_profile ] && source ~/.common_profile
[ -f ~/.private_profile ] && source ~/.private_profile
