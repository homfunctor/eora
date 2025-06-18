{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  colors = config.lib.stylix.colors.withHashtag;

  cfg = config.opts.home.nvim.plugins.snacks;
in {
  programs.nixvim = mkIf cfg.enable {
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
