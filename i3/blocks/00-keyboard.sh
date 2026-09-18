#!/usr/bin/env bash
source "$HOME/.cache/wal/colors.sh"

read -r msg </dev/tcp/localhost/31439
echo "$msg" | jq .LayerChange.new
echo
echo "$color1"
