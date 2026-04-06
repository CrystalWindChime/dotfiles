# Dotfiles

Personal dotfiles managed with GNU Stow on Arch Linux.

## Overview

This repository contains configuration files and scripts for my development environment, including:

* Shell configuration (bash)
* Window manager (Hyprland)
* Terminal (Kitty)
* Editor (Neovim)
* Status bar (Waybar)
* App launcher (Rofi)
* Notifications (Mako)
* Custom scripts
* XDG configuration (e.g. default applications)

All files are organised into Stow packages for easy symlink management.

---

## Structure

Each top-level directory is a Stow package:

* `bash/` – shell configuration (`.bashrc`, `.bash_profile`, environment, aliases)
* `scripts/` – personal scripts (installed to `~/.local/bin`)
* `hypr/` – Hyprland configuration
* `waybar/` – Waybar config and modules
* `rofi/` – Rofi themes and config
* `kitty/` – terminal configuration
* `nvim/` – Neovim config
* `mako/` – notification daemon config
* `xdg/` – XDG-related files (e.g. `mimeapps.list`)

---

## Installation

Clone the repository:

```bash
git clone <your-repo-url> ~/.dotfiles
cd ~/.dotfiles
```

Install GNU Stow if not already installed:

```bash
sudo pacman -S stow
```

Stow all packages:

```bash
stow -Rv bash
stow -Rv scripts
stow -Rv hypr
stow -Rv kitty
stow -Rv mako
stow -Rv nvim
stow -Rv rofi
stow -Rv waybar
stow -Rv xdg
```

Alternatively, run:

```bash
./install.sh
```

---

## Package Lists

Installed packages can be backed up with:

```bash
backup-pkgs
```

This updates:

* `pkglist-pacman.txt`
* `pkglist-aur.txt`

---

## Shell Setup

Shell configuration is modular:

* `env.sh` – environment variables
* `aliases.sh` – command aliases
* `tools.sh` – tool initialisation (nvm, starship, zoxide)

Loaded via `.bashrc`.

---

## Scripts

Custom scripts are installed to:

```bash
~/.local/bin
```

Ensure this is in your `$PATH` (handled in `env.sh`).

---

## Notes

* Only configuration is tracked — caches, logs, and state are excluded.
* Fonts and application data are not included.
* System-level config (`/etc`) is not managed here.

---

## Rebuilding System

To recreate this setup on a new machine:

1. Install base packages (pacman + AUR)
2. Clone this repo
3. Run `stow` (or `./install.sh`)
4. Log out / restart shell

---

## TODO

* Expand bootstrap script to install packages automatically
* Add documentation for required dependencies (Hyprland ecosystem, fonts, etc.)
