{
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) mkAttrOpt mkBoolOpt mkListOpt mkStrOpt;
in {
  options.nixos.opts = {
    dewm = {
      de-cosmic.enable = mkBoolOpt false "enable cosmic desktop environment";
      wm-hyprland.enable = mkBoolOpt false "enable hyprland window manager";
    };

    fontSizes = mkAttrOpt {} "host font size settings";

    hostname = mkStrOpt "" "host name for configuration";

    lanzaboote.enable = mkBoolOpt false "enable lanzaboote?";

    sops.user.enable = mkBoolOpt false "should sops handle user password?";

    adminuser = mkStrOpt "" "admin user";
    usernames = mkListOpt lib.types.str null "user names";
  };
}
