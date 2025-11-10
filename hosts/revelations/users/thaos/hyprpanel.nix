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

    # todo: replace these cmon already
    leftcuts = {
      shortcut1 = {
        inherit (apps.browser) icon tooltip;
        command = apps.browser.exe;
      };

      shortcut2 = {
        command = "steam";
        icon = "󰓓";
        tooltip = "Steam";
      };

      shortcut3 = {
        inherit (apps.terminal) icon tooltip;
        command = apps.terminal.exe;
      };

      shortcut4 = {
        command = "${apps.terminal.exe} ${lib.getExe config.programs.yazi.package} ~/eora";
        icon = "";
        tooltip = "Browse Flake";
      };
    };

    rightcuts = {
      shortcut1 = {
        inherit (apps.video) icon tooltip;
        command = apps.video.exe;
      };

      shortcut3 = {
        inherit (apps.audio) icon tooltip;
        command = apps.audio.exe;
      };
    };

    leftdirs = {
      directory1 = {
        command = "${apps.directory.exe} ${apps.directory.args}";
        label = "󰋜 Home";
      };

      directory2 = {
        command = "${apps.directory.exe} ${apps.directory.args} Nix";
        label = " Nix";
      };

      directory3 = {
        command = "${apps.directory.exe} ${apps.directory.args} Rust";
        label = "󱘗 Rust";
      };
    };

    rightdirs = {
      directory1 = {
        command = "${apps.directory.exe} ${apps.directory.args} Books";
        label = "󱉟 Books";
      };

      directory2 = {
        command = "${apps.directory.exe} ${apps.directory.args} Math";
        label = "󰿈 Math";
      };

      directory3 = {
        command = "${apps.directory.exe} ${apps.directory.args} Downloads";
        label = "󰇚 Downloads";
      };
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    (lib.getExe config.programs.hyprpanel.package)
  ];
}
