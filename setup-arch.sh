#!/usr/bin/env sh

# fuck that beep sound
echo "blacklist pcspkr blacklist snd_pcsp" | sudo tee /etc/modprobe.d/nobeep.conf

# basic packages
sudo pacman -S \
    xorg-xrandr psmisc file man brightnessctl ddcutil playerctl bluez dash \ # system
    polybar picom i3lock-color noto-fonts-cjk \ # visuals
    neovim xclip git kitty nix \ # coding 
    zip unzip gammastep i3-swallow tree maim \ # qol
    yazi mpv feh zathura libreoffice filelight qbittorrent # media

# yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si
cd .. || exit
rm -rf yay

# additional aur packages 
yay stremio-enhanced-bin ripcord i3-swallow-git zaread i3lock-color

# default shell
sudo chsh -s "/usr/bin/fish"

# fonts
sudo cp -r ./fonts ~/.local/share/fonts
fc-cache

# colemak layout
sudo cp ~/.config/colemak-dh-arts /usr/share/X11/xkb/symbols/

# cursor
git clone https://github.com/uloco/numix-cursor.git
sudo mv numix-cursor/theme/Numix-Cursor /usr/share/icons
echo -e "[Icon Theme]\nName=Numix-Cursor\nInherits=Numix-Cursor" \
    > /usr/share/icons/default/index.theme   
rm -rf numix-cursor
export XCURSOR_THEME=Numix-Cursor
export XCURSOR_SIZE=16   


echo "Things left to do:"
echo " - Set up zswap https://wiki.archlinux.org/title/Zswap"
echo " - Check if nvidia-smi & nvidia prime are set up properly"
echo " - Check if pulseaudio is set up & if bluetoothctl is avaliable"
