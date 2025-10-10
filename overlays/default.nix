[
  (final: prev: {
    devctl = prev.callPackage ./devctl/default.nix { };
    notectl = prev.callPackage ./notectl/default.nix { };
  })
]
