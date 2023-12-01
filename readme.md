# Dotfiles

## Symlinks

```bash
# Zsh
# ---
ln -fs ~/Projects/dotfiles/zshrc ~/.zshrc

# Alacritty
# ---------
ln -fs ~/Projects/dotfiles/alacritty.yml ~/alacritty.yml
ln -fs ~/Projects/dotfiles/alacritty ~/.config

# Neovim
# ------
ln -fs ~/Projects/dotfiles/nvim ~/.config

# Starship
# --------
ln -fs ~/Projects/dotfiles/starship.toml ~/.config/starship.toml

# Doom
# ----
ln -s -f ~/Projects/dotfiles/doom/packages.el ~/.doom.d/packages.el
ln -s -f ~/Projects/dotfiles/doom/init.el ~/.doom.d/init.el
ln -s -f ~/Projects/dotfiles/doom/config.el ~/.doom.d/config.el
```
