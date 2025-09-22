#!/bin/bash
MONITOR_STATE=$(~/.config/i3/detect-monitor.sh)
if [[ $MONITOR_STATE == "PRIMARY" || $MONITOR_STATE == "NONE" ]]; then
    BRIGHTNESS_VALUE=0
else
    BRIGHTNESS_VALUE=$(ddcutil getvcp 10 2>/dev/null | awk -F'=' '/current value/ {print $2}' | awk -F',' '{print $1}' | xargs) || "0"
fi
~/.config/polybar/scripts/display-brightness.sh "$BRIGHTNESS_VALUE"
