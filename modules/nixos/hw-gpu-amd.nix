{
  lib,
  pkgs,
  ...
}: {
  boot = {
    initrd.kernelModules = ["amdgpu"];
    # for lact
    kernelParams = ["amdgpu.ppfeaturemask=0xfffd7fff"];
  };

  environment = {
    systemPackages = [pkgs.lact];
    variables = {
      "VDPAU_DRIVER" = "radeonsi";
      "LIBVA_DRIVER_NAME" = "radeonsi";
    };
  };

  hardware.graphics.extraPackages = with pkgs; [
    vulkan-extension-layer
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
  ];

  systemd = {
    packages = [pkgs.lact];
    services.lact = {
      serviceConfig.ExecStart = "${lib.getExe pkgs.lact} daemon";
      wantedBy = ["multi-user.target"];
    };
  };
}
