{ lib, ... }:
{
  imports = [ ./stylix.nix ];

  modules.shared.stylix.enable = lib.mkDefault false;
}
