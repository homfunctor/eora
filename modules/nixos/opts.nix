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

    # for excessively fine-tuned control over hypr ecosystem
    hypr = {
      grimblast.pkg = mkAttrOpt pkgs.grimblast "package used";

      hyprcursor.pkg = mkAttrOpt pkgs.hyprcursor "package used";
      hypridle.pkg = mkAttrOpt pkgs.hypridle "package used";
      hyprland.pkg = mkAttrOpt pkgs.hyprland "package used";
      hyprlock = {
        opts = mkAttrOpt {} "settings";
        pkg = mkAttrOpt pkgs.hyprlock "package used";
      };
      hyprpanel.pkg = mkAttrOpt pkgs.hyprpanel "package used";
      hyprpaper.pkg = mkAttrOpt pkgs.hyprpaper "package used";

      portal = {
        exePath = mkStrOpt ".xdg-desktop-portal-hyprland-wrapped" "name of portal binary";
        pkg = mkAttrOpt pkgs.xdg-desktop-portal-hyprland "package used";
      };

      qtutils.pkg = mkAttrOpt pkgs.hyprland-qtutils "package used";

      quickshell.pkg = mkAttrOpt pkgs.quickshell "package used";
    };

    iconTheme = {
      name = mkStrOpt null "icon theme name";
      package = mkAttrOpt null "icon theme package";
    };

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote";

    loginCmd = mkStrOpt null "command for greetd";

    mainMonitor = mkStrOpt null "main monitor";

    niri = {
      pkg = mkAttrOpt pkgs.niri-stable "package used";
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

    wmName = mkStrOpt "uwsm" "use uwsm+hyprland or niri?";
  };
}
