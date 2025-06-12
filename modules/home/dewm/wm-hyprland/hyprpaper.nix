{
  config,
  lib,
  perSystem,
  ...
}: let
  inherit (config.home.opts) hyprpaperOpts;
  inherit (lib) mkIf;

  hyprpaperPkg = perSystem.hyprpaper.default;

  cfg = config.home.opts.dewm.wm-hyprland;
in {
  config.services.hyprpaper = mkIf cfg.enable {
    enable = true;
    package = hyprpaperPkg;
    inherit (hyprpaperOpts) settings;
  };
}
