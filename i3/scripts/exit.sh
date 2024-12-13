#!/bin/bash

while [ "$select" != "NO" ] && [ "$select" != "YES" ]; do
    select=$(echo -e "NO\nYES" | dmenu \
        -i \
        -p "You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.")
    if [ -z "$select" ]; then
        exit 0
    fi
done

if [ "$select" = "NO" ]; then
    exit 0
fi

i3-msg exit
