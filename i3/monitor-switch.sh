#!/bin/bash

# Check if the HDMI-A-0 (secondary monitor) is connected
if xrandr | grep -q "HDMI-A-0 connected"; then
    # If HDMI-A-0 is connected, turn off the internal display and enable HDMI
    xrandr --output eDP --off --output HDMI-A-0 --auto --set TearFree on
else
    # If HDMI-A-0 is not connected, turn on the internal display
    xrandr --output eDP --auto --set TearFree on --output HDMI-A-0 --off
fi
