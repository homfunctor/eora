{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkAttrOpt mkBoolOpt mkIntOpt mkStrOpt;
  inherit (lib) genAttrs;
in {
  options.home.opts = {
    customUserDirs = mkAttrOpt {} "custom settings for user directories";
    defaultApps = mkAttrOpt {} "default applications";

    hostname = mkStrOpt "" "hostname";

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

      folder = let
        folderNames = [
          "Books"
          "Fish"
          "Life"
          "Math"
          "Misc"
          "Nix"
          "Python"
          "Rust"
          "Work"
        ];
      in
        genAttrs folderNames (
          folderName: {
            enable = mkBoolOpt false "sync ${folderName}";
          }
        );
    };

    username = mkStrOpt "" "username";
  };
}
