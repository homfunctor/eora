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
        bigfile.enabled = true;

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

        notify.enabled = true;
        notifier = {
          enabled = true;
          style = "fancy";
          timeout = 3000;
        };

        scroll.enabled = true;
      };
    };

    highlight = with colors; {
      SnacksIndent.fg = base03;
      SnacksIndentScope.fg = base08;
    };
  };
}
