#!/usr/bin/env sh

# fuck that beep sound
echo "blacklist pcspkr blacklist snd_pcsp" | sudo tee /etc/modprobe.d/nobeep.conf

# basic packages
sudo pacman -S \
    # system
    xorg-xrandr psmisc file man brightnessctl ddcutil playerctl bluez dash \
    # visuals
    polybar picom bibata-cursor-theme \
    # fonts
    ttf-liberation noto-fonts noto-fonts-cjk \
    # coding (go for yay, npm for lsp)
    firefox neovim xclip git kitty fish go npm \
    # qol
    zip unzip gammastep tree maim \
    # media
    yazi mpv feh zathura zathura-pdf-mupdf libreoffice-still filelight qbittorrent

# yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si
cd .. || exit
rm -rf yay

# additional aur packages 
yay stremio-linux-shell
yay ripcord
yay i3-swallow-git
yay i3lock-color
yay zaread-git

# nix
# sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
# TODO check if posix version works
mkfifo /tmp/nix_setup;
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install > /tmp/nix_setup
sh /tmp/nix_setup

# default shell
sudo chsh -s "$(which fish)"
chsh -s "$(which fish)"

# fonts
sudo cp -r ./fonts ~/.local/share/fonts
fc-cache

# colemak layout
sudo cp ~/.config/colemak-dh-arts /usr/share/X11/xkb/symbols/

# cursor
printf "[Icon Theme]\nName=Bibata\nInherits=Bibata-Modern-Amber" \
    | sudo tee /usr/share/icons/default/index.theme   

# turn off screen sleep
printf 'Section "Extensions"\n\tOption "DPMS" "false"\nEndSection' \
    | sudo tee /etc/X11/xorg.conf.d/10-extensions.conf
printf 'Section "ServerFlags"\n\tOption "BlankTime" "0"\nEndSection' \
    | sudo tee /etc/X11/xorg.conf.d/10-serverflags.conf

# relink sh to dash
sudo ln -sfT dash /usr/bin/sh

echo "Things left to do:"
echo " - Set up zswap https://wiki.archlinux.org/title/Zswap"
echo " - Check if nvidia-smi & nvidia prime are set up properly"
echo " - Check if pulseaudio is set up & if bluetoothctl is avaliable"
