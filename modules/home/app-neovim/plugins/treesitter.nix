{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.treesitter;
in {
  programs.nixvim = mkIf cfg.enable {
    plugins = {
      treesitter = {
        enable = true;

        folding = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
        nixvimInjections = true;

        settings = {
          indent.enable = true;
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = true;
            disable = [
              "latex"
              "markdown"
            ];
          };
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
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ut";
        action = "<cmd>TSContextToggle<cr>";
        options = {
          desc = "Treesitter Context toggle";
        };
      }
    ];
  };
}
