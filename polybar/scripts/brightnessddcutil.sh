#!/bin/bash
BRIGHTNESS_VALUE=$(ddcutil getvcp 10 | awk -F'=' '/current value/ {print $2}' | awk -F',' '{print $1}' | xargs)
~/.config/polybar/scripts/display-brightness.sh "$BRIGHTNESS_VALUE"
