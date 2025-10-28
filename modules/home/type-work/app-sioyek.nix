{
  lib,
  config,
  ...
}: let
  inherit (lib) mkForce;
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.sioyek = {
    enable = true;
  };
}
