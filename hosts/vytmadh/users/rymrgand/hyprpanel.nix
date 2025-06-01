# host-specific hyprpanel settings
{
  config = {
    home.opts = {
      hyprpanelLayout = {
        "bar.layouts" = {
          "*" = {
            left = [
              "power"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "clock"
              "battery"
            ];
            right = [
              "volume"
              "microphone"
              "systray"
              "notifications"
            ];
          };
        };
      };
      hyprpanelScale = 25;
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm app -- hyprpanel"
      # bluetooth
    ];
  };
}
