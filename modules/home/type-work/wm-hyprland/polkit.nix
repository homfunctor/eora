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

  systemd.user.services.hyprpolkitagent = {
    Install.WantedBy = ["graphical-session.target"];
    Unit.Description = "hyprpolkitagent";

    Service = {
      ExecStart = "${polkitPkg}/libexec/hyprpolkitagent";
      Nice = "-20";
      Restart = "on-failure";
      StartLimitBurst = 60;
      StartLimitIntervalSec = 60;
    };
  };

  wayland.windowManager.hyprland.settings.permission = [
    "${getExe pkgs.grim}, screencopy, allow"
    "${getExe pkgs.grimblast}, screencopy, allow"
    "${getExe pkgs.hyprpicker}, screencopy, allow"
    "${portalPackage}/libexec/${xdg}, screencopy, allow"
  ];
}
