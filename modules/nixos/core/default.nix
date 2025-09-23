{ lib, ... }: {
  imports = [ ./grub.nix ./console.nix ];

  systemModules.console = {
    enable = lib.mkDefault true;
    style.enable = lib.mkDefault true;
  };

  systemModules.grub = {
    enable = lib.mkDefault true;
    style.enable = lib.mkDefault true;
  };
}
