{pkgs, ...}: {
  hardware = {
    amdgpu = {
      amdvlk.enable = false;
      initrd.enable = true;
    };

    graphics.extraPackages = with pkgs; [
      vulkan-extension-layer
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers
    ];
  };

  services.xserver.videoDrivers = ["modesetting"];
}
