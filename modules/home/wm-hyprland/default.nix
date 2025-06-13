{
  flake,
  perSystem,
  ...
}: let
  hyprlandPkg = perSystem.hyprland.hyprland;
in {
  imports = [
    ./binds.nix # keybinds common to all types
    ./dconf.nix # some dconf settings
    ./env.nix # environment settings
    ./hypridle.nix # hypridle settings
    ./hyprpaper.nix # common hyprpaper settings
    ./hyprlock.nix # hyprlock settings
    ./packages.nix # packages
    ./polkit.nix # polkit settings
    ./portal.nix # portal settings
    ./settings.nix # settings common to all types
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
