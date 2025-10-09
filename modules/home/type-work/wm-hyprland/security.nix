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
    exec-once = ["systemctl --user start hyprpolkitagent"];
    permission = [
      "${getExe pkgs.grim}, screencopy, allow"
      "${getExe pkgs.grimblast}, screencopy, allow"
      "${getExe pkgs.hyprpicker}, screencopy, allow"
      "${portalPackage}/libexec/${xdg}, screencopy, allow"
      "${getExe config.programs.hyprlock.package}, screencopy, allow"
    ];
  };
}
