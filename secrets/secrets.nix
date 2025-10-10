let
  user-null =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINWguk/SXyfp6EC55P74qa00GL34+G5uSjVywzveyHAb";

  system-stellar =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPaUhhSZxExgHA0HYnjDDVbonRz9yDwXhO37c3L4m7Zx";

  all-systems = [ system-stellar ];
in
{
  "luks-secret-stellar.age".publicKeys = [ system-stellar ];
  "password-user-null.age".publicKeys = [ user-null ] ++ all-systems;
}
