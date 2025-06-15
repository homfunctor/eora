{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.colorizer;
in {
  config = mkIf cfg.enable {
    programs.nixvim.plugins.colorizer.enable = true;
  };
}
