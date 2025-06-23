{
  config,
  lib,
  ...
}: let
  inherit (config.nixos.opts) usernames;
in {
  users.users = lib.genAttrs usernames (
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
