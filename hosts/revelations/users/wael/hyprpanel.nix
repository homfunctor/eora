{flake, ...}: {
  home.opts = {
    hplLayout = {
      "0" = {
        "left" = [
          "power"
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
        ];
      };

      "1" = {
        "left" = [
          "power"
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
        ];
      };

      "2" = {
        "left" = [
          "power"
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
