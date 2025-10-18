{lib, ...}: let
  enabledPlugins = [
    "blink"
    "bufferline"
    "colorizer"
    "conform"
    "leap"
    "lint"
    "lsp"
    "lualine"
    "mini"
    "mini-indentscope"
    "mini-notify"
    "nvim-surround"
    "precognition"
    "render-markdown"
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
