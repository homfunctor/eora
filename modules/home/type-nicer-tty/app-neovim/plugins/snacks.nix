{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  colors = config.lib.stylix.colors.withHashtag;

  cfg = config.home.opts.nvim.plugins.snacks;
in {
  programs.nixvim = mkIf cfg.enable {
    plugins.snacks = {
      enable = true;

      settings = {
        animate.enabled = true;

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
