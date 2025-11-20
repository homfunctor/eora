{
  flake,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  imports = [
    ./animations.nix
    ./binds.nix
    ./env.nix
    ./features
    ./keyring.nix
    ./portal.nix
    ./rules.nix
    ./security.nix
    ./settings.nix
    inputs.hyprland.homeManagerModules.default
  ];

  wayland = {
    windowManager.hyprland = {
      enable = true;
      package = osConfig.nixos.opts.hypr.hyprland.pkg;
      xwayland.enable = true;

      importantPrefixes = [
        "$"
        "bezier"
        "name"
        "source"
        "exec-once"
      ];

      settings.exec-once = [
        "uwsm finalize"
        "hyprctl setcursor"
        (flake.lib.uApp "${lib.getExe pkgs.networkmanagerapplet}")
      ];

      # conflicts with uwsm
      systemd.enable = false;
    };
    systemd.target = "graphical-session.target";
  };
}
