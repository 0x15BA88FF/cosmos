{ lib, ... }:
{
  imports = [ ./null ];

  user.null.enable = lib.mkDefault true;
}
