{ pkgs }:
[
  (import ./cht.sh.nix { inherit pkgs; })
  (import ./sessionizer.nix { inherit pkgs; })
  (import ./dev-sessionizer.nix { inherit pkgs; })
  (import ./file-sessionizer.nix { inherit pkgs; })
]
