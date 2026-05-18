{ ... }:
let
  username = "null";
in
{
  imports = (import ../../modules).home;

  modules.shared.stylix.enable = true;

  programs.home-manager.enable = true;

  home = {
    username = username;
    stateVersion = "25.05";
    homeDirectory = "/home/${username}";
  };
}
