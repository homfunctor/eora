{config, ...}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.nixvim = {
    plugins.snacks = {
      enable = true;

      settings = {
        animate.enabled = true;

        indent = {
          indent.enabled = true;
          chunk = {
            enabled = true;
            only_current = true;
            char = {
              arrow = "─";
              corner_top = "┌";
              corner_bottom = "└";
            };
            hl = "SnacksIndentScope";
          };
        };
      };
    };

    highlight = with colors; {
      SnacksIndent.fg = base02;
      SnacksIndentScope.fg = base0C;
    };
  };
}
