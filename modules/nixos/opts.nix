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
    fishAliases = mkAttrOpt {} "fish shell aliases";

    fontSizes = mkAttrOpt {} "host font size settings";

    hostName = mkStrOpt "" "host name for configuration";

    hyprlockOpts = mkAttrOpt {} "hyprlock settings";

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote?";

    sops.user.enable = mkBoolOpt false "should sops handle user password?";

    adminUser = mkStrOpt "" "admin user";
    userNames = mkListOpt lib.types.str null "user names";
  };
}
