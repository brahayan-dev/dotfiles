# Main configuration
# ---------------------
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin:$PATH"

if [ -d "$(brew --prefix)/opt/grep/libexec/gnubin" ]; then
    PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
fi
