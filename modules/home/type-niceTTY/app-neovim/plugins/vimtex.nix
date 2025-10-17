# todo: setup auto-close environments
{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.vimtex;
in {
  programs.nixvim = lib.mkIf cfg.enable {
    plugins = {
      lsp.servers.texlab.enable = true;
      vimtex = {
        enable = true;

        settings = {
          compiler_method = "latexmk";
          compiler_latexmk = {
            options = [
              "-pdf"
              "-shell-escape"
              "-file-line-error"
              "-synctex=1"
              "-interaction=nonstopmode"
            ];
          };
          complete_close_braces = true;
          complete_enabled = true;
          complete_ignore_case = 1;
          complete_smart_case = 1;
          fold_enabled = true;
          format_enabled = false;
          imaps_enabled = false;
          indent_enabled = true;
          quickfix_mode = false;
          syntax_enabled = true;
          view_method = "zathura";
        };

        # installed elsewhere
        texlivePackage = null;
      };
    };

    # luatex, tex-fmt, stash garbage in .build
    extraConfigLuaPre = ''
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".build",
        options = {
          "-lualatex",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-shell-escape"
        },
        build_dir = ".build",
        callback = 1,
        continuous = 1
      }

      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_mappings_enabled = 1
      vim.g.vimtex_quickfix_ignore_filters = { 'warning' }
      vim.g.vimtex_quickfix_open_on_warning = 0

      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-lualatex"
      }

      vim.g.vimtex_format_enabled = 0
    '';
  };
}
