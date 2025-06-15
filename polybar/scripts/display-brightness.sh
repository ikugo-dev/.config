#!/bin/bash
BRIGHTNESS_VALUE=$1
BRIGHTNESS=${BRIGHTNESS_VALUE//%/}
if [ "$BRIGHTNESS" -lt 30 ]; then
    BRIGHTNESS_ICON=''
elif [ "$BRIGHTNESS" -lt 70 ]; then
    BRIGHTNESS_ICON=''
else 
    BRIGHTNESS_ICON=''
fi
source ~/.config/polybar/scripts/extract-colors.sh
echo "%{B$BLUE}%{F$BACKGROUND} $BRIGHTNESS_ICON %{F-}%{B-} $BRIGHTNESS_VALUE "
