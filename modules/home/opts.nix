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

    # neovim options
    nvim.plugins = let
      pluginNames = importAllFileNames ./type-niceTTY/app-neovim/plugins;
    in
      genAttrs pluginNames (
        pluginName: {
          enable = mkBoolOpt false "enable ${pluginName}";
        }
      );

    cosmic-greeter = mkAttrOpt {} "cosmic-greeter settings";

    customUserDirs = mkAttrOpt {} "custom settings for user directories (XDG)";

    defaultApps = mkAttrOpt {} "default applications (mime)";

    hyprlandEnv = mkAttrOpt {} "various hyprland environment settings";
    hyprlandOpts = mkAttrOpt {} "user options for hyprland";

    # hpl: hyprpanel
    hplFontSize = mkStrOpt "1.2rem" "hyprpanel button and bar font size";
    hplLayout = mkAttrOpt {} "user options for hyprpanel layout";
    hplScale = let
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
      genAttrs uiElems (
        name: mkIntOpt 100 "scale for ${name}"
      );

    # shortcuts for hyprpanel dashboard menu
    hplLeftcuts = genAttrs [
      "shortcut1"
      "shortcut2"
      "shortcut3"
      "shortcut4"
    ] (name: mkAttrOpt {} "${name} settings");

    hplRightcuts = genAttrs [
      "shortcut1"
      "shortcut3"
    ] (name: mkAttrOpt {} "${name} settings");

    # directories for hyprpanel dashboard menu
    hplLeftdir = genAttrs [
      "directory1"
      "directory2"
      "directory3"
    ] (name: mkAttrOpt {} "${name} settings");

    hplRightdir = genAttrs [
      "directory1"
      "directory2"
      "directory3"
    ] (name: mkAttrOpt {} "${name} settings");

    hyprpaperOpts = mkAttrOpt {} "user options for hyprpaper";

    # syncthing
    sync = {
      versioning = mkAttrOpt {
        type = "simple";
        params = {
          keep = "10";
          cleanoutDays = "0";
        };
      } "default versioning settings";

      folder = let
        folderNames = importAllFileNames ./type-work/app-syncthing/sync-folders;
      in
        genAttrs folderNames (
          name: {enable = mkBoolOpt false "sync ${name}";}
        );
    };

    hostName = mkStrOpt "" "host name. name of host. that by which the host is named";
    userName = mkStrOpt "" "user name. name of user. that by which the user is named.";
  };
}
