#!/usr/bin/env zsh

if [[ "$(uname -a)" =~ Darwin ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
