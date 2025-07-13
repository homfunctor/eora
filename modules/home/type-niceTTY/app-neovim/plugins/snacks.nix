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

      scope.enabled = true;

      # scroll.enabled = true;

      styles.notification.wo.wrap = true;

      win.backdrop.blend = 0;

      words.enabled = true;
    };
  };
}
