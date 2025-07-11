{config, ...}: let
  cfg = config.home.opts.nvim.plugins.fidget;
in {
  programs.nixvim.plugins.fidget = {
    inherit (cfg) enable;

    settings = {
      notification.window = {
        border = "none";
        relative = "editor";
        winblend = 100;
      };
    };
  };
}
