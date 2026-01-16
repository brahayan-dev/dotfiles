#!/usr/bin/env zsh

# -----------------
# OS configuration
# -----------------
if [[ "$(uname -a)" =~ Darwin ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
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
[ -f ~/.private_profile ] && source ~/.private_profile
[ -f ~/.akeptous_profile ] && source ~/.akeptous_profile
