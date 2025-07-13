if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo "Hello friend!";
    echo -n "The time is "; set_color yellow; date +%T; set_color normal
end

fish_vi_key_bindings

abbr --add cfgf 'nvim ~/.config/fish/config.fish'                                                                                                                                       ✔ 
abbr --add vim 'nvim'                                                                                                                                                                   ✔ 
abbr --add v 'nvim'
abbr --add V 'sudo -E nvim'
abbr --add :q 'exit'
abbr --add :wq 'exit'
abbr --add cfgz 'nvim ~/.config/zsh/zshrc'
abbr --add cfgi 'nvim ~/.config/i3/config'
abbr --add cfgp 'nvim ~/.config/polybar/modules.ini'
abbr --add cfgk 'nvim ~/.config/kitty/kitty.conf'
abbr --add cfgn 'nvim ~/.config/nvim/init.lua'
abbr --add cfgs 'nvim ~/.config/setup.sh'
