{config, ...}: let
  cfg = config.home.opts.nvim.plugins.leap;
in {
  programs.nixvim.plugins.leap.enable = cfg.enable;
}
