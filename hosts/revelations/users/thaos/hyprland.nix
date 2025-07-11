{inputs, ...}: let
  wallDir = "${inputs.sapadal}/assets";
  wall1 = "base2.png";
  wall2 = "base.png";
  wall3 = "base3.png";
in {
  home.opts.hpl = {
    paperOpts .settings = {
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

    # user settings
    userOpts = {
      tabletOutput = "DP-2";

      general = {
        border_size = 5;
        gaps_in = 5;
        gaps_out = 5;
        layout = "dwindle";
        resize_on_border = true;
      };

      monitor = [
        "DP-1, 1680x1050, 0x0, 1"
        "DP-2, 1920x1080, 1680x0, 1"
        "DP-3, 1366x768, 3600x0, 1"
      ];

      workspace = [
        # 3 monitors, DP-2 is main/middle
        "1, monitor:DP-1"
        "4, monitor:DP-1"
        "2, monitor:DP-2"
        "5, monitor:DP-2"
        "3, monitor:DP-3"
        "6, monitor:DP-3"
      ];
    };
  };
}
