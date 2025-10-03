{
  config,
  lib,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;

  cfg = config.home.opts.nvim.plugins.render-markdown;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      marksman
      python312Packages.pylatexenc
    ];
    programs.nixvim = {
      plugins.render-markdown = {
        enable = true;
        settings = {
          heading = {
            border = true;
            icons = [
              "1 "
              "2 "
              "3 "
              "4 "
              "5 "
              "6 "
            ];
          };

          filetypes = ["markdown"];

          highlights = {
            code_block = {
              background = "none";
              blend = 0;
            };

            link = {
              underline = true;
              italic = true;
            };
          };

          window = {
            border = "single";
            width = 80;
            height = 20;
          };

          sync_scroll = {
            enabled = true;
            mode = "relative";
          };

          performance = {
            debounce = {
              enabled = true;
              milliseconds = 50;
            };
            max_file_size = 1024 * 100;
          };
        };
      };

      autoCmd = [
        {
          event = ["FileType"];
          pattern = ["markdown"];
          command = "setlocal wrap linebreak";
        }
        {
          event = ["FileType"];
          pattern = ["markdown"];
          command = "setlocal conceallevel=2";
        }
      ];

      extraConfigLua = with colors; ''
        vim.api.nvim_set_hl(0, 'RenderMarkdownBorder', { link = 'Normal' })

        vim.api.nvim_set_hl(0, 'RenderMarkdownHeading1', { bold = true, foreground = '${base0E}' })
        vim.api.nvim_set_hl(0, 'RenderMarkdownHeading2', { bold = true, foreground = '${base0A}' })
        vim.api.nvim_set_hl(0, 'RenderMarkdownHeading3', { bold = true, foreground = '${base08}' })
        vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { background = '${base02}', foreground = '${base07}' })
        vim.api.nvim_set_hl(0, 'RenderMarkdownBlockquote', { italic = true, foreground = '${base03}'})

        -- Force non-rounded borders in the render window
        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'render-markdown',
          callback = function()
            vim.opt_local.winhl = 'Normal:Normal,NormalNC:Normal,FloatBorder:Normal'
          end
        })
      '';
    };
  };
}
