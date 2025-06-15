{
  flake,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (flake.lib) mkBoolOpt;
  inherit (lib) attrsets;
  inherit (lib.attrsets) nameValuePair;

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
  options.opts.home.nvim = listToAttrs (
    map (
      pluginName:
        nameValuePair pluginName {
          enable = mkBoolOpt false "enable ${pluginName}";
        }
    )
    pluginList
  );
}
