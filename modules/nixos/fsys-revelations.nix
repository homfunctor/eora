{inputs, ...}: {
  imports = [
    inputs.sapadal.modules.nixos.fsys-revelations
  ];

  disko.devices = {
    disk.main = {
      device = "/dev/nvme0n1";
      type = "disk";

      content = {
        type = "gpt";

        partitions = {
          ESP = {
            size = "1G";
            type = "EF00";

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = ["fmask=0007" "umask=0077"];
            };
          };

          luks = {
            size = "100%";

            content = {
              name = "crypted";
              settings.allowDiscards = true;
              type = "luks";

              content = {
                type = "lvm_pv";
                vg = "pool";
              };
            };
          };
        };
      };
    };

    lvm_vg.pool = {
      type = "lvm_vg";

      lvs = {
        encryptedSwap = {
          size = "36G";

          content = {
            priority = 100;
            randomEncryption = true;
            type = "swap";
          };
        };

        root = {
          size = "100%FREE";

          content = {
            format = "ext4";
            mountOptions = ["defaults"];
            mountpoint = "/";
            type = "filesystem";
          };
        };
      };
    };
  };
}
