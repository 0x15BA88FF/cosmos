{ pkgs }: [
  (import ./chtsh.nix { inherit pkgs; })
  (import ./dev-sessionizer.nix { inherit pkgs; })
  (import ./note-sessionizer.nix { inherit pkgs; })
  (import ./file-sessionizer.nix { inherit pkgs; })
]
