{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.which-key;
in {
  programs.nixvim.plugins.which-key = lib.mkIf cfg.enable {
    enable = true;

    settings.win = {
      border = "none";
      wo.winblend = 100;
    };
  };
}
