#!/bin/bash
BRIGHTNESS_VALUE=$(ddcutil getvcp 10 | awk -F'=' '/current value/ {print $2}' | awk -F',' '{print $1}' | xargs)
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%/}

if [ $BRIGHTNESS_NR -lt 30 ]; then
    BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 70 ]; then
    BRIGHTNESS_ICON=''
else
    BRIGHTNESS_ICON=''
fi
echo "%{B#6D8895} $BRIGHTNESS_ICON %{B-} $BRIGHTNESS_VALUE%"
