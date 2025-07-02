{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.web-devicons;
in {
  programs.nixvim.plugins.web-devicons.enable = cfg.enable;
}
