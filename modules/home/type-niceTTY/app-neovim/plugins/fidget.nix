{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.fidget;
in {
  programs.nixvim.plugins.fidget = lib.mkIf cfg.enable {
    enable = true;
    settings = {
      notification.window = {
        border = "none";
        relative = "editor";
        winblend = 100;
        zindex = 45;
      };
      progress.display.progress_icon = ["moon"];
    };
  };
}
