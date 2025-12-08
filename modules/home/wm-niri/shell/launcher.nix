{
  config,
  lib,
  ...
}: {
  programs.noctalia-shell.settings.appLauncher = let
    niriExe = lib.getExe config.programs.niri.package;
  in {
    customLaunchPrefix = "${niriExe} msg action spawn -- ";
    customLaunchPrefixEnabled = true;
    terminalCommand = config.home.opts.apps.terminal.exe;
    viewMode = "grid";
  };
}
