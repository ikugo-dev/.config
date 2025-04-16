#!/bin/bash

while [ "$select" != "No" ] && [ "$select" != "Yes" ]; do
    select=$(echo -e "No\nYes" | dmenu \
        -i \
        -p "You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.")
    if [ -z "$select" ]; then
        exit 0
    fi
done

if [ "$select" = "No" ]; then
    exit 0
fi

systemctl poweroff
