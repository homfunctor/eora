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
          complete_enabled = true;
          complete_close_braces = true;
          complete_ignore_case = 1;
          complete_smart_case = 1;
          fold_enabled = true;
          format_enabled = true;
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

    extraConfigLuaPre = ''
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".build"
      }
      vim.g.vimtex_mappings_enabled = 1
      vim.g.vimtex_quickfix_ignore_filters = { 'warning' }
      vim.g.vimtex_quickfix_open_on_warning = 0
    '';
  };
}
