# todo: not working on vytmadh???
{
  config,
  perSystem,
  ...
}: let
  inherit (config.home.opts) hyprpaperOpts;

  hyprpaperPkg = perSystem.hyprpaper.default;
in {
  services.hyprpaper = {
    enable = true;
    package = hyprpaperPkg;
    inherit (hyprpaperOpts) settings;
  };
}
