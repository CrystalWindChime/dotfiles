#!/usr/bin/env bash
set -e

cd "$HOME/.dotfiles"

stow -Rv bash
stow -Rv scripts
stow -Rv hypr
stow -Rv kitty
stow -Rv mako
stow -Rv nvim
stow -Rv rofi
stow -Rv waybar
stow -Rv xdg
