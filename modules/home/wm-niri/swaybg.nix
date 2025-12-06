{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.home.opts.bg) files monitors;

  swaybgPkg = osConfig.nixos.opts.niri.bg.pkg;
in {
  home.packages = [swaybgPkg];

  programs.niri.settings.spawn-at-startup =
    lib.zipListsWith (m: b: {
      command = ["${lib.getExe swaybgPkg}" "--image" b "-o" m];
    })
    monitors
    files;
}
