{lib, ...}: let
  enabledPlugins = [
    "blink"
    "bufferline"
    "colorizer"
    "conform"
    "lint"
    "lsp"
    "lualine"
    "mini"
    "mini-indentscope"
    "mini-notify"
    "nvim-surround"
    "precognition"
    "rustaceanvim"
    "smartcolumn"
    "treesitter"
    "undotree"
    "vimtex"
    "web-devicons"
    "which-key"
  ];
in {
  home.opts.nvim.plugins = lib.genAttrs enabledPlugins (_: {enable = true;});
}
