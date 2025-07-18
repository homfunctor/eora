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

    fontSizes = mkAttrOpt {} "host font size settings";

    hostName = mkStrOpt "" "host name for configuration";

    hyprlockOpts = mkAttrOpt {} "hyprlock settings";

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote";

    sops = {
      keyring.enable = mkBoolOpt false "unlock keyring on autologin with sops";
      user.enable = mkBoolOpt false "set password with sops";
    };

    adminUser = mkStrOpt "" "admin user";
    userNames = mkListOpt lib.types.str null "user names";

    wlrBR = mkStrOpt "wayland" "backend and renderer for wlroots";
  };
}
