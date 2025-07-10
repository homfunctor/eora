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
    "mini-indentscope"
    "mini-notify"
    "navic"
    "nvim-surround"
    "precognition"
    "rustaceanvim"
    "smartcolumn"
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
