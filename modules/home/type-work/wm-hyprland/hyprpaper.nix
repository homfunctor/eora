{config, ...}: let
  inherit (config.home.opts) hyprpaperOpts;
in {
  services.hyprpaper = {
    enable = true;
    inherit (hyprpaperOpts) settings;
  };
}
