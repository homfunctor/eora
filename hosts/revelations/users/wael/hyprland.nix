{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (config.lib.stylix) colors;
  inherit (lib) mkForce;

  wallDir = "${inputs.sapadal}/assets";
  wall1 = "pillars_desert.png";
  wall2 = "rivendell.png";
  wall3 = "allgods.png";
in {
  config = {
    # to deal with primary monitor being DP-2, not DP-1
    home.packages = with pkgs; [
      xorg.xrandr
    ];
    wayland.windowManager.hyprland.settings.exec-once = [
      # set primary monitor for games using xwayland
      "uwsm app -- xrandr --output DP-2 --primary"
    ];

    # wallpaper settings
    home.opts = {
      hyprpaperOpts.settings = {
        ipc = "off";
        splash = false;
        preload = [
          "${wallDir}/${wall1}"
          "${wallDir}/${wall2}"
          "${wallDir}/${wall3}"
        ];

        wallpaper = [
          "DP-1, ${wallDir}/${wall1}"
          "DP-2, ${wallDir}/${wall2}"
          "DP-3, ${wallDir}/${wall3}"
        ];
      };

      # hyprland settings specific to personal computer
      hyprlandOpts = {
        general = with colors; {
          "col.active_border" = mkForce "rgb(${base0D})";
          "col.inactive_border" = mkForce "rgb(${base02})";

          border_size = 7;
          gaps_in = 5;
          gaps_out = 11;
          layout = "dwindle";
          resize_on_border = true;
        };

        monitor = [
          "DP-1, 1680x1050, 0x0, 1"
          "DP-2, 1920x1080, 1680x0, 1"
          "DP-3, 1366x768, 3600x0, 1"
        ];

        workspace = [
          # smart gaps
          "w[t1], gapsout:0, gapsin:0"
          "w[tg1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
          # 3 monitors, DP-2 is main/middle
          "1, monitor:DP-1"
          "2, monitor:DP-2"
          "3, monitor:DP-3"
          "4, monitor:DP-1"
          "5, monitor:DP-2"
          "6, monitor:DP-3"
        ];
      };
    };
  };
}
