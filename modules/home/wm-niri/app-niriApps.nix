{osConfig, ...}: let
  inherit (osConfig.nixos) opts;
in {
  programs = {
    swaylock = {
      enable = true;
      package = opts.niri.locker.pkg;

      settings = {};
    };

    waybar = {
      enable = true;
      package = opts.niri.bar.pkg;
      systemd.enable = true;

      settings = {};
    };
  };

  services = {
    swayidle = {
      enable = true;
      package = opts.niri.idle.pkg;
    };
  };
}
