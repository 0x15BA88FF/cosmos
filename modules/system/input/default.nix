{ lib, ... }:
{
  imports = [ ./kanata.nix ];

  modules.input.kanata.enable = lib.mkDefault false;
}
