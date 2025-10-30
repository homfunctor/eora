{config, ...}: let
  cfg = config.home.opts.nvim.plugins.nerdy;
in {
  programs.nixvim.plugins.nerdy.enable = cfg.enable;
}
