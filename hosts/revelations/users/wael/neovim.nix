{lib, ...}: let
  enabledPlugins = [
    "blink"
    "bufferline"
    "colorizer"
    "conform"
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
    "web-devicons"
    "which-key"
    "yazi"
  ];
in {
  home.opts.nvim.plugins = lib.genAttrs enabledPlugins (_: {enable = true;});
}
