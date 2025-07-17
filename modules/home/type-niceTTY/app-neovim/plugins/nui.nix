{config, ...}: let
  cfg = config.home.opts.nvim.plugins.nui;
in {
  programs.nixvim.plugins.nui.enable = cfg.enable;
}
