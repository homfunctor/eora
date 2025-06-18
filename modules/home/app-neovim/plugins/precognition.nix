{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.opts.home.nvim.plugins.precognition;
in {
  programs.nixvim.plugins.precognition.enable = cfg.enable;
}
