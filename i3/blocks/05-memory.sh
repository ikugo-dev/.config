#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"

read -r TOTAL USED <<< "$(free -m | awk '/^Mem:/{print $2, $3}')"
USED_FMT=$(awk -v u="$USED" 'BEGIN{printf "%.1fG", u/1024}')
FREE_PCT=$(awk -v t="$TOTAL" -v u="$USED" 'BEGIN{printf "%.0f", (t-u)/t*100}')

echo "󰍛 ${USED_FMT}"
echo
if (( FREE_PCT < 10 )); then
    echo "$color9"
else
    echo "$color6"
fi
