{config, ...}: let
  cfg = config.home.opts.nvim.plugins.bufferline;
in {
  programs.nixvim.plugins.bufferline.enable = cfg.enable;
}
