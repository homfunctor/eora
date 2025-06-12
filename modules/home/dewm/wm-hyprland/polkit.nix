{
  config,
  lib,
  perSystem,
  pkgs,
  ...
}: let
  inherit (lib) getExe mkIf;

  hyprpolkitPkg = perSystem.hyprpolkitagent.hyprpolkitagent;

  cfg = config.home.opts.dewm.wm-hyprland;
in {
  config = mkIf cfg.enable {
    home.packages = [
      hyprpolkitPkg
    ];

    wayland.windowManager.hyprland.settings.permission = [
      "${getExe pkgs.grim}, screencopy, allow"
      "${getExe pkgs.grimblast}, screencopy, allow"
      "${getExe pkgs.hyprpicker}, screencopy, allow"
      # todo: polkit, zoom (zen-browser???)
    ];
  };
}
