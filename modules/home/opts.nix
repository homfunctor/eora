# keeping all declared options here. results in an ever expanding file
# but i prefer it to declaring them all over the place
{
  flake,
  lib,
  ...
}: let
  inherit
    (flake.lib)
    importAllFileNames
    mkAttrOpt
    mkBoolOpt
    mkIntOpt
    mkStrOpt
    ;
  inherit (lib) genAttrs;
in {
  options.home.opts = {
    # finer control over which are enabled as some are very bulky
    app-math = {
      geogebra.enable = mkBoolOpt false "enable geogebra";
      latex.enable = mkBoolOpt false "enable latex and tex-fmt";
      octave.enable = mkBoolOpt false "enable octave";
      rstudio.enable = mkBoolOpt false "enable rstudio";
    };

    # for xdg mimeapps, hyprpanel, hyprland binds, etc.
    apps = mkAttrOpt {} "monolithic default application settings";

    # background paths (files). inherited from osConfig: monitors, resolutions, xy
    bg = mkAttrOpt {} "per-user background settings";

    # mainly just for wael@revelations media files on /vault
    customUserDirs = mkAttrOpt {} "custom settings for user directories (XDG)";

    hostName = mkStrOpt "" "host name. name of host. that by which the host is named.";
    userName = mkStrOpt "" "user name. name of user. that by which the user is named.";

    # inherited from osConfig
    mainMonitor = mkStrOpt null "main monitor";

    # neovim plugin options auto-generated from filenames
    nvim.plugins = let
      pluginNames = importAllFileNames ./type-niceTTY/app-neovim/plugins;
    in
      genAttrs pluginNames (name: {
        enable = mkBoolOpt false "enable ${name}";
      });

    # hyprpanel settings
    panelOpts = {
      fontSize = mkStrOpt "1.0rem" "hyprpanel button and bar font size";
      layouts = mkAttrOpt {} "user settings for hyprpanel layout";
      scale = let
        uiElems = [
          "bar"
          "battery"
          "clock"
          "dashboard"
          "media"
          "notification"
          "notifications"
          "osd"
          "popover"
          "power"
          "volume"
        ];
      in
        genAttrs uiElems (name: mkIntOpt 100 "scale for ${name}");

      # shortcuts for hyprpanel dashboard menu
      leftcuts = genAttrs ["shortcut1" "shortcut2" "shortcut3" "shortcut4"] (
        name: mkAttrOpt {} "${name} settings"
      );

      rightcuts =
        genAttrs ["shortcut1" "shortcut3"] (name:
          mkAttrOpt {} "${name} settings");

      # directories for hyprpanel dashboard menu
      leftdirs =
        genAttrs ["directory1" "directory2" "directory3"] (name:
          mkAttrOpt {} "${name} settings");

      rightdirs =
        genAttrs ["directory1" "directory2" "directory3"] (name:
          mkAttrOpt {} "${name} settings");
    };

    startCmd = mkAttrOpt null "start up commands in a format both niri and hyprland can use";

    # syncthing
    sync = {
      versioning = mkAttrOpt {
        params = {
          cleanoutDays = "0";
          keep = "10";
        };
        type = "simple";
      } "default versioning settings";

      folder =
        genAttrs (
          importAllFileNames ./type-work/app-syncthing/sync-folders
        ) (name: {
          enable = mkBoolOpt false "sync ${name}";
        });
    };
  };
}
