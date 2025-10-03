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
    home.packages = [pkgs.marksman];
    programs.nixvim = {
      plugins.render-markdown = {
        enable = true;
        settings = {
          render = {
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
          };

          ui = {
            toggle = {
              enabled = true;
              keymap = {
                focus = "<leader>mf";
                toggle = "<leader>mr";
                update = "<leader>mu";
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
      };
      keymaps = [
        {
          key = "<leader>mr";
          action = "<cmd>MarkdownRenderToggle<cr>";
          options.desc = "Toggle markdown rendering";
        }
        {
          key = "<leader>mf";
          action = "<cmd>MarkdownRenderFocus<cr>";
          options.desc = "Focus markdown render window";
        }
        {
          key = "<leader>mu";
          action = "<cmd>MarkdownRenderUpdate<cr>";
          options.desc = "Update markdown render";
        }
      ];

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

        vim.api.nvim_set_hl(0, 'RenderMarkdownHeading1', { bold = true, foreground = ${base0E} })
        vim.api.nvim_set_hl(0, 'RenderMarkdownHeading2', { bold = true, foreground = ${base0A} })
        vim.api.nvim_set_hl(0, 'RenderMarkdownHeading3', { bold = true, foreground = ${base08} })
        vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { background = ${base02}, foreground = ${base07} })
        vim.api.nvim_set_hl(0, 'RenderMarkdownBlockquote', { italic = true, foreground = ${base03}})

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
