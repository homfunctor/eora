# hyprland settings for rymrgand
{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkForce;
  inherit (config.home.opts) hyprlandOpts hyprpaperOpts;
  inherit (config.lib.stylix) colors;
  wallDir = "${inputs.sapadal}/assets";
  wall = "whitemarch.png";
in {
  config = {
    # wallpaper settings
    home.opts = {
      hyprpaperOpts.settings = {
        ipc = "off";
        splash = false;
        preload = [
          "${wallDir}/${wall}"
        ];

        wallpaper = [
          ", ${wallDir}/${wall}"
        ];
      };

      # hyprland settings specific to personal computer
      hyprlandOpts = {
        general = with colors; {
          "col.active_border" = mkForce "rgb(${base0D})";
          "col.inactive_border" = mkForce "rgb(${base02})";

          border_size = 5;
          gaps_in = 0;
          gaps_out = 0;
          layout = "dwindle";
          resize_on_border = true;
        };

        monitor = [];

        workspace = [
          # smart gaps
          "w[t1], gapsout:0, gapsin:0"
          "w[tg1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
          # 3 monitors, DP-2 is main/middle
          # "1, monitor:DP-1"
          # "2, monitor:DP-2"
          # "3, monitor:DP-3"
          # "4, monitor:DP-1"
          # "5, monitor:DP-2"
          # "6, monitor:DP-3"
        ];
      };
    };
  };
}
