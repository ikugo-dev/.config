{ config, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [ "snd_pcsp" "nouveau" ];
  boot.kernelModules = [ "btmtk" "btmtkusb" ];
  boot.initrd.kernelModules = [ "lz4" ];
  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.shrinker_enabled=1"
    "zswap.compressor=lz4"
    "zswap.max_pool_percent=30"
  ];
}
