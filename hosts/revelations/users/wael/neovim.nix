{lib, ...}: let
  enabledPlugins = [
    "blink"
    "bufferline"
    "colorizer"
    "conform"
    "fidget"
    "lint"
    "lsp"
    "lualine"
    "mini"
    "noice"
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
