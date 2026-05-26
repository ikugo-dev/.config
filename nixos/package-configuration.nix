{ config, pkgs, ... }:

{
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.steam.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    xrandr # system
    psmisc
    file
    man
    brightnessctl
    ddcutil
    playerctl
    bluez
    dash
    polybar # visuals
    picom
    i3lock-color
    neovim # coding 
    xclip
    git
    kitty
    zip # qol
    unzip
    gammastep
    i3-swallow
    tree
    maim
    yazi # media
    mpv
    feh
    zathura
    libreoffice
    kdePackages.filelight
    qbittorrent
    stremio-linux-shell
    ripcord
  ];
}
