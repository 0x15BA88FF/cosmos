{ ... }:
let
  username = "null";
in
{
  imports = [
    ./../../modules/home
    ./../../modules/shared
  ];

  modules.shared.stylix.enable = true;

  programs.home-manager.enable = true;

  home = {
    username = username;
    stateVersion = "25.05";
    homeDirectory = "/home/${username}";
  };
}
