{
  flake,
  lib,
  ...
}: let
  inherit (builtins) readDir;
  inherit (flake.lib) importAllFileNames mkBoolOpt;
  inherit
    (lib)
    attrNames
    filterAttrs
    genAttrs
    hasSuffix
    pipe
    removeSuffix
    ;

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
