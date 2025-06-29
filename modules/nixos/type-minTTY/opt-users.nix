{
  config,
  lib,
  ...
}: let
  inherit (config.nixos.opts) userNames;
in {
  users.users = lib.genAttrs userNames (
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
