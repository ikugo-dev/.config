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
      layout = "us";
      variant = "";
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
