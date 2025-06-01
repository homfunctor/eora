# CAUTION: fuck this up and you'll need to defile /nix/store
# revelations
{
  boot.initrd.luks.devices = {
    "luks-f59f3ff2-dd4c-4834-87da-49c1bba40547" = {
      device = "/dev/disk/by-uuid/f59f3ff2-dd4c-4834-87da-49c1bba40547";
    };

    "luks-281c0d56-8ecc-4ea3-b7db-2768fbd7e2b4" = {
      device = "/dev/disk/by-uuid/281c0d56-8ecc-4ea3-b7db-2768fbd7e2b4";
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/881459ca-a11b-42cd-905f-7075be4fbbfc";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/6495-6D7F";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    "/home/wael/mnt/Backup" = {
      device = "/dev/disk/by-uuid/1e696d71-5404-444c-a218-f8bdb447637b";
      fsType = "ext4";
    };

    "/home/wael/mnt/Media" = {
      device = "/dev/disk/by-uuid/f8fee7ba-3e29-4880-bad9-50b3cbd63389";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/6fb227ff-0b15-478a-9c8b-686cadee6461";
    }
  ];
}
