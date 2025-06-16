sudo apt install i3 lightdm x11-xserver-utils pulseaudio kitty fish nm-tray \
libreoffice feh mpv brightnessctl ddcutil git polybar playerctl maim zip unzip filelight fd-find \
nemo firmware-misc-nonfree pulseaudio-module-bluetooth transmission-gtk \
pipx pandoc zathura texlive-latex-base texlive-xetex

cp -r ./fonts ~/.local/share/fonts
fc-cache

# pipx install i3-swallow
