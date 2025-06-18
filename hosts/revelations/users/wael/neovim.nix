{
  config,
  lib,
  ...
}: let
  inherit (lib) genAttrs subtractLists;

  # remove unwanted plugins
  enabledPlugins =
    subtractLists
    []
    config.opts.home.nvim.defaultPluginList;
in {
  config.opts.home.nvim.plugins = genAttrs enabledPlugins (
    pluginName: {
      enable = true;
    }
  );
}
