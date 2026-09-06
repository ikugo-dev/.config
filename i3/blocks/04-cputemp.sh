#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"
PATH_TEMP="/sys/class/hwmon/hwmon3/temp1_input"

# NOTE: re-paste your original temp icon glyph before ${DEG} below
# (it did not survive copy/paste into this script cleanly).
if [[ -r "$PATH_TEMP" ]]; then
    DEG=$(( $(<"$PATH_TEMP") / 1000 ))
    echo " ${DEG} °C"
else
    echo " N/A"
fi
echo
echo "$color5"
