# Doom
# ----
export PATH="$HOME/.config/emacs/bin:$PATH"

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
ln -s -f ~/Projects/dotfiles/doom/init.el ~/.config/doom/init.el
ln -s -f ~/Projects/dotfiles/doom/config.el ~/.config/doom/config.el
ln -s -f ~/Projects/dotfiles/doom/packages.el ~/.config/doom/packages.el
ln -s -f ~/Projects/dotfiles/zed/keymap.json ~/.config/zed/keymap.json
ln -s -f ~/Projects/dotfiles/zed/settings.json ~/.config/zed/settings.json

# ln -s -f ~/Projects/dotfiles/emacs/init.el ~/.emacs.d/init.el
# ln -s -f ~/Projects/dotfiles/zshrc ~/.zshrc
