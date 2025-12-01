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

    exec-once = ["${getExe pkgs.soteria}"];

    permission = [
      "${getExe hypr.grimblast.pkg}, screencopy, allow"
      "${getExe hypr.hyprlock.pkg}, screencopy, allow"
      "${getExe pkgs.grim}, screencopy, allow"
      "${hypr.portal.pkg}/libexec/${hypr.portal.exePath}, screencopy, allow"
    ];
  };
}
