{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.which-key;
in {
  config = mkIf cfg.enable {
    programs.nixvim.plugins.which-key.enable = true;
  };
}
