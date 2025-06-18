{
  config,
  lib,
  ...
}: let
  inherit (lib) genAttrs subtractLists;

  # remove plugins to disable
  enabledPlugins =
    subtractLists [
      "noice"
    ]
    config.opts.home.nvim.defaultPluginList;
in {
  config.opts.home.nvim.plugins = genAttrs enabledPlugins (
    pluginName: {
      enable = true;
    }
  );
}
