#!/bin/bash

# Get current state
HDMI_CONNECTED=$(xrandr | grep "HDMI-A-0 connected")
E_DP_ON=$(xrandr --listmonitors | grep -q "eDP" && echo "yes" || echo "no")
HDMI_ON=$(xrandr --listmonitors | grep -q "HDMI-A-0" && echo "yes" || echo "no")

if [[ -z "$HDMI_CONNECTED" ]]; then
    xrandr --output eDP --auto --set TearFree on --output HDMI-A-0 --off
    exit
fi

if [[ "$HDMI_ON" == "yes" && "$E_DP_ON" == "no" ]]; then
    xrandr --output eDP --auto --set TearFree on \
           --output HDMI-A-0 --off
elif [[ "$HDMI_ON" == "no" && "$E_DP_ON" == "yes" ]]; then
    xrandr --output eDP --auto --set TearFree on \
           --output HDMI-A-0 --auto --primary --right-of eDP --set TearFree on
else
    xrandr --output eDP --off \
           --output HDMI-A-0 --auto --set TearFree on
fi
