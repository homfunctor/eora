{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.which-key;
in {
  programs.nixvim.plugins.which-key.enable = cfg.enable;
}
