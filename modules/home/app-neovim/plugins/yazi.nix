{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.plugins.yazi;
in {
  config = mkIf cfg.enable {
    programs.nixvim.plugins.yazi.enable = true;
  };
}
