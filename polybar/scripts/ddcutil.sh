#!/bin/bash
# Usage: ./brightness.sh up/down value

direction=$1                         # "up" or "down"
value=$2                             # Amount to increase or decrease
cache_file="/tmp/current_brightness" # Cache file for brightness

# Get the current brightness value from the cache or ddcutil
if [ -f "$cache_file" ]; then
    current_brightness=$(cat "$cache_file")
else
    current_brightness=$(ddcutil getvcp 10 | awk -F'=' '/current value/ {print $2}' | awk -F',' '{print $1}' | xargs)
    echo "$current_brightness" >"$cache_file" # Cache it for next time
fi

# Calculate new brightness
if [ "$direction" = "up" ]; then
    new_brightness=$((current_brightness + value))
elif [ "$direction" = "down" ]; then
    new_brightness=$((current_brightness - value))
else
    echo "Usage: $0 up/down value"
    exit 1
fi

# Clamp the brightness value within the range 0-100
if [ "$new_brightness" -gt 100 ]; then
    new_brightness=100
elif [ "$new_brightness" -lt 0 ]; then
    new_brightness=0
fi

# Set new brightness
ddcutil setvcp 10 "$new_brightness" && echo "$new_brightness" >"$cache_file"
