#!/bin/bash

CHOICE=$(printf "Lock\nReboot\nShutdown" | rofi -dmenu -i -p "Power")

case "$CHOICE" in
Lock) loginctl lock-session ;; # or your lockscreen command
Reboot) systemctl reboot ;;
Shutdown) systemctl poweroff ;;
esac
