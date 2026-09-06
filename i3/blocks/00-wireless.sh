#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"
IFACE="wlo1"

if [[ "$(cat /sys/class/net/$IFACE/operstate 2>/dev/null)" == "up" ]]; then
    LINE=$(nmcli -t -f active,ssid,signal dev wifi 2>/dev/null | grep '^yes')
    ESSID=$(cut -d: -f2 <<< "$LINE")
    QUALITY=$(cut -d: -f3 <<< "$LINE")
    echo "󰖩 ${QUALITY}% at ${ESSID}"
else
    echo "󱚵  down"
fi
echo
echo "$color1"
