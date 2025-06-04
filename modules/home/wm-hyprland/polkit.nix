# polkit
{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
in {
  home.packages = with pkgs; [
    # might as well go full mate
    mate.mate-polkit
  ];

  wayland.windowManager.hyprland.settings.permission = [
    "${getExe pkgs.grimblast}, screencopy, allow"
    "${getExe pkgs.grim}, screencopy, allow"
    "${getExe pkgs.hyprpicker}, screencopy, allow"
  ];
}
