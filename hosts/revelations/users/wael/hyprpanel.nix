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
          "cpu"
          "ram"
          "clock"
          "cava"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
          "power"
        ];
      };

      "1" = {
        "left" = [
          "dashboard"
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "cpu"
          "ram"
          "clock"
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
          "clock"
          "cava"
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
        command = uApp "vivaldi";
        icon = "";
        tooltip = "Vivaldi";
      };

      shortcut2 = {
        command = uApp "steam";
        icon = "󰓓";
        tooltip = "Steam";
      };

      shortcut3 = {
        command = uApp "alacritty";
        icon = "";
        tooltip = "Alacritty";
      };

      shortcut4 = {
        command = uApp "alacritty --working-directory eora -e yazi";
        icon = "󰼪";
        tooltip = "Browse Flake";
      };
    };

    hplRightcuts = {
      shortcut1 = {
        command = uApp "librewolf";
        icon = "󰈹";
        tooltip = "Librewolf";
      };

      shortcut3 = {
        command = uApp "strawberry";
        icon = "󰝚";
        tooltip = "Strawberry";
      };
    };

    hplDirleft = {
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

    hplDirright = {
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
