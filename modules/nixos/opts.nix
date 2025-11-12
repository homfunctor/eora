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

    fishAliases = mkAttrOpt {} "fish shell aliases";

    fontSizes = mkAttrOpt {} "font size settings";

    hostName = mkStrOpt "" "host name";

    # for excessively fine-tuned control over hypr ecosystem
    hypr = {
      grimblast.pkg = pkgs.grimblast;

      hy3.pkg = pkgs.hyrplandPlugins.hy3;
      hyprbars.pkg = pkgs.hyprandPlugins.hyprbars;
      hyprcursor.pkg = pkgs.hyprcursor;
      hyprexpo.pkg = pkgs.hyprlandPlugins.hyprexpo;
      hyprland.pkg = pkgs.hyprland;
      hyprlock = {
        opts = mkAttrOpt {} "hyprlock settings";
        pkg = pkgs.hyprlock;
      };
      hyprpanel.pkg = pkgs.hyprpanel;
      hyprpaper.pkg = pkgs.hyprpaper;
      hyprpicker.pkg = pkgs.hyprpicker;
      hyprshell.pkg = pkgs.hyprshell;

      portal = {
        exe = ".xdg-desktop-portal-hyprland-wrapped";
        pkg = pkgs.xdg-desktop-portal-hyprland;
      };

      qtutils.pkg = pkgs.hyprland-qutils;
    };

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote";

    mainMonitor = mkStrOpt null "main monitor";

    opacity = {
      desktop = mkFloatOpt 1.0 "desktop opacity";
      popups = mkFloatOpt 0.95 "popups opacity";
      terminal = mkFloatOpt 0.80 "terminal opacity";
    };

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
