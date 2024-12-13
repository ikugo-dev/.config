#!/bin/bash
BRIGHTNESS_VALUE=$(brightnessctl | grep -o "(.*" | tr -d "()")
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%/}

if [ $BRIGHTNESS_NR -lt 30 ]; then
    BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 70 ]; then
    BRIGHTNESS_ICON=''
else
    BRIGHTNESS_ICON=''
fi
echo "%{B#57C7FF}%{F#282A36} $BRIGHTNESS_ICON %{F-}%{B-} $BRIGHTNESS_VALUE"
