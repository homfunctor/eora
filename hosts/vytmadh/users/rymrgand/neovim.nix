{
  config,
  flake,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (lib) attrsets;
  inherit (lib.attrsets) nameValuePair;

  enabledPlugins = [
    "alpha"
    "colorizer"
    "conform"
    "lastplace"
    "lint"
    "lsp"
    "lualine"
    "mini"
    "nvim-surround"
    "precognition"
    "rustaceanvim"
    "snacks"
    "treesitter"
    "vimtex"
    "which-key"
  ];
in {
  config.opts.home.nvim = listToAttrs (
    map (
      pluginName:
        nameValuePair pluginName {
          enable = true;
        }
    )
    enabledPlugins
  );
}
