#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"

MONITOR_STATE=$(detect-monitor)
if [ "$MONITOR_STATE" = "SECONDARY" ] || [ "$MONITOR_STATE" = "NONE" ]; then
    VALUE=0
else
    VALUE=$(brightnessctl | grep -o "(.*" | tr -d "()")
fi

if [ "$VALUE" -lt 30 ]; then
    ICON=''
elif [ "$VALUE" -lt 70 ]; then
    ICON=''
else 
    ICON=''
fi

echo "$ICON $VALUE% "
echo
echo "$color4"
