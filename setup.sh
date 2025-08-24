# basic packages
sudo apt install i3 lightdm x11-xserver-utils pulseaudio kitty fish nm-tray zram-tools \
firmware-misc-nonfree pulseaudio-module-bluetooth transmission-gtk \
feh mpv git polybar maim zip unzip filelight fd-find \
pipx libreoffice zathura picom ranger \
brightnessctl ddcutil gammastep playerctl

# neovim
sudo apt install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim || exit
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build || exit
cpack -G DEB
sudo dpkg -i --force-overwrite ./nvim-linux-x86_64.deb
nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cd || exit

# fonts
cp -r ./fonts ~/.local/share/fonts
fc-cache

# zaread
git clone https://github.com/paoloap/zaread
cd zaread || exit
sudo make install
cd ..
rm -rf zaread

# i3 util
pipx install i3-swallow

# image preview on ranger
sudo apt install python3-pillow

# cursor
git clone https://github.com/uloco/numix-cursor.git
sudo mv numix-cursor/theme/Numix-Cursor /usr/share/icons
echo -e "[Icon Theme]\nName=Numix-Cursor\nInherits=Numix-Cursor" \
    > /usr/share/icons/default/index.theme   
rm -rf numix-cursor
export XCURSOR_THEME=Numix-Cursor
export XCURSOR_SIZE=16   


# fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v6
fisher install jhillyerd/plugin-git
