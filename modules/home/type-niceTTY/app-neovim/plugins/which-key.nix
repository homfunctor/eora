{config, ...}: let
  cfg = config.home.opts.nvim.plugins.which-key;
in {
  programs.nixvim.plugins.which-key.enable = cfg.enable;
}
