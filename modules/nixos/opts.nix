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

    hyprGit = mkBoolOpt 0 "nixpkgs (0) or git (1)?";
    hyprPkg = mkAttrOpt pkgs.hyprland "hyprland package";

    hyprlockOpts = mkAttrOpt {} "hyprlock settings";

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
