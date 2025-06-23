# boot settings
{
  lib,
  pkgs,
  ...
}: {
  boot = {
    consoleLogLevel = 3;

    initrd = {
      supportedFilesystems = ["ext4"];
      systemd.enable = true;
    };

    # overridden when cachyos kernel is enabled
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "splash"
      "systemd.show_status=false"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      # overridden when lanzaboote is enabled
      systemd-boot.enable = lib.mkDefault true;
    };

    plymouth = {
      enable = true;
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };
  };
}
