{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.nvim-surround;
in {
  config = mkIf cfg.enable {
    programs.nixvim.plugins.nvim-surround.enable = true;
  };
}
