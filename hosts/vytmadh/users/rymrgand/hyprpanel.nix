# host-specific hyprpanel settings
{
  config = {
    home.opts.hyprpanelLayout = {
      "*" = {
        "left" = ["workspaces" "windowtitle"];
        "middle" = ["ram" "clock" "battery"];
        "right" = ["volume" "microphone" "systray" "notifications"];
      };
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm app -- hyprpanel"
      "uwsm app -- blueman-applet"
    ];
  };
}
