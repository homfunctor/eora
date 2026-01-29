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

    # for xdg mimeapps, binds, etc.
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
    nvim = {
      # base16? no, base20
      extraColors = mkAttrOpt {
        Boolean.fg = "#5A6B9C";
        Comment = {
          fg = "#8B7AA3";
          italic = true;
        };
        Keyword.fg = "#7ABF9E";
        Number.fg = "#4A6B8A";
      } "";

      # automatically prepare options for all neovim plugin modules
      plugins = let
        pluginNames = importAllFileNames ./type-niceTTY/app-neovim/plugins;
      in
        genAttrs pluginNames (name: {
          enable = mkBoolOpt false "enable ${name}";
        });
    };

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
