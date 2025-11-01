{
  flake,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./animations.nix
    ./binds.nix
    ./env.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./keyring.nix
    ./portal.nix
    ./rules.nix
    ./security.nix
    ./settings.nix
    flake.modules.home.app-hyprpanel
  ];

  # temp
  home.packages = [pkgs.opentabletdriver];

  # enable and use uwsm
  wayland = {
    windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings.exec-once = [
        "uwsm finalize"
        "hyprctl setcursor"
        (flake.lib.uApp "${lib.getExe pkgs.networkmanagerapplet}")
        "${pkgs.opentabletdriver}/bin/otd-daemon"
      ];
    };
    systemd.target = "graphical-session.target";
  };
}
