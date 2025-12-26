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
    enableClipPreview = false;
    enableClipboardHistory = false;
    iconMode = "native";
    showCategories = true;
    sortByMostUsed = false;
    terminalCommand = config.home.opts.apps.terminal.exe + " -e";
    useApp2Unit = true;
    viewMode = "grid";
  };
}
