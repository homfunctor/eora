{config, ...}: let
  # only one monitor
  mainMonitor = builtins.elemAt config.home.opts.bg.monitors 0;
in {
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 5;
      gaps_in = 0;
      gaps_out = 0;
      layout = "dwindle";
      resize_on_border = true;
    };

    # external monitors for work
    # mirror laptop monitor
    monitor = ["HDMI-A-2, preferred, auto, 1, mirror, eDP-1"];
  };
}
