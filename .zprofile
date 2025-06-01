#!/usr/bin/env zsh

if [[ "$(uname -a)" =~ Darwin ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[ -f ~/.work_profile ] && source ~/.work_profile
[ -f ~/.private_profile ] && source ~/.private_profile
[ -f ~/.akeptous_profile ] && source ~/.akeptous_profile
