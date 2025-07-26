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
        "libvirtd"
        "networkmanager"
        "power"
        "scanners"
        "video"
        "wheel"
      ];
      isNormalUser = true;
    }
  );
}
