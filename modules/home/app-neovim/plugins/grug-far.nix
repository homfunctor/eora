{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.opts.home.nvim.plugins.grug-far;
in {
  programs.nixvim.plugins.grug-far.enable = cfg.enable;
}
