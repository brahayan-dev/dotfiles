# ZSH configuration
# ------------------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="duellj"

# Plugin configuration
# ---------------------

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Main configuration
# ---------------------
export PATH="$HOME/.emacs.d/bin:$PATH"
