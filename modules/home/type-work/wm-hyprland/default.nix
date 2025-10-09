{
  flake,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./animations.nix
    ./binds.nix
    # ./cosmic-greeter.nix
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

  # enable and use uwsm
  wayland = {
    windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings.exec-once = [
        "uwsm finalize"
        "hyprctl setcursor"
        (flake.lib.uApp "${lib.getExe pkgs.networkmanagerapplet}")
        # temp hack until this gets fixed
        "sudo rm -f /tmp/CoreFxPipe_OpenTabletDriver.* && ${pkgs.opentabletdriver}/bin/otd-daemon"
      ];
    };
    systemd.target = "graphical-session.target";
  };
}
