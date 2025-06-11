{
  config,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (config.nixos.opts) usernames;
  inherit (lib) nameValuePair;
in {
  # take each username and make a user with it
  users.users = listToAttrs (
    map (
      user:
        nameValuePair user {
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
    )
    usernames
  );
}
