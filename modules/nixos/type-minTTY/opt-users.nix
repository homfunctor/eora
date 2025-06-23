{
  config,
  lib,
  ...
}: let
  inherit (config.nixos.opts) usernames;
  inherit (lib) genAttrs;
in {
  # lesson learned: read the manual
  users.users = genAttrs usernames (
    user: {
      description = user;
      extraGroups = [
        "audio"
        "gamemode"
        "input"
        "networkmanager"
        "scanners"
        "sys"
        "video"
        "wheel"
      ];
      isNormalUser = true;
    }
  );
}
