# keeping all declared options here. results in an ever expanding file
# but i prefer it to declaring them all over the place
{
  flake,
  lib,
  pkgs,
  ...
}: let
  inherit
    (flake.lib)
    mkAttrOpt
    mkBoolOpt
    mkFloatOpt
    mkListOpt
    mkStrOpt
    ;
in {
  options.nixos.opts = {
    # monitors, resolutions, xy (positions)
    bg = mkAttrOpt {} "per host background/monitor settings";

    fontSizes = mkAttrOpt {} "font size settings";

    hostName = mkStrOpt "" "host name";

    iconTheme = {
      name = mkStrOpt null "icon theme name";
      package = mkAttrOpt null "icon theme package";
    };

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote";

    mainMonitor = mkStrOpt null "main monitor";

    niri = {
      bar.widgets = mkAttrOpt null "noctalia shell bar widgets";
      controlCenter = {
        cards = mkListOpt lib.types.attrs null "noctalia shell controlCenter shortcuts";

        shortcuts = mkAttrOpt null "noctalia shell controlCenter shortcuts";
      };
      misc = mkAttrOpt null "misc noctalia-shell.settings";
      wm.pkg = mkAttrOpt pkgs.niri "pkg";
    };

    opacity = {
      desktop = mkFloatOpt 1.0 "desktop opacity";
      popups = mkFloatOpt 0.95 "popups opacity";
      terminal = mkFloatOpt 0.70 "terminal opacity";
    };

    shell = mkStrOpt "fish" "shell to use";
    shellAliases = mkAttrOpt {} "shell aliases";

    sops = {
      syncthing.enable = mkBoolOpt false "manage cert/key with sops";
      user.enable = mkBoolOpt false "set (hashed) password with sops";
    };

    adminUser = mkStrOpt "" "admin user";
    userNames = mkListOpt lib.types.str null "user names";

    wlrBR = mkStrOpt "wayland" "requested backend/renderer for wayland";
  };
}
