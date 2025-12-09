{
  config,
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (config.home.opts) apps userName;
  inherit (flake.lib) splitArg;
  inherit (lib) getExe;

  nExe = cmd:
    [(getExe config.programs.noctalia-shell.package) "ipc" "call"]
    ++ (splitArg cmd);
  homeDir = "/home/${userName}";
  workTime = "Fall2025";
in {
  programs.niri = {
    settings = {
      binds = with config.lib.niri.actions; {
        # applications
        "Mod+E".action.spawn = [apps.directory.exe] ++ (splitArg apps.directory.args);
        "Mod+Shift+E".action.spawn =
          [apps.terminal.exe]
          ++ (splitArg (getExe pkgs.yazi))
          ++ ["${homeDir}/eora"];

        "Mod+W".action.spawn = apps.terminal.exe;
        "Mod+Shift+W".action.spawn = [apps.terminal.exe "${homeDir}/eora"];
        "Mod+Ctrl+Shift+W".action.spawn = [
          apps.terminal.exe
          (getExe pkgs.yazi)
          "${homeDir}/Work/${workTime}"
        ];

        "Mod+Ctrl+Shift+C".action.spawn = getExe pkgs.gnome-calculator;
        "Mod+Ctrl+Shift+J".action.spawn = getExe pkgs.xournalpp;

        "Mod+R".action.spawn = nExe "launcher toggle";
        "Mod+X".action.spawn = nExe "sessionMenu toggle";
        "Mod+O".action = toggle-overview;
        # temp because dock stubbornly re-enables itself
        "Mod+Shift+O".action.spawn = nExe "dock toggle";

        "Mod+Alt+L".action.spawn = getExe pkgs.swaylock;

        # window management
        "Mod+Q".action = close-window;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+S".action = switch-preset-column-width;
        "Mod+T".action = toggle-window-floating;

        # window height adjustment within column (vim-like)
        # todo

        # focus window movement
        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-monitor-down;
        "Mod+K".action = focus-monitor-up;
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-column-to-workspace-up;
        "Mod+Shift+J".action = move-column-to-workspace-down;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-monitor-down;
        "Mod+Up".action = focus-monitor-up;
        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Down".action = move-column-to-workspace-up;
        "Mod+Shift+Up".action = move-column-to-workspace-down;

        # screenshots
        "Print".action.screenshot.show-pointer = false;

        "Mod+MouseMiddle" = {
          allow-when-locked = true;
          action.spawn = nExe "volume muteOutput";
        };
        "Mod+MouseBack".action.spawn = nExe "volume decrease";
        "Mod+MouseForward".action.spawn = nExe "volume increase";

        # workspaces
        "Mod+1".action.focus-workspace = "1";
        "Mod+2".action.focus-workspace = "2";
        "Mod+3".action.focus-workspace = "3";
        "Mod+Shift+1".action.focus-workspace = "4";
        "Mod+Shift+2".action.focus-workspace = "5";
        "Mod+Shift+3".action.focus-workspace = "6";

        # moving windows
        "Mod+Ctrl+1".action.move-window-to-workspace = [{focus = false;} "1"];
        "Mod+Ctrl+2".action.move-window-to-workspace = [{focus = false;} "2"];
        "Mod+Ctrl+3".action.move-window-to-workspace = [{focus = false;} "3"];
        "Mod+Ctrl+Shift+1".action.move-window-to-workspace = [
          {focus = false;}
          "4"
        ];
        "Mod+Ctrl+Shift+2".action.move-window-to-workspace = [
          {focus = false;}
          "5"
        ];
        "Mod+Ctrl+Shift+3".action.move-window-to-workspace = [
          {focus = false;}
          "6"
        ];
      };

      switch-events = {
        # todo
        # lid-close
        # lid-open
      };
    };
  };
}
