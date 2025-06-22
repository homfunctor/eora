{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.undotree;
in {
  programs.nixvim.plugins.undotree.enable = cfg.enable;
}
