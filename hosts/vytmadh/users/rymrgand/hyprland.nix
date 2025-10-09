_: {
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 5;
      gaps_in = 0;
      layout = "dwindle";
      resize_on_border = true;
    };

    input = {
      touchpad = {
        disable_while_typing = true;
        natural_scroll = 1;
        # dedicated buttons exist
        clickfinger_behavior = 0;
        tap-to-click = 0;
        # dedicated middle button exists
        middle_button_emulation = 0;
      };
    };
    # external monitors for work
    # mirror laptop monitor
    monitor = ["HDMI-A-2, preferred, auto, 1, mirror, eDP-1"];
  };
}
