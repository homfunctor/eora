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
    "mini-indent"
    "mini-notify"
    "navic"
    "nvim-surround"
    "precognition"
    "rustaceanvim"
    "smartcolumn"
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
