{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.nvim.plugins.smartcolumn;
in {
  programs.nixvim.plugins.smartcolumn = mkIf cfg.enable {
    enable = true;
    settings.colorcolumn = "80";
  };
}
