{
  flake,
  lib,
  ...
}: let
  inherit (lib) genAttrs;
  inherit
    (flake.lib)
    importAllFileNames
    mkAttrOpt
    mkBoolOpt
    mkIntOpt
    mkStrOpt
    ;
in {
  options.home.opts = {
    # finer control over which are enabled as some are very bulky
    app-math = {
      geogebra.enable = mkBoolOpt false "enable geogebra";
      latex.enable = mkBoolOpt false "enable latex and tex-fmt";
      octave.enable = mkBoolOpt false "enable octave";
      rstudio.enable = mkBoolOpt false "enable rstudio";
    };

    customUserDirs = mkAttrOpt {} "custom settings for user directories";
    defaultApps = mkAttrOpt {} "default applications";

    hostName =
      mkStrOpt ""
      "host name. name of host. that by which the host is named";

    hyprlandEnv = mkAttrOpt {} "various hyprland environment settings";
    hyprlandOpts = mkAttrOpt {} "user options for hyprland";

    # hpl: hyprpanel
    hplFontSize = mkStrOpt "1.2rem" "hyprpanel button and bar font size";
    hplLayout = mkAttrOpt {} "user options for hyprpanel layout";
    hplScale =
      genAttrs [
        "bar"
        "battery"
        "clock"
        "notification"
        "notifications"
        "osd"
        "popover"
        "power"
        "volume"
      ] (
        name:
          mkIntOpt 100 "scale for ${name}"
      );

    hyprpaperOpts = mkAttrOpt {} "user options for hyprpaper";

    rofi.columns = mkIntOpt 4 "number of columns to use in rofi";

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
        (
          name: {
            enable = mkBoolOpt false "sync ${name}";
          }
        );
    };

    userName = mkStrOpt "" "user name. that by which the user is named.";
  };
}
