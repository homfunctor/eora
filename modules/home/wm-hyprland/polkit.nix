# polkit
{
  lib,
  perSystem,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  portalPkg = perSystem.hyprland.xdg-desktop-portal-hyprland;
  portalName = ".xdg-desktop-portal-hyprland-wrapped";
in {
  home.packages = with perSystem; [
    hyprpolkitagent.default
  ];

  wayland.windowManager.hyprland.settings.permission = [
    "${getExe pkgs.grimblast}, screencopy, allow"
    "${getExe pkgs.grim}, screencopy, allow"
    "${getExe pkgs.hyprpicker}, screencopy, allow"
    "${portalPkg}/libexec/${portalName}, screencopy, allow"
  ];
}
