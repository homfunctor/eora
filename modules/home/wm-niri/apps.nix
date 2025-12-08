{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    libsecret
    networkmanagerapplet
    systemctl-tui
    wayland-utils
    xsel
    xwayland-satellite
  ];

  programs.noctalia-shell.settings.appLauncher = let
    niriExe = lib.getExe config.programs.niri.package;
  in {
    # causing issues
    # customLaunchPrefix = "${niriExe} msg action spawn --";
    # customLaunchPrefixEnabled = true;
    terminalCommand = config.home.opts.apps.terminal.exe;
    viewMode = "grid";
  };
}
