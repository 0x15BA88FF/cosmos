{ lib, ... }: {
  imports = [ ./tor.nix ./openssh.nix ./tailscale.nix ];

  systemModules.tor.enable = lib.mkDefault true;
  systemModules.openssh.enable = lib.mkDefault true;
  systemModules.tailscale.enable = lib.mkDefault true;
}
