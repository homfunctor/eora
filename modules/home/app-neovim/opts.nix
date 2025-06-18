{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkBoolOpt mkListOpt;
  inherit (lib) genAttrs types;

  pluginList = [
    "alpha"
    "blink"
    "colorizer"
    "conform"
    "lastplace"
    "lint"
    "lsp"
    "lualine"
    "mini"
    "noice"
    "nvim-surround"
    "precognition"
    "rustaceanvim"
    "snacks"
    "treesitter"
    "vimtex"
    "which-key"
  ];
in {
  options.opts.home.nvim = {
    plugins = genAttrs pluginList (
      pluginName: {
        enable = mkBoolOpt false "enable ${pluginName}";
      }
    );

    defaultPluginList = mkListOpt types.str pluginList "default list of plugins to enable";
  };
}
