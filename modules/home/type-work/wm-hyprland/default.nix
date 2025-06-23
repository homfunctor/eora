{flake, ...}: {
  imports = [
    ./binds.nix
    ./dconf.nix
    ./env.nix
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./polkit.nix
    ./portal.nix
    ./settings.nix
    flake.modules.home.app-hyprpanel
  ];

  wayland = {
    windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings.exec-once = [
        "uwsm finalize"
        "hyprctl setcursor"
        (flake.lib.uApp "nm-applet")
      ];
    };
    systemd.target = "graphical-session.target";
  };
}
