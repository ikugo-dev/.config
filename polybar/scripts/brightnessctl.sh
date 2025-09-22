#!/bin/bash
MONITOR_STATE=$(~/.config/i3/detect-monitor.sh)
if [[ $MONITOR_STATE == "SECONDARY" || $MONITOR_STATE == "NONE" ]]; then
    BRIGHTNESS_VALUE=0
else
    BRIGHTNESS_VALUE=$(brightnessctl | grep -o "(.*" | tr -d "()")
fi
~/.config/polybar/scripts/display-brightness.sh "${BRIGHTNESS_VALUE//%/}"
