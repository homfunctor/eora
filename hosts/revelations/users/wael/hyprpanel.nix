{flake, ...}: {
  home.opts = {
    hplLayout = {
      "0" = {
        "left" = [
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "cpu"
          "ram"
          "storage"
          "clock"
          "media"
          "cava"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
          "notifications"
          "power"
        ];
      };

      "1" = {
        "left" = [
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "cpu"
          "ram"
          "storage"
          "clock"
          "media"
          "cava"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
          "notifications"
          "power"
        ];
      };

      "2" = {
        "left" = [
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "cpu"
          "ram"
          "storage"
          "clock"
          "media"
          "cava"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
          "notifications"
          "power"
        ];
      };
    };

    hplScale = {
      clock = 85;
      notification = 80;
      notifications = 75;
      osd = 80;
      popover = 90;
      power = 75;
      volume = 75;
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    (flake.lib.uApp "hyprpanel")
  ];
}
