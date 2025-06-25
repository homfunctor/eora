{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.nvim.plugins.mini-notify;
in {
  programs.nixvim = mkIf cfg.enable {
    plugins.mini.modules.notify = {};
  };
}
