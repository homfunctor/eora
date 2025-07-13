{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.app-math.geogebra;
in {
  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.geogebra6];
  };
}
