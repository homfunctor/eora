{config, ...}: let
  cfg = config.home.opts.nvim.plugins.undotree;
in {programs.nixvim.plugins.undotree.enable = cfg.enable;}
