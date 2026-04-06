alias hypr="exec start-hyprland"
alias xfce="exec startx"

alias hyprconf="nvim ~/.config/hypr/hyprland.conf"
alias rldwaybar="pkill waybar && hyprctl dispatch exec waybar"
alias movemonitor="hyprctl dispatch moveworkspacetomonitor"

alias sysupdate="sudo pacman -Syu && yay -Syu && rustup update && nvm install node --reinstall-packages-from=node"
alias backup-pkgs="pacman -Qqe > ~/.dotfiles/pkglist-pacman.txt && yay -Qm > ~/.dotfiles/pkglist-aur.txt"

alias cd="z"
alias ls="eza --group-directories-first --icons=auto"
alias la="eza -la --group-directories-first --icons=auto"
alias tree="eza --tree"

alias cat="bat --style=plain"
alias find="fd"
alias grep="rg"

alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -l"

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
