{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkBoolOpt;
  inherit (lib) genAttrs;

  pluginList = [
    "blink"
    "colorizer"
    "conform"
    "fidget"
    "grug-far"
    "illuminate"
    "lint"
    "lsp"
    "lualine"
    "mini"
    "mini-indent"
    "mini-notify"
    "navic"
    "nvim-surround"
    "persistence"
    "precognition"
    "rustaceanvim"
    "smartcolumn"
    "snacks"
    "treesitter"
    "vimtex"
    "which-key"
    "yazi"
  ];
in {
  options.opts.home.nvim.plugins = genAttrs pluginList (
    pluginName: {
      enable = mkBoolOpt false "enable ${pluginName}";
    }
  );
}
