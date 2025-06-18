#!/bin/bash
# Usage: ./brightness.sh up/down value
DIRECTION=$1 # "up" or "down"
VALUE=$2     # Amount to increase or decrease
CURRENT_BRIGHTNESS=$(ddcutil --noverify getvcp 10 | awk -F'=' '/current value/ {print $2}' | awk -F',' '{print $1}' | xargs)

if [ "$DIRECTION" = "up" ]; then
    NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS + VALUE))
elif [ "$DIRECTION" = "down" ]; then
    NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS - VALUE))
else
    echo "Usage: $0 up/down value"
    exit 1
fi

if [ "$NEW_BRIGHTNESS" -gt 100 ]; then
    NEW_BRIGHTNESS=100
elif [ "$NEW_BRIGHTNESS" -lt 0 ]; then
    NEW_BRIGHTNESS=0
fi

ddcutil --noverify setvcp 10 "$NEW_BRIGHTNESS"
