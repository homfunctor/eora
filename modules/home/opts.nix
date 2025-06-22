{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) importAllFileNames listToOpts mkAttrOpt mkBoolOpt mkIntOpt mkStrOpt;
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

    customUserDirs = mkAttrOpt {} "custom settings for user directories";
    defaultApps = mkAttrOpt {} "default applications";

    fixWinetricks.enable = mkBoolOpt false "fix winetricks";

    hostname = mkStrOpt "" "hostname";

    hyprlandEnv = mkAttrOpt {} "various hyprland environment settings";
    hyprlandOpts = mkAttrOpt {} "user options for hyprland";
    hyprpanelLayout = mkAttrOpt {} "user options for hyprpanel layout";
    hyprpanelScale = mkIntOpt 75 "scaling factor for hyprpanel";
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
        listToOpts (
          importAllFileNames ./type-work/app-syncthing/sync-folders
        ) {
          enable = mkBoolOpt false "enable sync";
        };
    };

    username = mkStrOpt "" "username";
  };
}
