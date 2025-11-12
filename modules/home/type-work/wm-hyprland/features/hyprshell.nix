{
  flake,
  inputs,
  lib,
  osConfig,
  ...
}: {
  imports = [inputs.hyprshell.homeModules.default];

  services.hyprshell = {
    enable = true;
    package = osConfig.nixos.opts.hypr.hyprshell.pkg;
    settings = {
      #todo
    };
    systemd.args = "-v";
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    (flake.lib.uApp "${lib.getExe osConfig.nixos.opts.hypr.hyprshell.pkg}")
  ];
}
