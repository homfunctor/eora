{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.colorizer;
in {
  programs.nixvim.plugins.colorizer.enable = cfg.enable;
}
