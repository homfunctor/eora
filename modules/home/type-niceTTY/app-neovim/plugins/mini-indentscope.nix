{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.mini-indentscope;
in {
  programs.nixvim = lib.mkIf cfg.enable {
    plugins.mini.modules.indentscope = {};
  };
}
