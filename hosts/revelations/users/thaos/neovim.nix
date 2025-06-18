{
  config,
  lib,
  ...
}: let
  inherit (lib) genAttrs;

  enabledPlugins = [
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
  config.opts.home.nvim.plugins = genAttrs enabledPlugins (
    _: {
      enable = true;
    }
  );
}
