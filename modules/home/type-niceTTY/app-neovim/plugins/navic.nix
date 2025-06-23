{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.nvim.plugins.navic;
in {
  programs.nixvim.plugins.navic = mkIf cfg.enable {
    enable = true;

    settings.lsp.auto_attach = true;
  };
}
