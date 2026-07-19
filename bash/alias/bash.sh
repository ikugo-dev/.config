source "$HOME"/.config/bash/alias/abbrev-alias.plugin.sh

abbrev-alias -g v="nvim"
abbrev-alias -g V="sudo -E nvim"
abbrev-alias -g vim="nvim"
abbrev-alias -g :q="exit"
abbrev-alias -g :wq="exit"
abbrev-alias -g z="swallow zaread"
abbrev-alias -g Z="find -type f -name '*.pdf' -exec swallow zaread {} \;"
abbrev-alias -g f="swallow feh"
abbrev-alias -g F="swallow feh . -Z"
abbrev-alias -g Fr="swallow feh . -Z -r"

abbrev-alias -g gccm="gcc main.c -o a"
abbrev-alias -g pp="python3 src/main.py"
abbrev-alias -g d="sudo docker"
abbrev-alias -g D="sudo docker-compose"

abbrev-alias -g cfg="nvim ~/.config/"
abbrev-alias -g cfgf="nvim ~/.config/fish/config.fish"
abbrev-alias -g cfgb="nvim ~/.config/bash/bashrc"
abbrev-alias -g cfgi="nvim ~/.config/i3/config"
abbrev-alias -g cfgp="nvim ~/.config/polybar/modules.ini"
abbrev-alias -g cfgk="nvim ~/.config/kitty/kitty.conf"
abbrev-alias -g cfgv="nvim ~/.config/nvim/init.lua"
abbrev-alias -g cfgs="nvim ~/.config/setup-arch.sh"
abbrev-alias -g cfgS="nvim ~/Code/Scripts"
abbrev-alias -g cfgn="nvim ~/.config/nixos/"

abbrev-alias -g autoremove="sudo pacman -Qdtq | sudo pacman -Rs -"
abbrev-alias -g p2j="find -name '*.pdf' -exec pdftojpg {} \;"
abbrev-alias -g a2p="find . -type f -name '*.ppt' -exec soffice --convert-to pdf {} \;"
abbrev-alias -g comic="curl -H 'X-TERMINAL-ROWS: \$(tput lines)' -H 'X-TERMINAL-COLUMNS: \$(tput cols)' https://xkcd.massi.rocks/comics/random"

