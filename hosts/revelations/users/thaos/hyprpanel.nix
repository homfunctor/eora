# host-specific hyprpanel settings
{
  config = {
    home.opts.hyprpanelLayout = {
      "0" = {
        "left" = ["power" "workspaces" "windowtitle"];
        "middle" = ["clock"];
        "right" = ["volume" "microphone" "systray" "notifications"];
      };

      "1" = {
        "left" = ["workspaces" "windowtitle"];
        "middle" = ["clock"];
        "right" = ["volume" "microphone" "systray" "notifications"];
      };

      "2" = {
        "left" = ["workspaces" "windowtitle"];
        "middle" = ["clock"];
        "right" = ["volume" "microphone" "systray"];
      };
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm app -- hyprpanel"
    ];
  };
}
