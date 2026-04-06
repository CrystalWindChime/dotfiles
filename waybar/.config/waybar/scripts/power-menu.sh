#!/bin/bash

CHOICE=$(printf "%s\n" \
  "  Lock" \
  "  Log Out" \
  "  Reboot" \
  "  Shutdown" |
  rofi -dmenu -i -p "Power")

case "$CHOICE" in
*Lock) loginctl lock-session ;;
*"Log Out") hyprctl dispatch exit ;;
*Reboot) systemctl reboot ;;
*Shutdown) systemctl poweroff ;;
esac
