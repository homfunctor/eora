{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.illuminate;
in {
  programs.nixvim.plugins.illuminate.enable = cfg.enable;
}
