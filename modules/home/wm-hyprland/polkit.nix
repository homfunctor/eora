{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
in {
  home.packages = with pkgs; [
    hyprpolkitagent
  ];

  wayland.windowManager.hyprland.settings.permission = [
    "${getExe pkgs.grim}, screencopy, allow"
    "${getExe pkgs.grimblast}, screencopy, allow"
    "${getExe pkgs.hyprpicker}, screencopy, allow"
    # todo: polkit, zoom
  ];
}
