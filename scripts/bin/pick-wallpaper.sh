#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="$HOME/pictures/wallpapers"
PREVIEW_SCRIPT="$HOME/bin/rofi-preview.sh"

if [[ ! -d "$WALLPAPER_DIR" ]]; then
  printf 'Wallpaper directory not found: %s\n' "$WALLPAPER_DIR" >&2
  exit 1
fi

if [[ ! -x "$PREVIEW_SCRIPT" ]]; then
  printf 'Preview script is missing or not executable: %s\n' "$PREVIEW_SCRIPT" >&2
  exit 1
fi

mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/awww"

mapfile -d '' -t FILES < <(
  find "$WALLPAPER_DIR" -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.bmp' \) \
    -print0 | sort -z
)

[[ ${#FILES[@]} -eq 0 ]] && exit 0

ENTRIES=()
for file in "${FILES[@]}"; do
  name=$(basename "$file")
  preview=$("$PREVIEW_SCRIPT" "$file") || continue
  ENTRIES+=("${name}\x00icon\x1f${preview}")
done

[[ ${#ENTRIES[@]} -eq 0 ]] && exit 0

SELECTED=$(
  printf '%b\n' "${ENTRIES[@]}" | rofi \
    -dmenu \
    -show-icons \
    -p "Select wallpaper:" \
    -theme "$HOME/.config/rofi/wallpaper-style.rasi"
)

[[ -z "$SELECTED" ]] && exit 0

for file in "${FILES[@]}"; do
  if [[ "$(basename "$file")" == "$SELECTED" ]]; then
    awww img "$file" \
      --transition-type wipe \
      --transition-duration 1 \
      --transition-fps 30
    exit 0
  fi
done

exit 1
