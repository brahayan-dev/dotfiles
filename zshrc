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
ln -s -f ~/Projects/dotfiles/zshrc ~/.zshrc

to_symlink() {
	for file in ~/Projects/dotfiles/$1/*; do
		if [ ! -e $file ]; then
			ln -s "$file" ~/.config/$1
		fi
	done
}

to_symlink "zed"
to_symlink "doom"

# Aliases
# -------
alias lg="lazygit"

# NVM
# ---
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
