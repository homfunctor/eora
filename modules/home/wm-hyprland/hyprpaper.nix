{
  config,
  # perSystem,
  pkgs,
  ...
}: let
  inherit (config.home.opts) hyprpaperOpts;

  # hyprpaperPkg = perSystem.hyprpaper.default;
  hyprpaperPkg = pkgs.hyprpaper;
in {
  services.hyprpaper = {
    enable = true;
    package = hyprpaperPkg;
    inherit (hyprpaperOpts) settings;
  };
}
