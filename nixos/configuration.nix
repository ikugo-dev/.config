{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # nix.settings.experimental-features = [ "nix-command" ];
  # boot.initrd.availableKernelModules = [ "usb_storage" "sd_mod" ];
  boot.blacklistedKernelModules = [ "snd_pcsp" "nouveau" ];
  boot.initrd.kernelModules = [ "lz4" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
  boot.kernelParams = [
    "modprobe.blacklist=nouveau"
    "zswap.enabled=1"
    "zswap.shrinker_enabled=1"
    "zswap.compressor=lz4"
    "zswap.max_pool_percent=30"
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Belgrade";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.displayManager.ly.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;
    nvidiaSettings = true;
  };
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    amdgpuBusId = "PCI:5:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  hardware.bluetooth.enable = true;

  users.users.alex = {
    isNormalUser = true;
    description = "Alex";
    extraGroups = [ "audio" "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      nodejs
    ];
  };

  programs.firefox.enable = true;
  programs.fish.enable = true;
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
    steam
    ripcord
  ];

  security.rtkit.enable = true; # audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.i2c.enable = true; # display

  system.stateVersion = "25.11";
}
