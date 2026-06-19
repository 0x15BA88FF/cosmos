{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot/efi";
                mountOptions = [
                  "defaults"
                  "umask=0077"
                ];
              };
            };
            lvm = {
              size = "100%";
              type = "8E00";
              content = {
                type = "lvm_pv";
                vg = "main_vg";
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      main_vg = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "20G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "defaults"
                "noatime"
              ];
            };
          };
          nix = {
            size = "100G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/nix";
              mountOptions = [
                "defaults"
                "noatime"
              ];
            };
          };
          home = {
            size = "100G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
              mountOptions = [
                "defaults"
                "noatime"
              ];
            };
          };
          # var = {
          #   size = "200G";
          #   content = {
          #     type = "filesystem";
          #     format = "ext4";
          #     mountpoint = "/var";
          #   };
          # };
        };
      };
    };
  };
}
