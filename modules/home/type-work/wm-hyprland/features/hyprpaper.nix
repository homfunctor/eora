{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit
    (config.home.opts.bg)
    files
    monitors
    ;
in {
  services.hyprpaper = {
    enable = true;
    package = osConfig.nixos.opts.hypr.hyprpaper.pkg;

    settings = {
      ipc = "off";
      preload = files;
      splash = false;
      wallpaper = lib.zipListsWith (m: f: "${m}, ${f}") monitors files;
    };
  };
}
