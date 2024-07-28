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

ln -s -f ~/Projects/dotfiles/doom/init.el ~/.config/doom/init.el
ln -s -f ~/Projects/dotfiles/doom/config.el ~/.config/doom/config.el
ln -s -f ~/Projects/dotfiles/doom/packages.el ~/.config/doom/packages.el

ln -s -f ~/Projects/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s -f ~/Projects/dotfiles/kitty/dark-theme.conf ~/.config/kitty/dark-theme.conf
ln -s -f ~/Projects/dotfiles/kitty/light-theme.conf ~/.config/kitty/light-theme.conf
# ln -s -f ~/Projects/dotfiles/emacs/init.el ~/.emacs.d/init.el
