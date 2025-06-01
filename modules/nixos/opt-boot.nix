# boot settings
{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkDefault;
in {
  boot = {
    consoleLogLevel = 3;

    initrd = {
      supportedFilesystems = ["ext4"];
      systemd.enable = true;
    };

    loader = {
      systemd-boot.enable = mkDefault true;
      efi.canTouchEfiVariables = true;
    };

    plymouth = {
      enable = true;
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };

    kernelPackages = mkDefault pkgs.linuxPackages_latest;

    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "splash"
      "systemd.show_status=false"
    ];
  };
}
