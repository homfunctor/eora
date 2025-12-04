{
  config,
  flake,
  lib,
  osConfig,
  ...
}: let
  inherit (flake.lib) splitArg;
  inherit (lib) getExe;
  opts = osConfig.nixos.opts.niri;
in {
  programs.niri.settings = {
    prefer-no-csd = true;

    screenshot-path = "${config.xdg.userDirs.pictures}/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png";
    spawn-at-startup = [
      {argv = [(getExe opts.bar.pkg)];}
      {argv = [(getExe opts.bg.pkg)] ++ splitArg opts.bg.args;}
    ];
  };
}
