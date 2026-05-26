{ config, pkgs, ... }:

{
  # nix.settings.experimental-features = [ "nix-command" ];
  imports = [
    ./hardware-configuration.nix
    ./boot-configuration.nix
    ./display-configuration.nix
    ./audio-configuration.nix
    ./package-configuration.nix
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Belgrade";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb = {
    layout = "us,colemak-dh-arts,rs,rs";
    variant = "basic,basic,latin,basic";
    options = "grp:win_space_toggle,caps:backspace";
    extraLayouts = {
      colemak-dh-arts = {
        description = "Colemak-DH with ARTS layout";
        languages = [ "eng" ];
        symbolsFile = ./layouts/colemak-dh-arts;
      };
    };
  };

  users.users.alex = {
    isNormalUser = true;
    description = "Alex";
    extraGroups = [ "audio" "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      nodejs
    ];
  };

  system.stateVersion = "25.11";
}
