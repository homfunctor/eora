{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.opts.home.nvim.plugins.colorizer;
in {
  programs.nixvim.plugins.colorizer.enable = cfg.enable;
}
