{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.app-math.octave;
in {
  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.octaveFull];
  };
}
