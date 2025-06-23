{
  config,
  lib,
  ...
}: {
  networking = {
    inherit (config.nixos.opts) hostName;

    firewall.enable = true;

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.powersave = true;
    };

    useDHCP = lib.mkDefault true;
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
