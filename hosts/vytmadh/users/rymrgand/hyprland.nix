{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;

  wallDir = "${inputs.sapadal}/assets";
  wall = "whitemarch.png";
in {
  home = {
    packages = with pkgs; [
      hyprland-monitor-attached
    ];

    opts = {
      hyprlandEnv = {
        browser = "${getExe pkgs.chromium}";
        editor = "${getExe config.programs.nixvim.package}";
        shell = "${getExe pkgs.fish}";
        terminal = "${getExe pkgs.alacritty}";
      };

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
        general = {
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
  };
}
