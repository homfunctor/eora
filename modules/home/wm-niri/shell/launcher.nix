{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    app2unit
    xdg-terminal-exec-mkhl
  ];

  programs.noctalia-shell.settings.appLauncher = {
    useApp2Unit = true;
    terminalCommand = config.home.opts.apps.terminal.exe + " -e";
    viewMode = "grid";
  };
}
