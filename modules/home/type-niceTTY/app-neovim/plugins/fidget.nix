{config, ...}: let
  cfg = config.home.opts.nvim.plugins.fidget;
in {
  programs.nixvim.plugins.fidget.enable = cfg.enable;
}
