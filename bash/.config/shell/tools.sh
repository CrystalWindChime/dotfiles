cheat() {
  curl "https://cheat.sh/$1"
}

export NVM_DIR="$HOME/.nvm"
[ -s /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

eval "$(starship init bash)"
eval "$(zoxide init bash)"
