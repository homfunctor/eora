# todo: really review
# todo: review
{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.lact];

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
