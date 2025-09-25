{ ... }: {
  imports = [
    ./boot/default.nix
    ./input/default.nix
    ./system/default.nix
    ./networking/default.nix
    ./virtualisation/default.nix
  ];
}
