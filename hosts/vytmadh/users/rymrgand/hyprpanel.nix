{
  config,
  flake,
  lib,
  ...
}: let
  inherit (config.home.opts) apps;
  inherit (flake.lib) uApp;
in {
  home.opts.panelOpts = {
    fontSize = "1.0rem";

    layouts."*" = {
      "left" = [
        "dashboard"
        "separator"
        "workspaces"
        "separator"
        "windowtitle"
        "separator"
      ];
      "middle" = [
        "ram"
        "separator"
        "cpu"
        "separator"
        "clock"
        "separator"
        "battery"
        "separator"
      ];
      "right" = [
        "volume"
        "separator"
        "microphone"
        "separator"
        "systray"
        "separator"
        "notifications"
        "separator"
        "power"
      ];
    };

    scale = {
      clock = 75;
      dashboard = 75;
      media = 75;
      notification = 75;
      notifications = 75;
      osd = 75;
      popover = 75;
      power = 75;
      volume = 75;
    };

    leftcuts = {
      shortcut1 = {
        inherit (apps.browser) icon tooltip;
        command = uApp apps.browser.exe;
      };

      shortcut2 = {
        # todo
        # command =
        # icon =
        # tooltip =
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
