{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.navic;
in {
  programs.nixvim.plugins.navic = lib.mkIf cfg.enable {
    enable = true;
    settings.lsp.auto_attach = true;
  };
}
