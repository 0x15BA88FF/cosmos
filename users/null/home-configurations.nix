{ ... }:
let
  username = "null";
in
{
  imports = [
    ./../../modules/home/default.nix
    ./../../modules/shared/stylix.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = username;
    stateVersion = "25.05";
    homeDirectory = "/home/${username}";
  };
}
