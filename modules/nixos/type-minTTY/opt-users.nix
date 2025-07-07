{
  config,
  lib,
  ...
}: {
  users.users = lib.genAttrs config.nixos.opts.userNames (
    user: {
      description = user;
      extraGroups = [
        "adbusers"
        "audio"
        "gamemode"
        "input"
        "networkmanager"
        "power"
        "scanners"
        "sys"
        "udev"
        "video"
        "wheel"
      ];
      isNormalUser = true;
    }
  );
}
