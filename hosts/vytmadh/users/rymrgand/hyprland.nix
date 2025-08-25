{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 5;
      gaps_in = 0;
      gaps_out = 0;
      layout = "dwindle";
      resize_on_border = true;
    };

    device = [
      {
        enabled = true;
        name = "huion-huion-tablet_h1060p";
        output = "eDP-1";
      }
    ];

    # external monitors for work
    # mirror laptop monitor
    monitor = ["HDMI-A-2, 1920x1080, auto, 1, mirror, eDP-1"];
  };
}
