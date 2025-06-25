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
    "grug-far"
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
