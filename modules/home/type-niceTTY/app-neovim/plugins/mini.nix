{
  config,
  lib,
  ...
}: let

  cfg = config.home.opts.nvim.plugins.mini;
in {
  programs.nixvim = lib.mkIf cfg.enable {
    plugins.mini = {
      enable = true;

      modules = {
        cursorword = {};

        # diff.view = {
        #   style = "sign";
        #   signs = {
        #     add = "│";
        #     change = "│";
        #     delete = "-";
        #   };
        # };
      };
    };

    #   highlight = with colors; {
    #     MiniDiffSignAdd.fg = base07;
    #     MiniDiffSignChange.fg = base03;
    #     MiniDiffSignDelete.fg = base06;
    #     MiniDiffOverAdd.fg = base04;
    #     MiniDiffOverChange.fg = base06;
    #     MiniDiffOverContext.fg = base0A;
    #     MiniDiffOverDelete.fg = base0F;
    #   };
  };
}
