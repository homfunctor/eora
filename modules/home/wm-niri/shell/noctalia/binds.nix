{
  config,
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) splitArg;
  inherit (lib) getExe;

  noctCmd = cmd:
    [(getExe config.programs.noctalia-shell.package) "ipc" "call"]
    ++ (splitArg cmd);
in {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+R".action.spawn = noctCmd "launcher toggle";
    "Mod+X".action.spawn = noctCmd "sessionMenu toggle";
    "Mod+MouseMiddle" = {
      allow-when-locked = true;
      action.spawn = noctCmd "volume muteOutput";
    };
    "Mod+MouseBack".action.spawn = noctCmd "volume decrease";
    "Mod+MouseForward".action.spawn = noctCmd "volume increase";
  };
}
