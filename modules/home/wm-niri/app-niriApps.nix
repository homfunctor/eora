{osConfig, ...}: let
  inherit (osConfig.nixos) opts;
in {
  programs = {
    swaylock = {
      enable = true;
      package = opts.niri.locker.pkg;
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
