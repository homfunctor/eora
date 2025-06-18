{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.opts.home.nvim.plugins.persistence;
in {
  programs.nixvim.plugins.persistence.enable = cfg.enable;
}
