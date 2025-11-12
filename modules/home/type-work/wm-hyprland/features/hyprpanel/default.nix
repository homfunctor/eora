{
  flake,
  lib,
  osConfig,
  ...
}: {
  imports = [
    ./bar.nix
    ./notBar.nix
    ./themeColors.nix
    ./themeUI.nix
  ];

  programs.hyprpanel = {
    enable = true;
    package = osConfig.nixos.opts.hypr.hyprpanel.pkg;
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    (flake.lib.uApp "${lib.getExe osConfig.nixos.opts.hypr.hyprpanel.pkg}")
  ];
}
