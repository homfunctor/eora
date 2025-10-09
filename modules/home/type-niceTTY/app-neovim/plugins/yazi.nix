{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.yazi;
in {
  config = lib.mkIf cfg.enable {
    programs.nixvim.plugins.yazi.enable = true;
  };
}
