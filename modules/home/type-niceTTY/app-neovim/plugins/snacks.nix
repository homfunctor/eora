{
  config,
  lib,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;

  cfg = config.home.opts.nvim.plugins.snacks;
in {
  programs.nixvim = lib.mkIf cfg.enable {
    plugins.snacks = {
      enable = true;

      settings = {
        # todo: check if this isn't needed when using neovide
        # animate.enabled = true;

        indent = {
          enabled = true;
          chunk = {
            enabled = true;
            char = {
              arrow = "─";
              corner_top = "┌";
              corner_bottom = "└";
            };
            hl = "SnacksIndentScope";
            only_current = true;
          };
        };

        input.enabled = true;

        scroll.enabled = true;
      };
    };

    highlight = with colors; {
      SnacksIndent.fg = base02;
      SnacksIndentScope.fg = base0C;
    };
  };
}
