eval "$(
  awk -F '=' '
    /^[^#].*=.*/ {
      key=$1; val=$2
      gsub(/^[ \t]+|[ \t]+$/, "", key)
      gsub(/^[ \t]+|[ \t]+$/, "", val)
      printf "%s=%s\n", toupper(key), val
    }
  ' ~/.config/polybar/colors.ini
)"
