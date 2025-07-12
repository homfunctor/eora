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
    home.packages = [pkgs.tree-sitter];

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
          indent.enable = true;
        };
      };

      treesitter-context = {
        enable = true;
        settings = {
          max_lines = 4;
          min_window_height = 40;
          multiwindow = true;
          separator = "-";
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
