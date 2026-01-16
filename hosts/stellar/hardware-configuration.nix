{
  lib,
  config,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [
        "ahci"
        "sd_mod"
        "sr_mod"
        "ehci_pci"
        "sdhci_pci"
        "usb_storage"
      ];
    };
    extraModulePackages = [ ];
    kernelModules = [ "kvm-intel" ];
  };

  fileSystems."/" = {
    fsType = "ext4";
    device = "/dev/main_vg/root";
    options = [ "noatime" "defaults" ];
  };

  fileSystems."/nix" = {
    fsType = "ext4";
    device = "/dev/main_vg/nix";
    options = [ "noatime" "defaults" ];
  };

  fileSystems."/home" = {
    fsType = "ext4";
    device = "/dev/main_vg/home";
    options = [ "noatime" "defaults" ];
  };

  fileSystems."/boot/efi" = {
    fsType = "vfat";
    device = "/dev/disk/by-partlabel/disk-main-boot";
    options = [ "umask=0077" ];
  };

  swapDevices = [
    {
      device = "/dev/main_vg/swap";
    }
  ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
