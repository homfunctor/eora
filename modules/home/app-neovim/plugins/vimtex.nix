{
  programs.nixvim = {
    plugins.vimtex = {
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
        mappings_enabled = true;
        markdown_enabled = true;
        markdown_math = true;
        quickfix_mode = false;
        syntax_enabled = true;
      };
      texlivePackage = null;
    };

    extraConfigLuaPre = ''
      vim.g.vimtex_quickfix_ignore_filters = {'warning'}
        vim.g.vimtex_quickfix_open_on_warning = 0
    '';
  };
}
