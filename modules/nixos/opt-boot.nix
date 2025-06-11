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
      efi.canTouchEfiVariables = true;
      # overridden when lanzaboote is enabled
      systemd-boot.enable = mkDefault true;
    };

    plymouth = {
      enable = true;
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };

    # overridden when cachyos kernel is enabled
    kernelPackages = mkDefault pkgs.linuxPackages_latest;

    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "splash"
      "systemd.show_status=false"
    ];
  };
}
