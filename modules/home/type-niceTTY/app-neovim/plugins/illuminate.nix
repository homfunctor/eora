{config, ...}: let
  cfg = config.home.opts.nvim.plugins.illuminate;
in {
  programs.nixvim.plugins.illuminate.enable = cfg.enable;
}
