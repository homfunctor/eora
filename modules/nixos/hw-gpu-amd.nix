{
  lib,
  pkgs,
  ...
}: {
  # environment.systemPackages = [pkgs.lact];
  hardware = {
    # temp: trying to fix gaming crash
    firmware = [
      (pkgs.linux-firmware.overrideAttrs (old: {
        version = "20251111";
        src = pkgs.fetchurl {
          # https://www.kernel.org/pub/linux/kernel/firmware/
          url = "https://www.kernel.org/pub/linux/kernel/firmware/linux-firmware-20251111.tar.gz";
          # > nix-prefetch-url https://www.kernel.org/pub/linux/kernel/firmware/linux-firmware-20251111.tar.gz
          sha256 = "0rp2ah8drcnl7fh9vbawa8p8c9lhvn1d8zkl48ckj20vba0maz2g";
        };
      }))
    ];

    amdgpu.initrd.enable = true;

    graphics.extraPackages = with pkgs; [
      vulkan-extension-layer
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers
    ];
  };

  # temp: crashes started again
  # services.xserver.videoDrivers = ["modesetting"];

  # systemd = {
  #   packages = [pkgs.lact];
  #   services.lact = {
  #     serviceConfig.ExecStart = "${lib.getExe pkgs.lact} daemon";
  #     wantedBy = ["multi-user.target"];
  #   };
  # };
}
