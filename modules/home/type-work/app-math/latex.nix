{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  conformEnabled = config.home.opts.nvim.plugins.conform.enable;

  cfg = config.home.opts.app-math.latex;
in {
  config = mkIf cfg.enable {
    home.packages = [pkgs.texliveFull];

    programs = {
      # latex formatter
      # vimtex handled in "path-to-neovim-config"/plugins/vimtex.nix
      nixvim.plugins.conform-nvim.settings = mkIf conformEnabled {
        formatters_by_ft.tex = ["tex-fmt"];
      };
      tex-fmt = {
        enable = true;
        settings = {
          check = false;
          lists = [];
          print = false;
          stdin = false;
          tabchar = "space";
          tabsize = 2;
          verbosity = "warn";
          wrap = true;
          wraplen = 80;
        };
      };
    };
  };
}
