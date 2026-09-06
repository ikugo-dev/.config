#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"

case "$BLOCK_BUTTON" in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    4) pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    5) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
esac

MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

if [[ "$MUTED" == "yes" ]]; then
    echo "󰖁 muted ($VOL)"
else
    echo "󰕾 $VOL"
fi
echo
echo "$color3"
