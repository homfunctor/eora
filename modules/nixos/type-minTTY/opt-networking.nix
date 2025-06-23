# networking settings
{
  config,
  lib,
  ...
}: let
  inherit (config.nixos.opts) hostname;
  inherit (lib) mkDefault;
in {
  networking = {
    firewall.enable = true;

    hostName = hostname;

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.powersave = true;
    };

    useDHCP = mkDefault true;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    resolved = {
      enable = true;
      dnsovertls = "opportunistic";
    };
  };
}
