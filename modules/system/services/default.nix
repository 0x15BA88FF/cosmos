{ lib, ... }: {
  imports = [ ./kanata.nix ];

  systemModules.kanata.enable = lib.mkDefault true;
}
