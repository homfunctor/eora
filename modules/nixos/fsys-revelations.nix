# /root on NVMe SSD
# media files on HDD mounted at /vault
# both LUKS-encrypted
# swap also
{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/nvme0n1";
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";

              content = {
                format = "vfat";
                mountOptions = ["fmask=0007" "umask=0077"];
                mountpoint = "/boot";
                type = "filesystem";
              };
            };

            luks = {
              size = "100%";

              content = {
                name = "obscured";
                settings.allowDiscards = true;
                type = "luks";

                content = {
                  type = "lvm_pv";
                  vg = "mainpool";
                };
              };
            };
          };
        };
      };

      media = {
        device = "/dev/sda";
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            luks = {
              size = "100%";

              content = {
                name = "vault";
                settings.allowDiscards = true;
                type = "luks";

                content = {
                  type = "lvm_pv";
                  vg = "mediapool";
                };
              };
            };
          };
        };
      };
    };

    lvm_vg = {
      mainpool = {
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

      mediapool = {
        type = "lvm_vg";

        lvs = {
          media = {
            size = "100%FREE";

            content = {
              format = "ext4";
              mountOptions = ["defaults"];
              mountpoint = "/vault";
              type = "filesystem";
            };
          };
        };
      };
    };
  };
}
