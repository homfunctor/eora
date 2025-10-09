# todo: configure further
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

        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
        nixvimInjections = true;

        settings = {
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = true;
            disable = ["latex"];
          };

          autoLoad = true;
          auto_install = true;
          folding = true;
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
        select = {
          enable = true;
          lookahead = true;
        };
      };
    };
  };
}
