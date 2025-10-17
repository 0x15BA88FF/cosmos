{ lib, ... }:
{
  imports = [ ./null/default.nix ];

  user.null.enable = lib.mkDefault true;
}
