# networking settings
{
  config,
  lib,
  ...
}: let
  inherit (lib) mkDefault;
in {
  networking = {
    hostName = config.nixos.opts.hostname;
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.powersave = true;
    };

    firewall.enable = true;
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
