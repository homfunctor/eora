{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.nvim.plugins.grug-far;
in {
  config = mkIf cfg.enable {
    home.packages = [pkgs.ast-grep];
    programs.nixvim.plugins.grug-far.enable = true;
  };
}
