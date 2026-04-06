#
# ~/.bashrc
#

[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Login banner for TTY
if [[ -z $DISPLAY && -z $WAYLAND_DISPLAY ]]; then
  echo
  echo "================================"
  echo "  GUI Options:"
  echo "    hypr -> Hyprland (Wayland)"
  echo "    xfce -> XFCE (X11)"
  echo "================================"
fi

source ~/.config/shell/env.sh
source ~/.config/shell/aliases.sh
source ~/.config/shell/tools.sh
