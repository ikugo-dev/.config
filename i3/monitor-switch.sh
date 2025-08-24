#!/bin/bash
MONITOR_STATE=./detect-monitor.sh

if [[ $MONITOR_STATE == "SECONDARY" ]]; then
    xrandr --output eDP --auto --set TearFree on \
           --output HDMI-A-0 --off
elif [[ $MONITOR_STATE == "PRIMARY" ]]; then
    xrandr --output eDP --auto --set TearFree on \
           --output HDMI-A-0 --auto --primary --right-of eDP --set TearFree on
elif [[ $MONITOR_STATE == "BOTH" ]]; then
    xrandr --output eDP --off \
           --output HDMI-A-0 --auto --set TearFree on
fi
