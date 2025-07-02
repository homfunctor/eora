{
  config,
  lib,
  ...
}: let
  inherit (lib) genAttrs;

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
  config.home.opts.nvim.plugins = genAttrs enabledPlugins (
    _: {
      enable = true;
    }
  );
}
