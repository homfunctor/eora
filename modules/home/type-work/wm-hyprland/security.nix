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
  wayland.windowManager.hyprland.settings = {
    ecosystem.enforce_permissions = true;
    permission = [
      "${getExe config.programs.hyprlock.package}, screencopy, allow"
      "${getExe config.services.hyprshell.package}, plugin, allow"
      "${getExe pkgs.grimblast}, screencopy, allow"
      "${getExe pkgs.grim}, screencopy, allow"
      "${getExe pkgs.hyprlandPlugins.hy3}, plugin, allow}"
      "${getExe pkgs.hyprpicker}, screencopy, allow"
      "${portalPackage}/libexec/${xdg}, screencopy, allow"
    ];
  };
}
