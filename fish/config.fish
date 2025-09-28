if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo "Hello friend!";
    echo -n "The time is "; set_color yellow; date +%T; set_color normal
end
fish_vi_key_bindings

abbr --add rename 'mv'
abbr --add v 'nvim'
abbr --add V 'sudo -E nvim'
abbr --add vim 'nvim'
abbr --add :q 'exit'
abbr --add :wq 'exit'
abbr --add z 'swallow zaread'
abbr --add Z 'ls | xargs -n1 swallow zaread'
abbr --add f 'swallow feh'
abbr --add F 'swallow feh . -Z'
abbr --add Fr 'swallow feh . -Z -r'
abbr --add p2j 'fd -e .pdf | xargs -n1 pdftojpg.sh' 

abbr --add cfgf 'nvim ~/.config/fish/config.fish'
abbr --add cfgz 'nvim ~/.config/zsh/zshrc'
abbr --add cfgi 'nvim ~/.config/i3/config'
abbr --add cfgp 'nvim ~/.config/polybar/modules.ini'
abbr --add cfgk 'nvim ~/.config/kitty/kitty.conf'
abbr --add cfgn 'nvim ~/.config/nvim/init.lua'
abbr --add cfgv 'nvim ~/.config/nvim/init.lua'
abbr --add cfgs 'nvim ~/.config/setup.sh'
abbr --add cfgS 'nvim ~/Code/Scripts'
abbr --add autoremove 'sudo pacman -Qdtq | sudo pacman -Rs -'

abbr --add comic 'curl -H "X-TERMINAL-ROWS: $(tput lines)" -H "X-TERMINAL-COLUMNS: $(tput cols)" https://xkcd.massi.rocks/comics/random'

# Created by `pipx` on 2025-07-13 20:24:27
set PATH $PATH /home/alex/.local/bin
