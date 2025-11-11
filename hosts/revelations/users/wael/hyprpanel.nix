{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) apps;
in {
  home.opts.panelOpts = {
    layouts = {
      # DP-1
      "0" = {
        "left" = [
          "dashboard"
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "ram"
          "cpu"
          "clock"
          "cava"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
        ];
      };

      # HDMI-A-1
      "2" = {
        "left" = [
          "dashboard"
          "workspaces"
          "windowtitle"
        ];
        "middle" = [
          "ram"
          "cpu"
          "clock"
          "cava"
        ];
        "right" = [
          "volume"
          "microphone"
          "systray"
          "notifications"
        ];
      };

      # DP-3
      "1" = {
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

    leftcuts = {
      shortcut1 = {
        inherit (apps.browser) icon tooltip;
        command = uApp apps.browser.exe;
      };

      shortcut2 = {
        command = uApp "steam";
        icon = "󰓓";
        tooltip = "Steam";
      };

      shortcut3 = {
        inherit (apps.terminal) icon tooltip;
        command = uApp apps.terminal.exe;
      };

      shortcut4 = {
        command = uApp "${apps.terminal.exe} ${lib.getExe config.programs.yazi.package} ~/eora";
        icon = "";
        tooltip = "Browse Flake";
      };
    };

    rightcuts = {
      shortcut1 = {
        inherit (apps.video) icon tooltip;
        command = uApp apps.video.exe;
      };

      shortcut3 = {
        inherit (apps.audio) icon tooltip;
        command = uApp apps.audio.exe;
      };
    };

    leftdirs = {
      directory1 = {
        command = uApp "${apps.directory.exe} ${apps.directory.args}";
        label = "󰋜 Home";
      };

      directory2 = {
        command = uApp "${apps.directory.exe} ${apps.directory.args} Nix";
        label = " Nix";
      };

      directory3 = {
        command = uApp "${apps.directory.exe} ${apps.directory.args} Rust";
        label = "󱘗 Rust";
      };
    };

    rightdirs = {
      directory1 = {
        command = uApp "${apps.directory.exe} ${apps.directory.args} Books";
        label = "󱉟 Books";
      };

      directory2 = {
        command = uApp "${apps.directory.exe} ${apps.directory.args} Math";
        label = "󰿈 Math";
      };

      directory3 = {
        command = uApp "${apps.directory.exe} ${apps.directory.args} Downloads";
        label = "󰇚 Downloads";
      };
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    (uApp (lib.getExe config.programs.hyprpanel.package))
  ];
}
