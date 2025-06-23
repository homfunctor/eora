{
  config,
  # lib,
  ...
}: let
  # inherit (lib) mkIf;
  cfg = config.home.opts.nvim.plugins.precognition;
in {
  programs.nixvim.plugins.precognition.enable = cfg.enable;
}
