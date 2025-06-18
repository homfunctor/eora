{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.opts.home.nvim.plugins.illuminate;
in {
  programs.nixvim.plugins.illuminate.enable = cfg.enable;
}
