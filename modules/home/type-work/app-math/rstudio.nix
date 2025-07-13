{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.app-math.rstudio;
in {
  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.rstudio];
  };
}
