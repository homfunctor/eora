{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.plugins.mini-indent;
in {
  programs.nixvim = mkIf cfg.enable {
    plugins.mini.indent = {};
  };
}
