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

    shellAliases = mkAttrOpt {} "shell aliases";

    fontSizes = mkAttrOpt {} "font size settings";

    hostName = mkStrOpt "" "host name";

    iconTheme = {
      name = mkStrOpt null "icon theme name";
      package = mkAttrOpt null "icon theme package";
    };

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote";

    loginCmd = mkStrOpt null "command for greetd";

    mainMonitor = mkStrOpt null "main monitor";

    niri = {
      pkg = mkAttrOpt pkgs.niri-stable "pkg";

      bar.pkg = mkAttrOpt pkgs.waybar "pkg";
      bg = {
        args = mkStrOpt "" "args";
        pkg = mkAttrOpt pkgs.swaybg "pkg";
      };
      idle.pkg = mkAttrOpt pkgs.swayidle "pkg";
      locker.pkg = mkAttrOpt pkgs.swaylock "pkg";
      portal.pkg = mkAttrOpt pkgs.xdg-desktop-portal-gtk "pkg";
    };

    opacity = {
      desktop = mkFloatOpt 1.0 "desktop opacity";
      popups = mkFloatOpt 0.95 "popups opacity";
      terminal = mkFloatOpt 0.80 "terminal opacity";
    };

    shell = mkStrOpt "fish" "shell to use";

    sops = {
      keyring.enable = mkBoolOpt false "unlock keyring on login with sops";
      syncthing.enable = mkBoolOpt false "manage cert/key with sops";
      user.enable = mkBoolOpt false "set (hashed) password with sops";
    };

    adminUser = mkStrOpt "" "admin user";
    userNames = mkListOpt lib.types.str null "user names";

    wlrBR = mkStrOpt "wayland" "requested backend/renderer for wayland";
  };
}
