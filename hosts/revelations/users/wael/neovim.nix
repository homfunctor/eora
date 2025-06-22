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
    "precognition"
    "rustaceanvim"
    "smartcolumn"
    "snacks"
    "treesitter"
    "undotree"
    "vimtex"
    "which-key"
    "yazi"
  ];
in {
  config.home.opts.nvim.plugins = genAttrs enabledPlugins (
    _: {
      enable = true;
    }
  );
}
