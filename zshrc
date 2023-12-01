# Starship
# --------
eval "$(starship init zsh)"

# Neovim
# ------
export EDITOR=nvim
alias vdiff='nvim -d'
alias v="nvim"

# Doom
# ----
export PATH="$HOME/.emacs.d/bin:$PATH"

# Grep (used by Doom)
# -------------------
if [ -d "$(brew --prefix)/opt/grep/libexec/gnubin" ]; then
   PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
fi

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

# Zsh
# ---
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
