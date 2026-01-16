{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
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
            luks = {
              size = "350G";
              type = "8309";
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
          swap = {
            size = "8G";
            content = {
              type = "swap";
              resumeDevice = true;
            };
          };
          nix = {
            size = "50G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/nix";
              mountOptions = [ "defaults" "noatime" ];
            };
          };
          root = {
            size = "50G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [ "defaults" "noatime" ];
            };
          };
          home = {
            size = "100%FREE";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
              mountOptions = [ "defaults" "noatime" ];
            };
          };
        };
      };
    };
  };
}
