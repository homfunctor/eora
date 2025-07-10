{
  inputs,
  pkgs,
  ...
}: let
  wallDir = "${inputs.sapadal}/assets";
  wall = "whitemarch.png";
in {
  home = {
    packages = with pkgs; [
      hyprland-monitor-attached
      nwg-displays
    ];

    opts.hpl = {
      paperOpts.settings = {
        preload = [
          "${wallDir}/${wall}"
        ];

        wallpaper = [
          "eDP-1, ${wallDir}/${wall}"
        ];
      };

      # user settings
      userOpts = {
        tabletOutput = "eDP-1";

        general = {
          border_size = 5;
          gaps_in = 0;
          gaps_out = 0;
          layout = "dwindle";
          resize_on_border = true;
        };

        workspace = [
          "1, monitor:eDP-1"
          "4, monitor:eDP-1"
          "2, monitor:eDP-1"
          "5, monitor:eDP-1"
          "3, monitor:eDP-1"
          # change this to external monitor
          "6, monitor:eDP-1"
        ];
      };
    };
  };
}
