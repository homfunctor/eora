{osConfig, ...}: let
  inherit (osConfig.nixos) opts;
in {
  services = {
    swayidle = {
      enable = true;
      package = opts.niri.idle.pkg;
    };
  };
}
