{
  config,
  flake,
  lib,
  pkgs,
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
          "cpu"
          "ram"
          "clock"
          "battery"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
          "notifications"
        ];
      };
    };

    scale = {
      bar = 75;
      battery = 70;
      clock = 60;
      dashboard = 60;
      notification = 75;
      notifications = 60;
      osd = 75;
      popover = 60;
      power = 75;
      volume = 75;
    };

    # todo
    leftcuts = {
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
        command = uApp "kitty";
        icon = "";
        tooltip = "kitty";
      };

      shortcut4 = {
        command = uApp "kitty eora -e yazi";
        icon = "󰼪";
        tooltip = "Browse Flake";
      };
    };

    rightcuts = {
      shortcut1 = {
        command = uApp "chromium";
        icon = "";
        tooltip = "Chromium";
      };

      shortcut3 = {
        command = uApp "strawberry";
        icon = "󰝚";
        tooltip = "Strawberry";
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
    (uApp (toString (lib.getExe pkgs.blueman-applet)))
    (uApp (toString (lib.getExe config.programs.hyprpanel.package)))
  ];
}
