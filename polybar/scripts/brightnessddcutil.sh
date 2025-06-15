#!/bin/bash
BRIGHTNESS_VALUE=$(brightnessctl | grep -o "(.*" | tr -d "()")
~/.config/polybar/scripts/display-brightness.sh "$BRIGHTNESS_VALUE"
