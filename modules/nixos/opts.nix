{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkAttrOpt mkBoolOpt mkListOpt mkStrOpt;
in {
  options.nixos.opts = {
    fontSizes = mkAttrOpt {} "host font size settings";

    hostname = mkStrOpt "" "host name for configuration";

    # secrets handled by sops
    sops = {
      syncthing.enable = mkBoolOpt false "should sops handle syncthing?";
      user.enable = mkBoolOpt false "should sops handle user password?";
    };

    adminuser = mkStrOpt "" "admin user";
    usernames = mkListOpt lib.types.str null "user names";
  };
}
