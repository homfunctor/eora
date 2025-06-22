{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.home.opts.app-math.octave;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      octaveFull
    ];
  };
}
