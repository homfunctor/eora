{
  config,
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) uApp;
in {
  home.opts.hpl.panelOpts = {
    layout = {
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

    scale = {
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

    # todo
    leftcuts = {
      shortcut1 = {
        command = uApp "rnote";
        icon = "󰠮";
        tooltip = "Rnote";
      };

      shortcut2 = {
        command = uApp "";
        icon = "?";
        tooltip = "todo";
      };

      shortcut3 = {
        command = uApp "kitty";
        icon = "";
        tooltip = "kitty";
      };

      shortcut4 = {
        command = uApp "onlyoffice-desktopeditors";
        icon = "󰏫";
        tooltip = "OnlyOffice";
      };
    };

    rightcuts = {
      shortcut1 = {
        command = uApp "chromium";
        icon = "";
        tooltip = "Chromium";
      };

      shortcut3 = {
        command = uApp "inkscape";
        icon = "";
        tooltip = "Inkscape";
      };
    };

    leftdirs = {
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

    rightdirs = {
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
    (uApp "${toString lib.getExe config.programs.hyprpanel.package}")
  ];
}
