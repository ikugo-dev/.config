#!/bin/bash
if [ $# != 3 ]; then
    echo "Usage $0 up/down value"
fi
DIRECTION=$1 # "up" or "down"
AMMOUNT=$2
CURRENT_BRIGHTNESS=$(ddcutil --noverify getvcp 10 | awk -F'=' '/current value/ {print $2}' | awk -F',' '{print $1}' | xargs)

if [ "$DIRECTION" = "up" ]; then
    NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS + AMMOUNT))
elif [ "$DIRECTION" = "down" ]; then
    NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS - AMMOUNT))
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
