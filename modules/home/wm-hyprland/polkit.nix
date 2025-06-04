# polkit
{
  lib,
  perSystem,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
in {
  home.packages = [
    perSystem.hyprpolkitagent.hyprpolkitagent
  ];

  wayland.windowManager.hyprland.settings.permission = [
    "${getExe pkgs.grimblast}, screencopy, allow"
    "${getExe pkgs.grim}, screencopy, allow"
    "${getExe pkgs.hyprpicker}, screencopy, allow"
    # todo: polkit?
  ];
}
