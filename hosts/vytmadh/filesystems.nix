# CAUTION: fuck this up and you'll need to defile /nix/store
# vytmadh
{
  boot.initrd.luks.devices = {
    "luks-3aef97eb-2987-4440-982d-7662f7deb984" = {
      device = "/dev/disk/by-uuid/3aef97eb-2987-4440-982d-7662f7deb984";
    };

    "luks-43a3bded-942e-4271-8bac-1f037617c899" = {
      device = "/dev/disk/by-uuid/43a3bded-942e-4271-8bac-1f037617c899";
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/79f83cb5-950b-4391-9ffb-2710b75a5426";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/9CC0-9280";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/3676f9de-001b-4220-aeea-09e1b83ba5b7";
    }
  ];
}
