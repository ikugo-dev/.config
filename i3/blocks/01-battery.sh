#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"

BAT=$(upower -e | grep -m1 'BAT')
if [[ -z "$BAT" ]]; then
    echo "No battery"; echo; echo "$color2"
    exit 0
fi

INFO=$(upower -i "$BAT")
STATE=$(awk '/state:/{print $2}' <<< "$INFO")
PERCENT=$(awk '/percentage:/{print $2}' <<< "$INFO")
REMAIN=$(awk -F': *' '/time to (empty|full)/{print $2}' <<< "$INFO")

case "$STATE" in
    charging)      ICON="󰂄 CHR" ;;
    discharging)   ICON="󰁾 BAT" ;;
    fully-charged) ICON="󰁹 FULL" ;;
    *)             ICON="󰂃 UNK" ;;
esac

echo "$ICON $PERCENT $REMAIN"
echo
echo "$color2"
