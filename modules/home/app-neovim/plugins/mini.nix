{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  colors = config.lib.stylix.colors.withHashtag;

  cfg = config.opts.home.nvim.plugins.mini;
in {
  programs.nixvim = mkIf cfg.enable {
    plugins.mini = {
      enable = true;
      mockDevIcons = true;

      modules = {
        ai = {
          n_lines = 50;
          search_method = "cover_or_next";
        };
        cursorword = {};
        icons = {};
        snippets = {};
        surround = {};

        diff.view = {
          style = "sign";
          signs = {
            add = "│";
            change = "│";
            delete = "-";
          };
        };
      };
    };

    highlight = with colors; {
      MiniDiffSignAdd.fg = base07;
      # MiniDiffSignChange.fg = base03;
      # MiniDiffSignDelete.fg = base06;
      # MiniDiffOverAdd.fg = base04;
      # MiniDiffOverChange.fg = base06;
      # MiniDiffOverContext.fg = base0A;
      # MiniDiffOverDelete.fg = base0F;
    };
  };
}
