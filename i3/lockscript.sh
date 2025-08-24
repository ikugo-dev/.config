#!/bin/bash
if pgrep -x i3lock >/dev/null; then
    exit
fi

MONITOR_STATE=./detect-monitor.sh

if [[ $MONITOR_STATE == "PRIMARY" ]]; then
    i3lock -n -e -k \
        -i ~/Pictures/Wallpapers/trees.png \
        --radius 100 --indicator \
        --inside-color=a9b665 --ring-color=a9b665 \
        --keyhl-color=d8a657 \
        --time-str="%H:%M" --time-size=48 --time-pos="w/2:h/2" \
        --date-str="%d. %b. %Y%n         %a" --date-size=22 --date-pos="w/2+46:h/2+32"
else 
    i3lock -n -e -k \
        -i ~/Pictures/Wallpapers/new_trees.png \
        --radius 100 --indicator \
        --inside-color=a9b665 --ring-color=a9b665 \
        --keyhl-color=d8a657 \
        --time-str="%H:%M" --time-size=48 --time-pos="w/2:h/2" \
        --date-str="%d. %b. %Y%n         %a" --date-size=22 --date-pos="w/2+46:h/2+32"
fi
