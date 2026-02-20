{lib, ...}: let
  enabledPlugins = [
    # "blink"
    # "bufferline"
    # "colorizer"
    # "conform"
    # "lint"
    # "lsp"
    # "lualine"
    # "mini"
    # "noice"
    # "precognition"
    # "render-markdown"
    # "rustaceanvim"
    # "smartcolumn"
    # "snacks"
    # "treesitter"
    # "undotree"
    # "vimtex"
    # "web-devicons"
    # "which-key"
  ];
in {
  home.opts.nvim.plugins = lib.genAttrs enabledPlugins (_: {enable = true;});
}
