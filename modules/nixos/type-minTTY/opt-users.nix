{
  config,
  lib,
  ...
}: {
  users.users = lib.genAttrs config.nixos.opts.userNames (
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
