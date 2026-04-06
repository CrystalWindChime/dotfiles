#!/bin/bash

DIRECTION="$1"  # "left" or "right"

# Get all monitor names in order
MONITORS=($(hyprctl monitors -j | jq -r '.[].name'))

# Get current workspace's monitor
CURRENT_MONITOR=$(hyprctl activeworkspace -j | jq -r '.monitor')

# Get index of current monitor
for i in "${!MONITORS[@]}"; do
  if [[ "${MONITORS[$i]}" == "$CURRENT_MONITOR" ]]; then
    CURRENT_INDEX=$i
    break
  fi
done

# Determine new monitor index
if [[ "$DIRECTION" == "right" ]]; then
  TARGET_INDEX=$(( (CURRENT_INDEX + 1) % ${#MONITORS[@]} ))
else
  TARGET_INDEX=$(( (CURRENT_INDEX - 1 + ${#MONITORS[@]}) % ${#MONITORS[@]} ))
fi

TARGET_MONITOR="${MONITORS[$TARGET_INDEX]}"
WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.id')

# Reassign workspace
hyprctl dispatch moveworkspacetomonitor "$WORKSPACE" "$TARGET_MONITOR"
