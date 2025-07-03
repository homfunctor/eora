# keeping all declared options here. results in an ever expanding file
# but it's better than declaring them all over the place
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

    cosmic-greeter = mkAttrOpt {} "cosmic-greeter settings";

    customUserDirs = mkAttrOpt {} "custom settings for user directories (XDG)";

    defaultApps = mkAttrOpt {} "default applications (mime)";

    hyprlandEnv = mkAttrOpt {} "various hyprland environment settings";
    hyprlandOpts = mkAttrOpt {} "user options for hyprland";

    # hpl: hyprpanel
    hplFontSize = mkStrOpt "1.2rem" "hyprpanel button and bar font size";
    hplLayout = mkAttrOpt {} "user options for hyprpanel layout";
    hplScale = genAttrs [
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
    ] (name: mkIntOpt 100 "scale for ${name}");

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

    launcherColumns = mkIntOpt 4 "number of columns in nwg-drawer";

    # syncthing
    sync = {
      versioning = mkAttrOpt {
        type = "simple";
        params = {
          keep = "10";
          cleanoutDays = "0";
        };
      } "default versioning settings";

      folder =
        genAttrs (importAllFileNames ./type-work/app-syncthing/sync-folders)
        (name: {enable = mkBoolOpt false "sync ${name}";});
    };

    hostName = mkStrOpt "" "host name. name of host. that by which the host is named";
    userName = mkStrOpt "" "user name. name of user. that by which the user is named.";
  };
}
