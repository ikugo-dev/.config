#TODO fix echo calls for newline characters
# fuck that beep sound
echo "blacklist pcspkr blacklist snd_pcsp" | sudo tee /etc/modprobe.d/nobeep.conf

# basic packages
sudo pacman -S xorg-xrandr zram-tools xclip psmisc \
    man gettext less base-devel cmake unzip curl \
    brightnessctl ddcutil gammastep playerctl \
    kitty fish firefox feh mpv git polybar maim zip filelight \
    libreoffice picom yazi transmission-gtk \
    bat tree fd zathura zathura-pdf-mupdf \
    go npm

# yay
cd ~/.config || exit
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si
cd .. || exit
rm -rf yay

# additional aur packages 
yay stremio i3-swallow-git zaread 

#default shell
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
