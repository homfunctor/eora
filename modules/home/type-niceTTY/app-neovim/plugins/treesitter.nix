{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.treesitter;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
      tree-sitter
    ];
    programs.nixvim.plugins = {
      treesitter = {
        enable = true;

        nixvimInjections = true;

        settings = {
          autopairs.enable = true;
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = false;
            # vimtex compatibility
            disable = ["latex"];
          };

          auto_install = false;
          ensure_installed = [
            "bash"
            "c"
            "cpp"
            "fish"
            "haskell"
            "javascript"
            "json"
            "just"
            "lean"
            "lua"
            "markdown"
            "markdown_inline"
            "nix"
            "python"
            "qmljs"
            "rust"
            "typescript"
            "yaml"
          ];

          incremental_selection.enable = true;
          indent.enable = true;
        };
      };

      treesitter-context = {
        enable = true;
        settings = {
          max_lines = 8;
          min_window_height = 40;
          multiwindow = true;
          separator = "";
        };
      };

      treesitter-textobjects = {
        enable = true;
        settings.select = {
          enable = true;
          lookahead = true;
        };
      };
    };
  };
}
