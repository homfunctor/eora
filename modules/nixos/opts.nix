# keeping all declared options here. results in an ever expanding file
# but i prefer it to declaring them all over the place
{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkAttrOpt mkBoolOpt mkListOpt mkStrOpt;
in {
  options.nixos.opts = {
    # monitors, resolutions, xy (positions)
    bg = mkAttrOpt {} "per host background/monitor settings";

    fishAliases = mkAttrOpt {} "fish shell aliases";

    fontSizes = mkAttrOpt {} "font size settings";

    hostName = mkStrOpt "" "host name";

    hyprlockOpts = mkAttrOpt {} "hyprlock settings";

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote";

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
