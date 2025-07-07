{flake, ...}: let
  inherit (flake.lib) uApp;
in {
  home.opts = {
    hplLayout = {
      "0" = {
        "left" = [
          "dashboard"
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "clock"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
        ];
      };

      "1" = {
        "left" = [
          "dashboard"
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "clock"
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
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "clock"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
          "power"
        ];
      };
    };

    hplScale = {
      clock = 85;
      dashboard = 80;
      media = 75;
      notification = 80;
      notifications = 75;
      osd = 80;
      popover = 90;
      power = 75;
      volume = 75;
    };

    hplLeftcuts = {
      shortcut1 = {
      };

      shortcut2 = {
      };

      shortcut3 = {
        command = uApp "alacritty";
        icon = "";
        tooltip = "Alacritty";
      };

      shortcut4 = {
      };
    };

    hplRightcuts = {
      shortcut1 = {
        command = uApp "chromium";
        icon = "";
        tooltip = "Chromium";
      };

      shortcut3 = {
      };
    };

    hplLeftdir = {
      directory1 = {
        command = uApp "nautilus -w";
        label = "󰋜 Home";
      };

      directory2 = {
        command = uApp "nautilus -w Nix";
        label = " Nix";
      };

      directory3 = {
        command = uApp "nautilus -w Rust";
        label = "󱘗 Rust";
      };
    };

    hplRightdir = {
      directory1 = {
        command = uApp "nautilus -w Books";
        label = "󱉟 Books";
      };

      directory2 = {
        command = uApp "nautilus -w Math";
        label = "󰿈 Math";
      };

      directory3 = {
        command = uApp "nautilus -w Downloads";
        label = "󰇚 Downloads";
      };
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    (uApp "hyprpanel")
  ];
}
