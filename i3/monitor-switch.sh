#!/bin/bash
MONITOR_STATE=$(~/.config/i3/detect-monitor.sh)

if [[ $MONITOR_STATE == "SECONDARY" ]]; then # -> PRIMARY
    xrandr --output eDP --auto --set TearFree on \
           --output HDMI-A-0 --off
elif [[ $MONITOR_STATE == "PRIMARY" ]]; then # -> BOTH
    xrandr --output eDP --auto --set TearFree on \
           --output HDMI-A-0 --auto --primary --right-of eDP --set TearFree on
elif [[ $MONITOR_STATE == "BOTH" ]]; then # -> NONE
    xrandr --output eDP --off \
           --output HDMI-A-0 --auto --set TearFree on
fi
