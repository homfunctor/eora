{
  lib,
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
  ];

  wayland = {
    windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      xwayland.enable = true;

      importantPrefixes = [
        "$"
        "bezier"
        "name"
        "source"
        "exec-once"
      ];

      settings.exec-once = [
        "hyprctl setcursor"
        "${lib.getExe pkgs.networkmanagerapplet}"
      ];

      systemd.enable = true;
    };
    systemd.target = "graphical-session.target";
  };
}
