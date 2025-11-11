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
  home.pointerCursor.hyprcursor.enable = true;

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

      systemd = {
        enable = true;

        extraCommands = lib.mkBefore [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];

        variables = [
          "DISPLAY"
          "HYPRLAND_INSTANCE_SIGNATURE"
          "WAYLAND_DISPLAY"
          "XDG_CURRENT_DESKTOP"
        ];
      };
    };
    systemd.target = "graphical-session.target";
  };
}
