{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.lastplace;
in {
  config = mkIf cfg.enable {
    programs.nixvim.plugins.lastplace.enable = true;
  };
}
