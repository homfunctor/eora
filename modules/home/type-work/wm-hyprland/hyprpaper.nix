{
  config,
  lib,
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
    settings = {
      ipc = "off";
      preload = files;
      splash = false;
      wallpaper = lib.zipListsWith (m: f: "${m}, ${f}") monitors files;
    };
  };
}
