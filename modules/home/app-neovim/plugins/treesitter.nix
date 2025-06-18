{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.plugins.treesitter;
in {
  programs.nixvim = mkIf cfg.enable {
    plugins = {
      treesitter = {
        enable = true;

        folding = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
        nixvimInjections = true;

        settings = {
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = true;
            disable = [
              "latex" # vimtex takes over here
            ];
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
    };
  };
}
