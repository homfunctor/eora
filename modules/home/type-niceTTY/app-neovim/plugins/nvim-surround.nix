{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.nvim-surround;
in {
  programs.nixvim.plugins.nvim-surround.enable = cfg.enable;
}
