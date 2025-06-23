{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkAttrOpt mkBoolOpt mkListOpt mkStrOpt;
in {
  options.nixos.opts = {
    fontSizes = mkAttrOpt {} "host font size settings";

    hostName = mkStrOpt "" "host name for configuration";

    hyprlockOpts = mkAttrOpt {} "hyprlock settings";

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote?";

    sops.user.enable = mkBoolOpt false "should sops handle user password?";

    adminuser = mkStrOpt "" "admin user";
    usernames = mkListOpt lib.types.str null "user names";
  };
}
