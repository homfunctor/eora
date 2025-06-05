# host-specific hyprpanel settings
{
  config = {
    home.opts.hyprpanelLayout = {
      "*" = {
        "left" = ["workspaces" "windowtitle"];
        "middle" = ["cpu" "clock" "battery"];
        "right" = ["volume" "microphone" "systray" "notifications"];
      };
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm app -- blueman-applet"
      "uwsm app -- hyprpanel"
    ];
  };
}
