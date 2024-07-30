# Doom
# ----
export PATH="$HOME/.config/emacs/bin:$PATH"

# Starship
# --------
eval "$(starship init zsh)"

# Grep (used by Doom)
# -------------------
if [ -d "$(brew --prefix)/opt/grep/libexec/gnubin" ]; then
   PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
fi

# JVM
# ---
export JAVA_HOME="/Library/Java/JavaVirtualMachines/graalvm-jdk-21.0.1+12.1/Contents/Home"
export PATH="/Library/Java/JavaVirtualMachines/graalvm-jdk-21.0.1+12.1/Contents/Home/bin:$PATH"
alias native-image="./Library/Java/JavaVirtualMachines/graalvm-jdk-21.0.1+12.1/Contents/Home/bin/native-image"

# Clojure
# -------
alias clj="clojure"
export PATH="/opt/homebrew/bin/lein:$PATH"

# Dotfiles
# --------
ln -s -f ~/Projects/dotfiles/zshrc ~/.zshrc
ln -s -f ~/Projects/dotfiles/starship.toml ~/.config/starship.toml

for file in ~/Projects/dotfiles/nvim/*; do ln -s "$file" ~/.config/nvim/; done
for file in ~/Projects/dotfiles/doom/*; do ln -s "$file" ~/.config/doom/; done
for file in ~/Projects/dotfiles/kitty/*; do ln -s "$file" ~/.config/kitty/; done

# Aliases
# -------
alias lg="lazygit"
