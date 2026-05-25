#!/bin/sh

# use .config/nixos/ for configuration
sudo rm -rf /etc/nixos/
sudo ln -s ~/.config/nixos/ /etc/nixos

# fonts
sudo cp -r ./fonts ~/.local/share/fonts
fc-cache

# keyboard layout
sudo cp ~/.config/colemak-dh-arts /usr/share/X11/xkb/symbols/
