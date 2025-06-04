# hyprpaper settings
{
  config,
  lib,
  perSystem,
  ...
}: let
  inherit (lib) mkForce;
  inherit (config.home.opts) hyprpaperOpts;
  hyprpaperPkg = perSystem.hyprpaper.default;
in {
  services.hyprpaper = {
    enable = true;
    package = hyprpaperPkg;
    inherit (hyprpaperOpts) settings;
  };

  systemd.user.services.hyprpaper = {
    Unit.After = mkForce "config.wayland.systemd.target";
  };
}
