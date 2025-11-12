{
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  inherit (osConfig.nixos.opts) hypr;
in {
  wayland.windowManager.hyprland.settings = {
    ecosystem.enforce_permissions = true;
    permission = [
      "${getExe hypr.hyprlock.pkg}, screencopy, allow"
      "${getExe hypr.hyprshell.pkg}, plugin, allow"
      "${getExe hypr.grimblast.pkg}, screencopy, allow"
      "${getExe pkgs.grim}, screencopy, allow"
      "${hypr.hy3.pkg}/lib/libhy3.so, plugin, allow"
      "${getExe hypr.hyprpicker.pkg}, screencopy, allow"
      "${hypr.portal.pkg}/libexec/${hypr.portal.exePath}, screencopy, allow"
    ];
  };
}
