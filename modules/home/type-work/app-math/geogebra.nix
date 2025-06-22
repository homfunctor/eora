{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.app-math.geogebra;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      geogebra6
    ];
  };
}
