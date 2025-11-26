#!/bin/bash

STATE_FILE="/tmp/wlsunset_on"
LOG="/tmp/wlsunset.log"

echo "--- $(date) ---" >> "$LOG"

if pgrep -x wlsunset >/dev/null; then
    echo "Turning OFF wlsunset" >> "$LOG"
    pkill -x wlsunset
    rm -f "$STATE_FILE"
else
    echo "Turning ON wlsunset" >> "$LOG"
    wlsunset -t 4000 -T 4001 >> "$LOG" 2>&1 &
    touch "$STATE_FILE"
fi
