{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.lualine;
in {
  config = mkIf cfg.enable {
    programs.nixvim.plugins.lualine.enable = true;
  };
}
