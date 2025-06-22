{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.wayland.windowManager.hyprland) portalPackage;
  inherit (lib) getExe;

  xdg = ".xdg-desktop-portal-hyprland-wrapped";
in {
  home.packages = with pkgs; [
    hyprpolkitagent
  ];

  wayland.windowManager.hyprland.settings.permission = [
    "${getExe pkgs.grim}, screencopy, allow"
    "${getExe pkgs.grimblast}, screencopy, allow"
    "${getExe pkgs.hyprpicker}, screencopy, allow"
    "${portalPackage}/libexec/${xdg}, screencopy, allow"
  ];
}
