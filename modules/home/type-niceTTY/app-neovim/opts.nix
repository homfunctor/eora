{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) importAllFileNames mkBoolOpt;
  inherit (lib) genAttrs;

  pluginList = importAllFileNames ./plugins;
in {
  options.home.opts.nvim = {
    plugins = genAttrs pluginList (
      pluginName: {
        enable = mkBoolOpt false "enable ${pluginName}";
      }
    );
  };
}
