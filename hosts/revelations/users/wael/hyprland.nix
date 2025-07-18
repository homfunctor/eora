{
  config,
  pkgs,
  ...
}: let
  # assumes main monitor is 2nd in list
  mainMonitor = builtins.elemAt config.home.opts.bg.monitors 1;
in {
  # to deal with primary monitor being DP-2, not DP-1
  home.packages = with pkgs; [
    xorg.xrandr
  ];

  wayland.windowManager.hyprland.settings = {
    device = [
      {
        enabled = true;
        name = "huion-huion-tablet_h1060p";
        output = mainMonitor;
      }
    ];

    exec-once = [
      # set primary monitor for games using xwayland
      "xrandr --output ${mainMonitor} --primary"
    ];
  };
}
