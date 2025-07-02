{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  colors = config.lib.stylix.colors.withHashtag;

  cfg = config.home.opts.nvim.plugins.mini;
in {
  programs.nixvim = mkIf cfg.enable {
    plugins.mini = {
      enable = true;

      modules = {
        cursorword = {};
        icons = {};

        diff.view = {
          style = "sign";
          signs = {
            add = "│";
            change = "│";
            delete = "-";
          };
        };

        snippets = {};
      };
    };

    highlight = with colors; {
      MiniDiffSignAdd.fg = base07;
      MiniDiffSignChange.fg = base03;
      MiniDiffSignDelete.fg = base06;
      MiniDiffOverAdd.fg = base04;
      MiniDiffOverChange.fg = base06;
      MiniDiffOverContext.fg = base0A;
      MiniDiffOverDelete.fg = base0F;
    };
  };
}
