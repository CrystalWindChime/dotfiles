#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias hyprconf="nvim ~/.config/hypr/hyprland.conf"
alias rldwaybar="pkill waybar && hyprctl dispatch exec waybar"
alias movemonitor="hyprctl dispatch moveworkspacetomonitor"

alias sysupdate="sudo pacman -Syu && yay -Syu && rustup update && nvm install node --reinstall-packages-from=node"
alias backup-pkgs="pacman -Qqe > ~/.dotfiles/pkglist-pacman.txt && yay -Qm > ~/.dotfiles/pkglist-aur.txt"

# Navigation
alias cd="z"
alias ls="eza --group-directories-first --icons=auto"
alias la="eza -la --group-directories-first --icons=auto"
alias tree="eza --tree"

# Search & view
alias cat="bat --style=plain"
alias find="fd"
alias grep="rg"

# Shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -l"

# Git helpers
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"

cheat() {
  curl "https://cheat.sh/$1"
}

source ~/.config/my-environment.sh

export LANG=en_GB.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

eval "$(starship init bash)"
eval "$(zoxide init bash)"
