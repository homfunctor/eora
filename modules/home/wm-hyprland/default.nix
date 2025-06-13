{
  flake,
  perSystem,
  ...
}: let
  hyprlandPkg = perSystem.hyprland.hyprland;
in {
  imports = [
    ./binds.nix
    ./dconf.nix
    ./env.nix
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./packages.nix
    ./polkit.nix
    ./portal.nix
    ./settings.nix
    flake.modules.home.app-hyprpanel
  ];

  wayland = {
    windowManager.hyprland = {
      enable = true;
      package = hyprlandPkg;
      xwayland.enable = true;

      settings.exec-once = [
        "uwsm finalize"
        "hyprctl setcursor"
        "uwsm app -- nm-applet"
      ];
    };
    systemd.target = "graphical-session.target";
  };
}
