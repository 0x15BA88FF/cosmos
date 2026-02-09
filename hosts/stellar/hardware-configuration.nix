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

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
