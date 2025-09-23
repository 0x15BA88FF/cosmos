{ lib, ... }: {
  imports = [ ./docker.nix ];

  systemModules.docker.enable = lib.mkDefault true;
}
