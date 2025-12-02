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
        "disk"
        "gamemode"
        "input"
        "kvm"
        "libvirtd"
        "networkmanager"
        "plugdev"
        "power"
        "qemu-libvirtd"
        "scanners"
        "uinput"
        "video"
        "wheel"
      ];
      isNormalUser = true;
    }
  );
}
