{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.noice;
in {
  programs.nixvim.plugins.noice = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      cmdline = {
        enabled = true;
        format = {
          cmdline = {
            icon = "";
            lang = "vim";
            pattern = "^:";
          };
        };
        view = "cmdline_popup";
      };

      health.checker = true;

      lsp.documentation = {
        opts = {
          render = "plain";
          replace = true;
          win_options = {
            winhighlight = {
              Normal = "NormalFloat";
              FloatBorder = "FloatBorder";
            };
            concealcursor = "n";
            conceallevel = 3;
          };
        };

        view = "hover";

        hover.enabled = true;

        message = {
          enabled = true;
          view = "notify";
        };

        progress = {
          enabled = true;
          format = "lsp_progress";
          formatDone = "lsp_progress";
          view = "mini";
        };
      };

      messages = {
        enabled = true;
        view = "notify";
        view_error = "mini";
        view_history = "messages";
        view_search = "virtualtext";
        view_warn = "mini";
      };

      notify = {
        enabled = true;
        view = "notify";
      };

      popupmenu = {
        enabled = true;
        backend = "nui";
        kindIcons = true;
      };

      presets = {
        bottom_search = true;
        command_palette = true;
        inc_rename = false;
        long_message_to_split = true;
        lsp_doc_border = false;
      };

      views = {
        cmdline_popup.border.style = "none";
        cmdline_popupmenu.border.style = "none";
      };
    };
  };
}
