{config, ...}: let
  cfg = config.home.opts.nvim.plugins.nvim-surround;
in {
  programs.nixvim.plugins.nvim-surround.enable = cfg.enable;
}
