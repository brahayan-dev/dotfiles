# ---------
# PATH adds
# ---------

# Doom
# ----
# export PATH="$HOME/.emacs.d/bin:$PATH"

# JVM
# ---
export PATH="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin:$PATH"

# Grep (used by Doom)
# -------------------
# if [ -d "$(brew --prefix)/opt/grep/libexec/gnubin" ]; then
#     PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
# fi


# ------
# Neovim
# ------
export EDITOR=nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias vimdiff='nvim -d'

# -------
# Clojure
# -------
alias clj="clojure"
