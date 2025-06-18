{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.opts.home.nvim.plugins.fidget;
in {
  programs.nixvim.plugins.fidget.enable = cfg.enable;
}
