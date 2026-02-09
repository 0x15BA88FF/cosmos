{ lib, ... }:
{
  imports = [ ./kanata.nix ];

  modules.system.kanata.enable = lib.mkDefault false;
}
