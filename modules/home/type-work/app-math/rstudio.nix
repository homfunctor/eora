{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.home.opts.app-math.rstudio;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rstudio
    ];
  };
}
