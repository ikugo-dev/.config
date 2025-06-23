# basic packages
sudo apt install i3 lightdm x11-xserver-utils pulseaudio kitty zsh nm-tray \
libreoffice feh mpv brightnessctl ddcutil git polybar playerctl maim zip unzip filelight fd-find \
pipx zathura picom ranger \
firmware-misc-nonfree pulseaudio-module-bluetooth transmission-gtk \

# neovim
sudo apt install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build
cpack -G DEB
sudo dpkg -i --force-overwrite ./nvim-linux-x86_64.deb
nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cd

# fonts
cp -r ./fonts ~/.local/share/fonts
fc-cache

# zaread
git clone https://github.com/paoloap/zaread
cd zaread
sudo make install
cd ..
rm -rf zaread

# zsh
ln -s ~/.config/zsh/zshrc ~/.zshrc   

# i3 util
pipx install i3-swallow

# image preview on ranger
sudo apt install python3-pillow
