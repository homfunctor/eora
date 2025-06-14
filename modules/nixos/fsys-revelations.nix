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
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["fmask=0007" "umask=0077"];
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
                  vg = "pool";
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
                  vg = "pool";
                };
              };
            };
          };
        };
      };
    };

    lvm_vg.pool = {
      type = "lvm_vg";

      lvs = {
        aaa.size = "1M";
        zzz.size = "1M";

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

        media = {
          size = "100%FREE";

          content = {
            format = "ext4";
            mountOptions = ["defaults"];
            mountpoint = "/media";
            type = "filesystem";
          };
        };
      };
    };
  };
}
