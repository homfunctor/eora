{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.mini-notify;
in {
  programs.nixvim = lib.mkIf cfg.enable {
    plugins.mini.modules.notify = {
      window = {
        config = {};
        winblend = 100;
      };
    };
  };
}
