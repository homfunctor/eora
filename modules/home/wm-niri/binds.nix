# very wip
{
  config,
  inputs,
  lib,
  osConfig,
  ...
}: let
  inherit (config.home.opts) apps;
  inherit (lib.strings) splitString;
in {
  programs.niri = {
    settings = {
      binds = with config.lib.niri.actions; {
        "Mod+R".action =
          spawn (["${apps.launcher.exe}"]
            ++ (splitString " " apps.launcher.args));

        "Mod+W".action = spawn apps.terminal.exe;

        "Mod+Q".action = close-window;

        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = expand-column-to-available-width;

        "Mod+T".action = toggle-window-floating;

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-column-to-workspace-up;
        "Mod+Shift+J".action = move-column-to-workspace-down;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-workspace-down;
        "Mod+Up".action = focus-workspace-up;
      };
    };
  };
}
