{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./animations.nix
    ./binds.nix
    # todo: what is to be done
    # ./env.nix
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
      xwayland.enable = true;

      settings.exec-once = [
        "hyprctl setcursor"
        "${lib.getExe pkgs.networkmanagerapplet}"
      ];
    };
    systemd.target = "graphical-session.target";
  };
}
