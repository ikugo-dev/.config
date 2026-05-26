{ config, ... }:

{
  hardware.i2c.enable = true;

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.displayManager.ly.enable = true;

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
}
