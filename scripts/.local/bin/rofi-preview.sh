#!/usr/bin/env bash

set -euo pipefail

IMAGE="${1:-}"

if [[ -z "$IMAGE" || ! -f "$IMAGE" ]]; then
  exit 1
fi

CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/rofi-wallpaper-preview"
mkdir -p "$CACHE_DIR"

HASH=$(printf '%s' "$IMAGE" | md5sum | awk '{print $1}')
CACHE_FILE="$CACHE_DIR/$HASH.png"

if [[ ! -f "$CACHE_FILE" ]]; then
  magick "$IMAGE" \
    -auto-orient \
    -thumbnail 500x300^ \
    -gravity center \
    -extent 500x300 \
    "$CACHE_FILE"
fi

printf '%s\n' "$CACHE_FILE"
