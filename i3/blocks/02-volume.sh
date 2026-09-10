#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"

case "$BLOCK_BUTTON" in
    1) wpctl set-mute @DEFAULT_SINK@ toggle ;;
    4) wpctl set-volume @DEFAULT_SINK@ 5%+ ;;
    5) wpctl set-volume @DEFAULT_SINK@ 5%- ;;
esac

VOL=$(wpctl get-volume @DEFAULT_SINK@ | awk '{split($0,a,"."); print a[2]}')

if [[ $VOL = *"[MUTED"* ]]; then
    echo "󰖁 $VOL"
else
    echo "󰕾 $VOL"
fi
echo
echo "$color3"
