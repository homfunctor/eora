{
  lib,
  perSystem,
  pkgs,
  ...
}: let
  inherit (lib) getExe;

  hyprpolkitPkg = perSystem.hyprpolkitagent.hyprpolkitagent;
in {
  home.packages = [
    hyprpolkitPkg
  ];

  wayland.windowManager.hyprland.settings.permission = [
    "${getExe pkgs.grim}, screencopy, allow"
    "${getExe pkgs.grimblast}, screencopy, allow"
    "${getExe pkgs.hyprpicker}, screencopy, allow"
    # todo: polkit, zoom (zen-browser???)
  ];
}
