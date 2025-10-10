{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf;
  };

  home.packages = import ./scripts/default.nix { inherit pkgs; };
}
