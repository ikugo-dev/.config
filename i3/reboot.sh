#!/bin/bash

while [ "$select" != "No" ] && [ "$select" != "Yes" ]; do
    select=$(echo -e "No\nYes" | dmenu \
        -fn "Terminus-12" -nb "#282A36" -nf "#EFF0EB" -sb "#FF6AC1" -sf "#282A36" \
        -i \
        -p "You pressed the reboot shortcut. Do you really want to reboot i3? This will end your X session.")
    if [ -z "$select" ]; then
        exit 0
    fi
done

if [ "$select" = "No" ]; then
    exit 0
fi

systemctl reboot
