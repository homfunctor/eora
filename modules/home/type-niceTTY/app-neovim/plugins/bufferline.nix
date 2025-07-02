{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.bufferline;
in {
  programs.nixvim.plugins.bufferline.enable = cfg.enable;
}
