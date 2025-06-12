{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.dewm.wm-hyprland;
in {
  config.xdg.portal = mkIf cfg.enable {
    enable = true;

    config = {
      common = {
        default = ["hyprland"];
      };
      hyprland = {
        default = ["gtk" "hyprland"];
      };
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    xdgOpenUsePortal = true;
  };
}
