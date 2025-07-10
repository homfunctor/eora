{
  flake,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./animations.nix
    ./binds.nix
    ./cosmic-greeter.nix
    ./env.nix
    ./etc.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./polkit.nix
    ./portal.nix
    ./rules.nix
    flake.modules.home.app-hyprpanel
  ];

  # enable and use uwsm
  wayland = {
    windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings.exec-once = [
        "uwsm finalize"
        "hyprctl setcursor"
        (flake.lib.uApp "${lib.getExe pkgs.networkmanagerapplet}")
      ];
    };
    systemd.target = "graphical-session.target";
  };
}
