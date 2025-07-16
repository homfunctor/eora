{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.noice;
in {
  programs.nixvim.plugins.noice = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      presets.bottom_search = true;
      views = {
        cmdline_popup = {
          border.style = "none";
          position = {
            row = -2;
            col = "20%";
          };
        };

        cmdline_popupmenu = {
          border.style = "none";
          position = {
            row = -5;
            col = "20%";
          };
        };

        mini.win_options.winblend = 0;
      };
    };
  };
}
