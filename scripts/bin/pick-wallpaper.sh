#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/pictures/wallpapers"

# Collect files
mapfile -t FILES < <(find "$WALLPAPER_DIR" -type f)

# Get just the basenames for display
NAMES=("${FILES[@]##*/}")

# Let rofi pick a name
SELECTED_NAME=$(printf '%s\n' "${NAMES[@]}" | rofi -dmenu -p "Select wallpaper:")

# If user cancelled
[[ -z "$SELECTED_NAME" ]] && exit 0

# Find matching file and set wallpaper
for i in "${!NAMES[@]}"; do
  if [[ "${NAMES[$i]}" == "$SELECTED_NAME" ]]; then
    swww img "${FILES[$i]}" \
      --transition-type wipe \
      --transition-duration 1 \
      --transition-fps 30
    break
  fi
done
