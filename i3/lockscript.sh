!#/bin/bash
if pgrep -x i3lock >/dev/null; then
    exit
fi

i3lock -n -i ~/Pictures/Wallpapers/wallpaper2-blurred.jpg -e -k --radius 100 --indicator --inside-color=FFD35A --ring-color=FFD35A --keyhl-color=DC0083 --time-str="%H:%M" --time-size=44 --time-pos="w/2:h/2-10" --date-str="      %a%n%d.%b.%Y" --date-size=22 --date-pos="w/2+48:h/2+25"
