{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkDefault;
in {
  console.earlySetup = true;

  boot = {
    consoleLogLevel = 3;

    initrd = {
      supportedFilesystems = ["ext4"];
      systemd.enable = true;
    };

    kernel.sysctl."fs.file-max" = 524288;

    kernelPackages = mkDefault pkgs.linuxPackages_latest;

    kernelParams = [
      "plymouth.use-simpledrm"
      "quiet"
      "rd.udev.log_level=3"
      "systemd.show_status=auto"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = mkDefault true;
    };

    plymouth = {
      enable = true;
      themePackages = [pkgs.nixos-bgrt-plymouth];
    };
  };
}
