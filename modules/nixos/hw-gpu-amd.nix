{
  lib,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = [pkgs.lact];
    variables = {
      "LIBVA_DRIVER_NAME" = "radeonsi";
      "VDPAU_DRIVER" = "radeonsi";
    };
  };

  hardware = {
    amdgpu.initrd.enable = true;

    graphics.extraPackages = with pkgs; [
      vulkan-extension-layer
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers
    ];
  };

  systemd = {
    packages = [pkgs.lact];
    services.lact = {
      serviceConfig.ExecStart = "${lib.getExe pkgs.lact} daemon";
      wantedBy = ["multi-user.target"];
    };
  };
}
