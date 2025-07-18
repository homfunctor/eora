{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.snacks;
in {
  programs.nixvim.plugins.snacks = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      bigfile.enabled = true;

      indent = {
        enabled = true;
        chunk = {
          enabled = true;
          char = {
            arrow = "─";
            corner_bottom = "└";
            corner_top = "┌";
          };
          hl = "SnacksIndentScope";
          only_current = true;
        };
      };

      input.enabled = true;

      notifier = {
        enabled = true;
        style = "minimal";
        top_down = false;
      };

      scope.enabled = true;

      statuscolumn.enabled = true;
      styles.notification.wo.wrap = true;

      win.backdrop.blend = 100;

      words.enabled = true;
    };
  };
}
