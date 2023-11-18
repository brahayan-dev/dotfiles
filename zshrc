# ---------
# PATH adds
# ---------

# Starship
# --------
eval "$(starship init zsh)"

# Neovim
# ------
export EDITOR=nvim
alias v="nvim"
alias vdiff='nvim -d'

# Doom
# ----
# export PATH="$HOME/.emacs.d/bin:$PATH"

# Grep (used by Doom)
# -------------------
# if [ -d "$(brew --prefix)/opt/grep/libexec/gnubin" ]; then
#    PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
# fi

# JVM
# ---
# export PATH="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin:$PATH"

# Clojure
# -------
# alias clj="clojure"
# export PATH="/opt/homebrew/bin/lein:$PATH"

# Golang
# ------
export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"
