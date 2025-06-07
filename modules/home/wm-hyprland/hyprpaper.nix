# hyprpaper settings
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

  # wayland.windowManager.hyprland.settings.exec-once = [
  #   "systemctl --user enable --now hyprpaper.service"
  # ];
}
