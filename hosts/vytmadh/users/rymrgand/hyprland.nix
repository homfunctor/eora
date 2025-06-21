{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (config.lib.stylix) colors;
  inherit (lib) getExe mkForce;

  wallDir = "${inputs.sapadal}/assets";
  wall = "whitemarch.png";
in {
  config.home.opts = {
    hyprlandEnv = {
      browser = "${getExe pkgs.librewolf}";
      shell = "${getExe pkgs.fish}";
      terminal = "${getExe pkgs.alacritty}";
    };

    # wallpaper settings
    hyprpaperOpts.settings = {
      ipc = "off";
      splash = false;
      preload = [
        "${wallDir}/${wall}"
      ];

      wallpaper = [
        "eDP-1, ${wallDir}/${wall}"
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
      ];
    };
  };
}
