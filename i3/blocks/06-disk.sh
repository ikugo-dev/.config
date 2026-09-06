#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"

read -r FREE USED <<< "$(df -h --output=avail,used / | tail -1)"
echo "󰆼 ${FREE}/${USED}"
echo
echo "$color7"
