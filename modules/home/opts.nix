{
  flake,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (flake.lib) mkAttrOpt mkBoolOpt mkIntOpt mkStrOpt;
  inherit (lib) nameValuePair;
in {
  options.home.opts = {
    customUserDirs = mkAttrOpt {} "custom settings for user directories";
    defaultApps = mkAttrOpt {} "default applications";

    hostname = mkStrOpt "" "hostname";

    hyprlandOpts = mkAttrOpt {} "user options for hyprland";
    hyprpaperOpts = mkAttrOpt {} "user options for hyprpaper";
    hyprpanelLayout = mkAttrOpt {} "user options for hyprpanel layout";
    hyprpanelScale = mkIntOpt 75 "scaling factor for hyprpanel";

    nixvim.plugins = {
      foo.enable = mkBoolOpt false "enable foo";
    };

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
          "Rust"
          "Work"
        ];
      in
        listToAttrs (
          map (
            folderName:
              nameValuePair folderName {
                enable = mkBoolOpt false "sync ${folderName}";
              }
          )
          folderNames
        );
    };

    username = mkStrOpt "" "username";
  };
}
