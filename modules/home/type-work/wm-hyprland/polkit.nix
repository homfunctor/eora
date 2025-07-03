# todo: check if there's any need to mess with systemd service files
# todo: check if auto-runs
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.wayland.windowManager.hyprland) portalPackage;
  inherit (lib) getExe;

  polkitPkg = pkgs.hyprpolkitagent;
  xdg = ".xdg-desktop-portal-hyprland-wrapped";
in {
  home.packages = [polkitPkg];

  wayland.windowManager.hyprland.settings = {
    ecosystem.enforce_permissions = true;
    permission = [
      "${getExe pkgs.grim}, screencopy, allow"
      "${getExe pkgs.grimblast}, screencopy, allow"
      "${getExe pkgs.hyprpicker}, screencopy, allow"
      "${portalPackage}/libexec/${xdg}, screencopy, allow"
    ];
  };
}
