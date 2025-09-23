{ lib, ... }: {
  imports =
    [ ./openssh.nix ./tor.nix ./docker.nix ./kanata.nix ./tailscale.nix ];

  systemModules.tor.enable = lib.mkDefault true;
  systemModules.docker.enable = lib.mkDefault true;
  systemModules.kanata.enable = lib.mkDefault true;
  systemModules.openssh.enable = lib.mkDefault true;
  systemModules.tailscale.enable = lib.mkDefault true;
}
