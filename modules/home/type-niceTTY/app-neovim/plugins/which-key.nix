{config, ...}: let
  cfg = config.home.opts.nvim.plugins.which-key;
in {
  programs.nixvim.plugins.which-key = {
    inherit (cfg) enable;

    settings.win = {
      border = "none";
      wo.winblend = 0;
    };
  };
}
